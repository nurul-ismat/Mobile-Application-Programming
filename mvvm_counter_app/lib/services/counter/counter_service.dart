import '../../models/counter.dart';

abstract class CounterService {
  Future<Counter> readCounter();
  Future<Counter> writeCounter(Counter counter);

  Future<Counter> incrementCounter() async {
    final Counter _counter = await readCounter();
    _counter.value = _counter.value + 1;
    await writeCounter(_counter);
    return _counter;
  }
}
