import '../../models/counter.dart';

abstract class CounterService {
  Future<Counter> readCounter();
  Future<void> writeCounter(Counter counter);
  Future<Counter> incrementCounter();
}
