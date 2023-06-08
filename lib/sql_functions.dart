import 'package:sqflite/sqflite.dart' as sql;
import 'package:flutter/foundation.dart';


class SQLFunction{
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE accounts(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    username TEXT,
    password TEXT,
    pageId TEXT,
    imagePath TEXT,
    isRegistered INTEGER,
    isMinorLess14 INTEGER,
    isMinor1417 INTEGER,
    isAdult INTEGER,
    isVulnerable INTEGER,
    isSenior INTEGER,
    isUnaccompanied INTEGER,
    isForDeportation INTEGER,
    isForDeportTurkey INTEGER,
    isSeekIOM INTEGER,
    isContinueAsylum INTEGER,
    isAsylumStatusPrisonEligible INTEGER,
    isCrisisSubsidiaryProtection INTEGER,
    isSeekAsylumStatusPrison INTEGER,
    isAsylumStatusTerritoryEligible INTEGER,
    isLegalAge INTEGER,
    isTravelWithFamily INTEGER,
    isAsylumQuestionsEligible INTEGER,
    isFamilyMember INTEGER,
    isAsylumClaim INTEGER,
    isContinueAsylum1 INTEGER,
    isContinueAsylum2 INTEGER,
    isSyriaCitizen INTEGER,
    isCH0304012 INTEGER,
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )""");
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase("hcdatabase.db",
        version: 1,
        onCreate: (sql.Database database, int version) async {
          print("...creating a table...");
          await createTables(database);
        }
    );
  }

  static Future<int> createItem(String username, String? password) async {
    final db = await SQLFunction.db();

    final data = {
      'username': username,
      'password' : password,
      'pageId' : 'R01-001',
      'imagePath' : 'assets/hclogo.png',
      'isRegistered' : 0,
      'isMinorLess14': 0,
      'isMinor1417': 0,
      'isAdult': 0,
      'isVulnerable': 0,
      'isSenior': 0,
      'isUnaccompanied': 0,
      'isForDeportation': 0,
      'isForDeportTurkey': 0,
      'isSeekIOM': 0,
      'isContinueAsylum': 0,
      'isAsylumStatusPrisonEligible': 0,
      'isCrisisSubsidiaryProtection': 0,
      'isSeekAsylumStatusPrison': 0,
      'isAsylumStatusTerritoryEligible': 0,
      'isLegalAge': 0,
      'isTravelWithFamily': 0,
      'isAsylumQuestionsEligible': 0,
      'isFamilyMember': 0,
      'isAsylumClaim': 0,
      'isContinueAsylum1': 0,
      'isContinueAsylum2': 0,
      'isSyriaCitizen': 0,
      'isCH0304012': 0,
    };
    final id = await db.insert('accounts', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace
    );
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLFunction.db();
    return db.query('accounts', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLFunction.db();
    return db.query('accounts', where:  "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateItem(
      int id, String key, dynamic value) async {
    final db = await SQLFunction.db();

    final data = {
      key : value
    };

    final result = await db.update('accounts', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteItem(int id) async {
    final db = await SQLFunction.db();
    try {
      await db.delete("accounts", where: "id = ?", whereArgs: [id]);
    } catch (err){
      debugPrint("Something went wrong when deleting san item: $err");
    }
  }

}