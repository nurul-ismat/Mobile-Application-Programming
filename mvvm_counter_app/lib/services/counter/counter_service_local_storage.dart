import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'counter_service.dart';
import '../../models/counter.dart';

class CounterServiceLocalStorage extends CounterService {
  @override
  Future<Counter> readCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data;
    try {
      data = prefs.getString('counter');
      if (data == null) return Counter(id: 1, value: 0);
      final json = jsonDecode(data) as Map<String, dynamic>;
      return Counter.fromJson(json);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Counter> writeCounter(Counter counter) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = jsonEncode(counter);
    await prefs.setString('counter', data);
    return counter;
  }
}
