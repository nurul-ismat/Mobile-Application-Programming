//-----------------------------------------------------------
// Mobile Application Programming (SCSJ3623)
// Semester 2, 2019/2020
// Exercise 3: HTTP and JSON
//
// Name 1:  ......
// Name 2:  ......
//-----------------------------------------------------------

// TODO Complete the definition of class Todo. Add the methods, fromJson() and toJson()

class Todo {
  String id;
  String title;
  bool completed;

  Todo({this.id, this.title, this.completed = false});
  Todo.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'], title: json['title'], completed: json['completed']);

  Map<String, dynamic> toJson() =>
      {'id': id, 'title': title, 'completed': completed};
}
