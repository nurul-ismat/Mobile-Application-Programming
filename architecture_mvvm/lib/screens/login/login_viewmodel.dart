import '../../app/dependencies.dart';

import '../../services/user/user_service.dart';
import '../viewmodel.dart';
import '../../models/user.dart';

class LoginViewmodel extends Viewmodel {
  List<User> users;
  int _selected;
  UserService get dataService => dependency();

  void getUserList() async {
    turnBusy();
    users = await dataService.getUserList();
    _selected = null;
    turnIdle();
  }

  User get user =>
      (users != null) && (_selected != null) ? users[_selected] : null;

  void selectUser(int index) {
    _selected = index;
    turnIdle(); // Only to call to notifyListneres()
  }
}
