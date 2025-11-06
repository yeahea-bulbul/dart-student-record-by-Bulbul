import 'dart:io';

void main() {
  List<Map<String, dynamic>> students = [];

  print("=== Student Record Management System ===");
  print("*** Name : Kazi yeahea Bulbul ***");

  while (true) {
    stdout.write("Enter Student ID (or type 'exit' to stop): ");
    String id = stdin.readLineSync()!;

    if (id.toLowerCase() == 'exit') break;

    // Ensure ID is unique
    bool idExists = students.any((student) => student['id'] == id);
    if (idExists) {
      print("This ID already exists. Please enter a unique ID.\n");
      continue;
    }

    stdout.write("Enter Student Name: ");
    String name = stdin.readLineSync()!;

    stdout.write("Enter Student Score: ");
    double score = double.parse(stdin.readLineSync()!);

    // Determine grade
    String grade = getGrade(score);

    students.add({'id': id, 'name': name, 'score': score, 'grade': grade});

    print("Student added successfully!\n");
  }

  // Display results
  if (students.isEmpty) {
    print("No student records entered.");
    return;
  }

  // Sort students by score (descending)
  students.sort((a, b) => b['score'].compareTo(a['score']));

  print("\n** Sorted Student List **");
  for (var student in students) {
    print(
      "ID: ${student['id']}, Name: ${student['name']}, Score: ${student['score']}, Grade: ${student['grade']}",
    );
  }

  print("\nTotal number of students: ${students.length}");

  // Highest and lowest score
  double highestScore = students.first['score'];
  double lowestScore = students.last['score'];

  print("Highest Score: $highestScore");
  print("Lowest Score: $lowestScore");
}

String getGrade(double score) {
  if (score >= 90)
    return "A+";
  else if (score >= 80)
    return "A";
  else if (score >= 70)
    return "B";
  else if (score >= 60)
    return "C";
  else if (score >= 50)
    return "D";
  else
    return "F";
}

