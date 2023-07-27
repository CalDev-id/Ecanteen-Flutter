import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  //fungsi membuat database
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""
    CREATE TABLE histori(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      makanan TEXT,
      harga INTEGER,
      jumlah INTEGER,
      tanggal TEXT,
      image TEXT
    )
    """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('histori.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }

  //tambah database
  static Future<int> tambahHistori(String makanan, int harga, int jumlah,
      String tanggal, String image) async {
    final db = await SQLHelper.db();
    final data = {
      'makanan': makanan,
      'harga': harga,
      'jumlah': jumlah,
      'tanggal': tanggal,
      'image': image,
    };
    return await db.insert('histori', data);
  }

  //ambil database
  static Future<List<Map<String, dynamic>>> getHistori() async {
    final db = await SQLHelper.db();
    return db.query('histori');
  }
}
