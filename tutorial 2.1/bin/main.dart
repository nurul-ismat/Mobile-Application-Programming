// SCSJ3623 Mobile Application Programming
// Tutorial 2.1

// Date: 31/10/2021
// Section: 01
// Room Number: 6

// Member 1's Name: NG JING ER    Location: Pulau Pinang
// Member 2's Name: CHIAM WOOI CHIN    Location: _Kedah__
// Member 3's Name: NUR IZZAHTUL SYAFIQAH   Location: Kuantan
// Member 4's Name: Nurul Ismat Tanni    Location: Bangladesh

void main() {
  //TODO Task 1: Store data as a map

  var student = <String, int>{
    'A17EC4041': 57,
    'A17EC4042': 85,
    'A17EC4056': 66,
    'A17EC9043': 80,
    'A17EC4002': 57,
    'A17EC4032': 75,
    'A17EC3002': 85,
    'A17EC3003': 82,
    'A17EC4043': 83,
    'A17EC4044': 84,
    'A17EC3004': 67,
    'A17EC4045': 70,
    'A17EC4040': 53
  };

  //TODO Task 2: Print the list
  print('Matric\t\tScore');
  print('------\t\t-----');

  student.forEach((String matric, int score) => print('$matric\t\t$score'));

  //TODO Task 4
  var matricNumber = 'A17EC4041';
  var score = student[matricNumber];
  print(
      'Result for the student ${matricNumber}, Score: $score, Grade: ${grade(score)}');

  //TODO Task 5: print the list including the grades
  print('Matric\t\tScore\tgrade');
  print('------\t\t-----\t-----');
  student.forEach(
      (String matric, int score) => print('$matric\t$score\t${grade(score)}'));

  //TODO Task 6: Create a list of scores
  var scores = student.values.toList();

  //TODO Task 7: Calculate average score

  var avg = scores.reduce((score, num) => score + num) / scores.length;

  print("Average score: ${avg}");

  //TODO Task 8: Calculate the frequency of each grade
  print('Grade\t\tFreq');
  print('-----\t\t-----');
  scores.forEach((int score) => print('${grade(score)}'));


  //TODO Task 9: Remove all students that earn grade lower than B
  student.removeWhere((m, s) => s < 75);
  print('Matric\t\tScore\tgrade');
  print('------\t\t-----\t-----');
  student.forEach(
      (String matric, int score) => print('$matric\t$score\t${grade(score)}'));
}

//TODO  Task 3: Define function that converts score to letter grade
String grade(int s) {
  if (s > 84) {
    return 'A';
  } else if (s > 74) {
    return 'B';
  } else if (s > 64) {
    return 'C';
  } else if (s > 54) {
    return 'D';
  } else if (s > 44) {
    return 'E';
  }
}
