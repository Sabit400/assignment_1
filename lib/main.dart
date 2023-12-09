// Define Role interface
abstract class Role {
  void displayRole();
}

// Define Person class
class Person implements Role {
  String name;
  int age;
  String address;

  Person(this.name, this.age, this.address);

  @override
  void displayRole() {
    print("Role: Unknown");
  }
}

// Define Student class extending Person
class Student extends Person {
  String studentID;
  String grade;
  List<double> courseScores = [];

  Student(String name, int age, String address, this.studentID, this.grade)
      : super(name, age, address);

  @override
  void displayRole() {
    print("Student Information:");
    super.displayRole();
    print("Name: $name");
    print("Age: $age");
    print("Address: $address");
    print("Role: Student");
    print("Average Score: ${calculateAverageScore()}");
  }

  double calculateAverageScore() {
    if (courseScores.isEmpty) return 0.0;
    return courseScores.reduce((a, b) => a + b) / courseScores.length;
  }
}

// Define Teacher class extending Person
class Teacher extends Person {
  String teacherID;
  List<String> coursesTaught = [];

  Teacher(String name, int age, String address, this.teacherID)
      : super(name, age, address);

  @override
  void displayRole() {
    print("Teacher Information:");
    super.displayRole();
    print("Name: $name");
    print("Age: $age");
    print("Address: $address");
    print("Role: Teacher");
    displayCoursesTaught();
  }

  void displayCoursesTaught() {
    print("Courses Taught:");
    for (var course in coursesTaught) {
      print("- $course");
    }
  }
}

// Define StudentManagementSystem class
class StudentManagementSystem {
  void run() {
    // Create instances of Student and Teacher classes
    Student johnDoe = Student("John Doe", 20, "123 Main St", "12345", "A");
    Teacher mrsSmith = Teacher("Mrs. Smith", 35, "456 Oak St", "T123");

    // Set attributes using appropriate methods
    johnDoe.courseScores = [90, 85, 82];
    mrsSmith.coursesTaught = ["Math", "English", "Bangla"];

    // Use the displayRole() method to display the role of each person
    johnDoe.displayRole();
    print("\n");
    mrsSmith.displayRole();
  }
}

void main() {
  // Create an instance of the StudentManagementSystem
  var system = StudentManagementSystem();
  // Run the system
  system.run();
}
