import '../../app/dependencies.dart';
import '../../models/user.dart';
import '../rest_service.dart';
import 'user_service.dart';

class UserServiceRest implements UserService {
  final rest = dependency<RestService>();

  Future<List<User>> getUserList() async {
    final listJson = await rest.get('users');

    return (listJson as List)
        .map((itemJson) => User.fromJson(itemJson))
        .toList();
  }
}
