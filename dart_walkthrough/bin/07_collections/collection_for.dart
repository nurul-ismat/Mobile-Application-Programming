void main() {
  var users = ['User 1', 'User 2', 'User 9'];
  var buttons = [
    'Ok',
    'Cancel',
    for (var user in users) 'Add $user'
  ];

  print (buttons);
}

