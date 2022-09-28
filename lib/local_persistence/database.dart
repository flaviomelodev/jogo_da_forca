import 'dart:io';

import 'package:forca_game/local_persistence/lp_constants.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SQFLiteDataBase {
  //Objeto SQFLite para a base de dados
  static Database? _database;

  //Construtor privado atuando como singleton para termos sempre a mesma
//conexão em toda a aplicação

  SQFLiteDataBase._privateConstructor();
  static final SQFLiteDataBase instance = SQFLiteDataBase._privateConstructor();

  //Acesso à base de dados
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDataBase();
    return _database!;
  }

  //Método que inicializará a base de dados, caso ainda não exista
  _initDataBase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, kDataBaseName);
    return await openDatabase(
      path,
      version: kDataBaseVersion,
      onCreate: _onCreateDb,
      onUpgrade: _onUpgradeDb,
      onDowngrade: _onDowngradeDb,
    );
  }

  /*Métodos que serão executados de acordo com o estado identificado na
  inicialização*/
  Future _onCreateDb(Database database, int version) async {
    await database.execute("CREATE TABLE palavras ("
        "palavraID TEXT PRIMARY KEY,"
        "palavra TEXT,"
        "ajuda TEXT"
        ")");
  }

  Future _onUpgradeDb(
      Database database, int previousVersion, int newVersion) async {}

  Future _onDowngradeDb(
      Database database, int previousVersion, int newVersion) async {}
}
