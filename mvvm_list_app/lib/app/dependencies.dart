import 'package:get_it/get_it.dart';
import '../screens/home/home_viewmodel.dart';

GetIt dependency = GetIt.instance;

void init() {
  // Services
  // dependency.registerLazySingleton<CounterService>(() => CounterServiceMock());

  // Viewmodels
  dependency.registerLazySingleton<HomeViewmodel>(() => HomeViewmodel());
}
