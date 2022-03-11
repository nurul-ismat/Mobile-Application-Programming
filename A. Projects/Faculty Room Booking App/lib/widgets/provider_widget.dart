import 'package:school_booking_application/Services/auth_provider.dart';
import 'package:flutter/material.dart';

class Provider extends InheritedWidget {
  final AuthClass auth;

  Provider({Key key, Widget child, this.auth}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static Provider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>();
  }
}
// static Name of(BuildContext context) {
//   return context.dependOnInheritedWidgetOfExactType<Name>();  //after
// }

//   static Provider of(BuildContext context) =>
//       (context.inheritFromWidgetOfExactType(Provider) as Provider);
// }
