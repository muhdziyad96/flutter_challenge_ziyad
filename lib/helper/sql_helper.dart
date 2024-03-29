// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:flutter_challenge_ziyad/model/user_model.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'pumpit.db');
    return await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
      onConfigure: (db) async {
        // Enable foreign key support
        await db.execute('PRAGMA foreign_keys = ON');
      },
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('DROP TABLE IF EXISTS users');
    await db.execute('''
    CREATE TABLE users(
          id INTEGER PRIMARY KEY,
          name TEXT,
          phone TEXT,
          email TEXT,
          gender TEXT,
          image TEXT
      )
      ''');
    await db.execute('''
    CREATE TABLE cards (
      cardid INTEGER PRIMARY KEY,
      userid INTEGER,
      cardname TEXT,
      cardnum TEXT,
      cardType TEXT,
      expDate TEXT,
      FOREIGN KEY (userid) REFERENCES users(id) ON DELETE CASCADE
      )
      ''');

    await db.execute('''
    CREATE TABLE wallet (
      walletid INTEGER PRIMARY KEY,
      userid INTEGER,
      amount REAL,
      FOREIGN KEY (userid) REFERENCES users(id) ON DELETE CASCADE
      )
      ''');

    await db.execute('''
    CREATE TABLE transactions (
      transactionid INTEGER PRIMARY KEY,
      userid INTEGER,
      walletid INTEGER,
      cardid INTEGER,
      transactionsamount REAL,
      transactionType TEXT,
      transactionDate TEXT,
      FOREIGN KEY (userid) REFERENCES users(id) ON DELETE CASCADE
      FOREIGN KEY (walletid) REFERENCES wallet(walletid) ON DELETE CASCADE
      FOREIGN KEY (cardid) REFERENCES cards(cardid) ON DELETE CASCADE
      )
      ''');
  }

  Future<Map<String, dynamic>?> getUserLogin(String phone) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> results = await db.query(
      'users',
      where: 'phone = ?',
      whereArgs: [phone],
      limit: 1,
    );
    if (results.isNotEmpty) {
      return results.first;
    }
    return null;
  }

  Future<int> add(User User) async {
    Database db = await instance.database;
    return await db.insert(
      'users',
      User.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> removeCard(int id) async {
    Database db = await instance.database;
    return await db.delete('cards', where: 'cardid = ?', whereArgs: [id]);
  }

  Future<int> update(User User) async {
    Database db = await instance.database;
    return await db
        .update('users', User.toMap(), where: "id = ?", whereArgs: [User.id]);
  }
}
