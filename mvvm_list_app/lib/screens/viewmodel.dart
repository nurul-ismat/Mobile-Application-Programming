import 'package:flutter/foundation.dart';

class Viewmodel with ChangeNotifier {
  bool _initialized = false;

  bool _busy = false;

  get busy => _busy;

  void turnBusy() {
    _busy = true;
    notifyListeners();
  }

  void turnIdle() {
    _busy = false;
    notifyListeners();
  }

  /// A convenient method, to implicitly write the turnBusy()... turnIdle()
  void update(AsyncCallback fn) async {
    turnBusy();
    if (fn != null) await fn();
    turnIdle();
  }

  // An helper to the init(), so that we can check whether the init() has been executed before.
  // This method is not meant to be accessed by the child viewmodel class.

  void initialize() {
    if (_initialized) return;
    init();
    _initialized = true;
  }

  /// To be overridden by the child class if it needs to
  /// do something once the viewmodel has been created
  void init() {}
}
