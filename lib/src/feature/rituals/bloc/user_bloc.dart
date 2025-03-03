import 'package:bloc/bloc.dart';
import 'package:chicken_hatchery/src/feature/rituals/model/articles.dart';
import 'package:chicken_hatchery/src/feature/rituals/model/egg_batch.dart';
import 'package:equatable/equatable.dart';
import 'package:chicken_hatchery/src/core/dependency_injection.dart';
import 'package:chicken_hatchery/src/feature/rituals/model/user.dart';
import 'package:chicken_hatchery/src/feature/rituals/repository/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final Repository userRepository = locator<Repository>();

  UserBloc() : super(const UserLoading()) {
    on<UserLoadData>(_onUserLoadData);
    on<UserAddBatch>(_onUserAddBatch);
    on<UserUpdateBatch>(_onUserUpdateBatch);
  }

  Future<void> _onUserLoadData(
    UserLoadData event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserLoading());
    try {
      // Репозиторий возвращает список пользователей; берём первого или init
      final users = await userRepository.load();
      final user = users.isNotEmpty ? users.first : User.init;

      if (users.isEmpty) {
        userRepository.save(user);
      }

      final articles = await userRepository.loadArticles();

      emit(
        UserLoaded(
          user: user,
          articles: articles,
        ),
      );
    } catch (e) {
      emit(UserError('Произошла ошибка при загрузке: $e'));
    }
  }

  Future<void> _onUserAddBatch(
    UserAddBatch event,
    Emitter<UserState> emit,
  ) async {
    if (state is UserLoaded) {
      final currentState = state as UserLoaded;
      final currentUser = currentState.user;

      // Создаём обновлённый список партий, добавляя новую партию
      final updatedBatches = List<EggBatch>.from(currentUser.eggBatches)
        ..add(event.batch);

      // Пересчитываем статистику на основе нового списка партий
      currentUser.updateStatistics(event.currentDay);

      // Создаём нового пользователя с обновлёнными данными
      final updatedUser = currentUser.copyWith(
        eggBatches: updatedBatches,
      );

      // Сохраняем нового пользователя
      await userRepository.save(updatedUser);

      emit(
        UserLoaded(
          user: updatedUser,
          articles: currentState.articles,
        ),
      );
    }
  }

  Future<void> _onUserUpdateBatch(
    UserUpdateBatch event,
    Emitter<UserState> emit,
  ) async {
    if (state is UserLoaded) {
      final currentState = state as UserLoaded;
      final currentUser = currentState.user;

      // Обновляем партию. Предполагается, что каждая партия идентифицируется уникальным именем.
      final updatedBatches = currentUser.eggBatches.map((batch) {
        if (batch.name == event.batch.name) {
          return event.batch;
        }
        return batch;
      }).toList();

      // Пересчитываем статистику после изменения партии
      currentUser.updateStatistics(event.currentDay);

      // Создаём нового пользователя с обновлёнными данными
      final updatedUser = currentUser.copyWith(
        eggBatches: updatedBatches,
      );

      // Сохраняем обновлённого пользователя
      await userRepository.save(updatedUser);

      emit(
        UserLoaded(
          user: updatedUser,
          articles: currentState.articles,
        ),
      );
    }
  }
}
