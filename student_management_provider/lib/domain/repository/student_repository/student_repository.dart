import 'package:sqflite/sqflite.dart';
import 'package:student_management_provider/domain/models/student_model/student_model.dart';


  late Database _db;

  // Initialize the database on object creation
  

 Future<void> initializeDatabase() async {
    _db = await openDatabase(
      "student.db",
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE student (id INTEGER PRIMARY KEY, rollno INTEGER, name TEXT, department TEXT, phoneno REAL, imageurl TEXT);",
        );
      },
    );
  }

  // Function to add a student to the database
  Future<int> addStudent(StudentModel student) async {
    try {
      final id = await _db.insert('student', student.toMap());
      print('Student added successfully with ID: $id');
      return id; // Return the inserted ID for potential use
    } catch (e) {
      print('Error adding student: $e');
      return -1; // Indicate failure (consider throwing an exception for clarity)
    }
  }
