import 'package:flutter/material.dart';
import '../../view.dart';
import '../../login/login_viewmodel.dart';
import '../../../app/router.dart' as router;

class AppbarView extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(60);
  @override
  Widget build(BuildContext context) {
    return WidgetView<LoginViewmodel>(
      builder: (_, viewmodel, __) => AppBar(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(viewmodel.user.avatar),
        ),
        title: Text(viewmodel.user.name),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.highlight_off, // highlight_off, touch_app
                color: Colors.red,
                size: 40),
            onPressed: () {
              viewmodel.selectUser(null);
              Navigator.pushReplacementNamed(
                context,
                router.loginRoute,
              );
            },
          ),
        ],
      ),
    );
  }
}
