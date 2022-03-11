enum Days{
  monday, tuesday, wednesday,
  thursday,friday, saturday, sunday
}

void main(){
  var today = Days.thursday;

  print(Days.values);
  print(today);
  print(today.index);
  if (today==Days.thursday) print('Today, the office is half-day');
}

