class User {
  int id;
  String name;
  String avatar;

  User({this.id, this.name, this.avatar});
  User.fromJson(Map<String, dynamic> json)
      : this(id: json['id'], name: json['name'], avatar: json['avatar']);
}
