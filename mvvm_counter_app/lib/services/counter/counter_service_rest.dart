/* THIS SERVICE IS NOT IMPLEMENTED YET*/

import '../../app/dependencies.dart';
import '../rest.dart';
import 'counter_service.dart';
import '../../models/counter.dart';

class CounterServiceRest extends CounterService {
  RestService get rest => dependency();

  @override
  Future<Counter> readCounter() async {
    final json = await rest.get('counters/1');
    return Counter.fromJson(json);
  }

  @override
  Future<Counter> writeCounter(Counter counter) async {
    final json = await rest.put('counters/${counter.id}', data: counter);
    return Counter.fromJson(json);
  }
}
