import 'counter_service.dart';
import '../../models/counter.dart';

final Counter _mockDbCounter = Counter(id: 1, value: 100);

class CounterServiceMock implements CounterService {
  Future<Counter> readCounter() async {
    return _mockDbCounter;
  }

  Future<void> writeCounter(Counter counter) async =>
      _mockDbCounter.assign(counter);

  Future<Counter> incrementCounter() async {
    final Counter _counter = await readCounter();
    _counter.value = _counter.value + 1;
    await writeCounter(_counter);
    return _counter;
  }
}
