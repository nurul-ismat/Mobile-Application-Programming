abstract class Controller {
  void turnOn();
  void turnOff();
}

class Setting {
  void setLanguage() {
    print('The language is set to English');
  }
}

class Television implements Controller, Setting {
  String _channel;

  Television(this._channel);
  @override
  void turnOn() {
    print('The TV is currently turned ON on channel $_channel');
  }

  @override
  void turnOff() {
    print('The TV is OFF');
  }

  @override
  void setLanguage() {
    print('The language is set to Bahasa Melayu');
  }

  set channel(String newChannel) {
    print('Switching channel from $_channel to ${_channel = newChannel}');
  }
}

void main() {
  var tv = Television('TV3');
  tv.turnOff();
  tv.turnOn();
  tv.channel = 'NTV7';
  tv.setLanguage();
}
