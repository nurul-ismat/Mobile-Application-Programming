class Todo {
  int id;
  String title;
  bool completed;
  int userId;

  Todo({this.id, this.title, this.completed = false, this.userId});
  Todo.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            title: json['title'],
            completed: json['completed'],
            userId: json['userId']);

  Map<String, dynamic> toJson() =>
      {'id': id, 'title': title, 'completed': completed, 'userId': userId};
}
