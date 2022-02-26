class Counter {
  dynamic _id;
  int _value;

  dynamic get id => _id;
  int get value => _value;
  set value(val) => _value = val;

  Counter({dynamic id, int value})
      : _value = value,
        _id = id;

  Counter.fromJson(Map<String, dynamic> json)
      : this(value: json['value'], id: json['id']);

  Counter.copy(Counter from) : this(value: from._value, id: from._id);
  Map<String, dynamic> toJson() => {'value': value, 'id': id};

  void assign(Counter counter) {
    _id = counter._id;
    _value = counter._value;
  }
}
