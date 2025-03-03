import 'package:chicken_hatchery/src/feature/rituals/repository/user_repository.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupDependencyInjection() {
  locator.registerLazySingleton(() => Repository());
}
