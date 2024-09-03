import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:student_management_provider/domain/models/student_model/student_model.dart';

class DatabaseHelper {
  static const _databaseName = 'student.db';
  static const _databaseVersion = 1;
  static const table = 'students';
  static const columnId = '_id';
  static const columnName = 'name';
  static const columnAge = 'age';
  static const columnPlace = 'place';
  static const columnCourse = 'course';
  static const columnImage = 'image';
  static const columnPhone = 'phone';
  static const columnPincode = 'pincode';
  static const columnAddress = 'address';
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: (db, version) => _onCreate(db, version), // Call _onCreate here
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnName TEXT NOT NULL,
        $columnAge INTEGER NOT NULL,
        $columnPlace TEXT NOT NULL,
        $columnCourse TEXT NOT NULL,
        $columnImage TEXT NOT NULL,
        $columnPhone INTEGER NOT NULL,
        $columnAddress TEXT NOT NULL,
        $columnPincode INTEGER NOT NULL
      )
    ''');
  }

  Future<int> insertStudent(StudentModel student) async {
    try {
      final db = await database;
      int id = await db.insert(table, {
        columnName: student.name,
        columnAge: student.age,
        columnPlace: student.place,
        columnCourse: student.course,
        columnImage: student.image,
        columnPhone: student.phoneNumber,
        columnAddress: student.address,
        columnPincode: student.pincode,
      });
      print('Id is $id');
      return id;
    } catch (e) {
      print("Error inserting student: $e");
      return -1; // or any other error code you prefer
    }
  }

  Future<List<StudentModel>> getStudents() async {
    try {
      final db = await database;
      final List<Map<String, dynamic>> maps = await db.query(table);
      print(maps);
      List<StudentModel> students = List.generate(
          maps.length,
          (index) => StudentModel(
                id: maps[index][columnId],
                name: maps[index][columnName],
                age: maps[index][columnAge],
                place: maps[index][columnPlace],
                course: maps[index][columnCourse],
                image: maps[index][columnImage],
                phoneNumber: maps[index][columnPhone],
                address: maps[index][columnAddress],
                pincode: maps[index][columnPincode],
              ));
      print("Generated list of students:");
      for (var student in students) {
        print(student);
      }
      return students;
    } catch (e) {
      print("Error fetching students: $e");
      return [];
    }
  }

  Future<int> deleteStudent(int id) async {
    final db = await database;
    return await db.delete(
      table,
      where: '$columnId=?',
      whereArgs: [id],
    );
  }

  Future<int> updateStudent(StudentModel student) async {
    final db = await database;
    return db.update(
      table,
      student.toMap(),
      where: '$columnId = ?',
      whereArgs: [student.id],
    );
  }
}
