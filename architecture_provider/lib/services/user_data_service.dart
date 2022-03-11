import '../dependencies.dart';
import '../models/user.dart';
import 'rest_service.dart';

class UserDataService {
  final rest = service<RestService>();

  Future<List<User>> getUserList() async {
    final listJson = await rest.get('users');

    return (listJson as List)
        .map((itemJson) => User.fromJson(itemJson))
        .toList();
  }

  Future<User> getUser({int id}) async {
    final json = await rest.get('users/$id');
    return User.fromJson(json);
  }
}
