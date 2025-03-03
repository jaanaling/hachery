part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

/// Загрузка данных пользователя и богов (как и раньше)
class UserLoadData extends UserEvent {
  const UserLoadData();
}

/// Добавление ID ритуала в список выполненных
class UserAddRitual extends UserEvent {
  final String ritualId;

  const UserAddRitual(this.ritualId);

  @override
  List<Object?> get props => [ritualId];
}

class UserAddBatch extends UserEvent {
  final EggBatch batch;
  final int currentDay; // Текущий день инкубации для пересчёта статистики

  UserAddBatch({
    required this.batch,
    required this.currentDay,
  });

  @override
  List<Object?> get props => [batch, currentDay];
}

class UserUpdateBatch extends UserEvent {
  final EggBatch batch;
  final int currentDay; // Текущий день инкубации для пересчёта статистики

  UserUpdateBatch({
    required this.batch,
    required this.currentDay,
  });

  @override
  List<Object?> get props => [batch, currentDay];
}
