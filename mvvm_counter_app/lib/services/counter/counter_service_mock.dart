import 'counter_service.dart';
import '../../models/counter.dart';

final _mockDbCounter = Counter(id: 1, value: 100);

class CounterServiceMock extends CounterService {
  @override
  Future<Counter> readCounter() async {
    return _mockDbCounter;
  }

  @override
  Future<Counter> writeCounter(Counter counter) async {
    _mockDbCounter.assign(counter);
    return _mockDbCounter;
  }
}
