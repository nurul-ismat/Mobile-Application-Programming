//? This class is fully given.
//? You may want to refer to this class to define other model clases

class Task {
  String _title;
  bool _completed;

  String get title => _title;
  bool get completed => _completed;

  Task({title, completed = false})
      : _title = title,
        _completed = completed;
  Task.copy(Task from) : this(title: from.title, completed: from.completed);
}
