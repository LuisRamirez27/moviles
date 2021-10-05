import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:practica2/src/models/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseUser {
  static final _DBName = "DBUser"; //Nombre de la base de datos
  static final _version = 1; //Version de la base de datos
  static final _nameTable =
      "user"; //nombre de la tabla que contendra la base de dato
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    Directory carpeta = await getApplicationDocumentsDirectory();
    String rutaDB = join(carpeta.path, _DBName);
    return openDatabase(rutaDB, version: _version, onCreate: _crearTabla);
  }

  _crearTabla(Database db, int version) async {
    await db.execute(
        "create table $_nameTable (id integer primary key,nombre varchar(50), apellidoP varchar(50),apellidoM varchar(50),telefono varchar(10),email varchar(50),avatar text)");
    await db.execute(
        "insert into $_nameTable (nombre,apellidoP,apellidoM,telefono,email,avatar) values('Juan Luis','Ramirez','Montero','4613018645','16030855@itcelaya','assets/fondo.jpeg')");
  }

  Future<int> update(Map<String, dynamic> row) async {
    var conexion = await database;
    return conexion!
        .update(_nameTable, row, where: 'id=?', whereArgs: [row['id']]);
  }

  Future<List<userModel>> getUser() async {
    var conexion = await database;
    var result = await conexion!.query(_nameTable);
    return result.map((userMap) => userModel.fromMap(userMap)).toList();
  }
}
