import 'package:flutter/material.dart';

import '../view.dart';
import 'login_viewmodel.dart';
import '../../app/router.dart' as router;

class LoginScreen extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => LoginScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose a user to login as'),
      ),
      body: View<LoginViewmodel>(
        initViewmodel: (viewmodel) => viewmodel.getUserList(),
        builder: (context, viewmodel, _) {
          final users = viewmodel.users;

          return ListView.separated(
            itemCount: users.length,
            separatorBuilder: (context, index) => Divider(
              color: Colors.blueGrey,
            ),
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.avatar),
                ),
                title: Text(user.name),
                subtitle: Text('user id:  ${user.id}'),
                onTap: () {
                  viewmodel.selectUser(index);
                  Navigator.pushReplacementNamed(context, router.todolistRoute);
                },
              );
            },
          );
        },
      ),
    );
  }
}
