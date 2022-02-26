import '../viewmodel.dart';
import '../../app/dependencies.dart';
import '../../services/counter/counter_service.dart';
import '../../models/counter.dart';

class HomeViewmodel extends Viewmodel {
  CounterService get _service => dependency<CounterService>();
  Counter _counter;

  @override
  void init() async => _counter = await _service.readCounter();

  Counter get counter => _counter;

  void incrementCounter() =>
      update(() async => _counter = await _service.incrementCounter());
}
