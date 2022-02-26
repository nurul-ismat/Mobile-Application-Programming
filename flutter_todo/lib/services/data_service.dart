//-----------------------------------------------------------
// Mobile Application Programming (SCSJ3623)
// Semester 2, 2019/2020
// Exercise 3: HTTP and JSON
//
// Name 1:  ......
// Name 2:  ......
//-----------------------------------------------------------

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/todo.dart';

class DataService {
  //  Localhost JSON Server
  // static const String baseUrl =
  //     'http://192.168.0.4:3000'; // Change the IP address to your PC's IP. Remain the port number 3000 unchanged.

  //  Live server on Heroku
  // static const String baseUrl =
  //     'https://jumail-utm-rest-node-mysql.herokuapp.com';

  // Live server on Firebase
  static const String baseUrl =
      'https://us-central1-jumail-backend-firebase-rest.cloudfunctions.net/api';

  // JSON server online
  // static const String baseUrl =
  //       'https://my-json-server.typicode.com/jumail-utm/backend_node_mysql'; // Change the IP address to your PC's IP. Remain the port number 3000 unchanged.

  // TODO 1: Complete this method. It is an helper for the HTTP GET request
  Future get(String endpoint) async {
    final response = await http.get('$baseUrl/$endpoint');

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw response;
  }

  // TODO 2: Complete this method. It is an helper for the HTTP POST request
  Future post(String endpoint, {dynamic data}) async {
    final response = await http.post('$baseUrl/$endpoint',
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    }
    throw response;
  }

  // TODO 3: Complete this method. It is an helper for the HTTP PATCH request
  Future patch(String endpoint, {dynamic data}) async {
    final response = await http.patch('$baseUrl/$endpoint',
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw response;
  }

  // TODO 4: Complete this method. It is an helper for the HTTP DELETE request
  Future delete(String endpoint) async {
    final response = await http.delete('$baseUrl/$endpoint');

    if (response.statusCode == 200) {
      return; // jsonDecode(response.body);
    }
    throw response;
  }

  // TODO 5: Complete this method. It is meant for getting the list of TODO s from the server
  Future<List<Todo>> getTodoList() async {
    final listJson = await get('todos');

    return (listJson as List)
        .map((itemJson) => Todo.fromJson(itemJson))
        .toList();
  }

  // TODO 6: Complete this method. It is meant for updating the status of a given TODO  (whether is completed or not) in the server
  Future<Todo> updateTodoStatus({String id, bool status}) async {
    final json = await patch('todos/$id', data: {'completed': status});
    return Todo.fromJson(json);
  }

  // TODO 7: Complete this method. It is meant for creating a new TODO  in the server
  Future<Todo> createTodo({Todo todo}) async {
    final json = await post('todos', data: todo);
    return Todo.fromJson(json);
  }

  // TODO 8: Complete this method. It is meant for deleting a given TODO  from the server
  Future deleteTodo({String id}) async {
    await delete('todos/$id');
  }
}

final dataService = DataService();
