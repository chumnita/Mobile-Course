import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/student.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    return _db ??= await _initDb();
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'class_manager.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE students (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        email TEXT,
        phone TEXT,
        className TEXT,
        department TEXT,
        gender TEXT,
        dateRegistered TEXT,
        present INTEGER
      )
    ''');
  }

  Future<int> insertStudent(Student student) async {
    final dbClient = await db;
    return await dbClient.insert('students', student.toMap());
  }

  Future<List<Student>> getStudents() async {
    final dbClient = await db;
    final result = await dbClient.query('students');
    return result.map((e) => Student.fromMap(e)).toList();
  }

  Future<int> updateStudent(Student student) async {
    final dbClient = await db;
    return await dbClient.update(
      'students',
      student.toMap(),
      where: 'id = ?',
      whereArgs: [student.id],
    );
  }

  Future<int> deleteStudent(int id) async {
    final dbClient = await db;
    return await dbClient.delete('students', where: 'id = ?', whereArgs: [id]);
  }
}
