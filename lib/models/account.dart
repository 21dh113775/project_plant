import 'package:project_plant/models/database/databaseHelper.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AccountDatabase {
  static final tableName = 'users';

  // Hàm tạo bảng người dùng
  static Future<void> createTable(Database db) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
      CREATE TABLE $tableName (
        id $idType,
        email $textType,
        fullName $textType,
        password $textType
      )
    ''');
  }

  // Hàm thêm người dùng mới
  static Future<int> createUser(Map<String, dynamic> user) async {
    final db = await DatabaseHelper.instance.database;
    return await db.insert(tableName, user);
  }

  // Hàm lấy người dùng dựa vào email và password
  static Future<Map<String, dynamic>?> getUser(
      String email, String password) async {
    final db = await DatabaseHelper.instance.database;

    final result = await db.query(
      tableName,
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }

  // Hàm kiểm tra email tồn tại
  static Future<bool> isEmailExists(String email) async {
    final db = await DatabaseHelper.instance.database;

    final result = await db.query(
      tableName,
      where: 'email = ?',
      whereArgs: [email],
    );

    return result.isNotEmpty;
  }
}
