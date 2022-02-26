import 'package:get_it/get_it.dart';

import '../screens/home/home_viewmodel.dart';
import '../services/counter/counter_service.dart';
// import '../services/rest.dart';
// import '../services/counter/counter_service_rest.dart';
// import '../services/counter/counter_service_local_storage.dart';
import '../services/counter/counter_service_mock.dart';

GetIt dependency = GetIt.instance;

void init() {
  // Services
  // dependency.registerLazySingleton<RestService>(
  //     () => RestService(baseUrl: 'http://192.168.0.6:3000'));

  dependency.registerLazySingleton<CounterService>(() => CounterServiceMock());
  // dependency.registerLazySingleton<CounterService>(
  //     () => CounterServiceLocalStorage());
  // dependency.registerLazySingleton<CounterService>(() => CounterServiceRest());

  // Viewmodels
  dependency.registerLazySingleton<HomeViewmodel>(() => HomeViewmodel());
}
