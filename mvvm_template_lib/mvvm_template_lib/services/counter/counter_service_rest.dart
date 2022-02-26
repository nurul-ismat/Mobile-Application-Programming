/* THIS SERVICE IS NOT IMPLEMENTED YET*/

import '../../app/dependencies.dart';
import '../rest.dart';
import 'counter_service.dart';
import '../../models/counter.dart';

class CounterServiceRest implements CounterService {
  RestService get rest => dependency();

  Future<Counter> readCounter() async {
    return null; /* NOT IMPLEMENTED YET*/
  }

  Future<void> writeCounter(Counter counter) async {
    return null; /* NOT IMPLEMENTED YET*/
  }

  Future<Counter> incrementCounter() async {
    return null; /* NOT IMPLEMENTED YET*/
  }
}


// Sample code from past project
//   Future<Counter> getCounterByUser(dynamic userId) async {
//     final List listJson = await rest.get('counters?user=$userId');
//     if (listJson == null || listJson.length == 0) return null;
//     return Counter.fromJson(listJson[0]);
//   }

//   Future<Counter> updateCounter(Counter counter) async {
//     final json = await rest.put('counters/${counter.id}', data: counter);
//     return Counter.fromJson(json);
//   }
