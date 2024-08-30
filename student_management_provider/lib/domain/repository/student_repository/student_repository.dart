import 'package:sqflite/sqflite.dart';
import 'package:student_management_provider/domain/models/student_model/student_model.dart';

class DataBaseHelper {
  static Database? _db;
 
// Initialize the database on object creation

 Future<void> initializeDatabase()async {
    if (_db == null) {
      _db = await openDatabase(
        "student.db",
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(
            "CREATE TABLE student (id INTEGER PRIMARY KEY, image TEXT, name TEXT, standard TEXT, phoneNumber REAL, address TEXT)",
          );
        },
      );
    }
    
  }

Future<void> addNewStudent(StudentModel value) async {
  await _db?.rawInsert(
    "INSERT INTO student (id, image, name, standard, phoneNUmber, address) VALUES (?, ?, ?, ?, ?, ?)",
    [value.id, value.image, value.name, value.std, value.phoneNumber, value.address],
  );
  print(_db);
}
}
