import 'dart:async';
import 'dart:io';

import 'package:bank_ui/models/category_model.dart';
import 'package:bank_ui/models/transaction_model.dart';
import 'package:bank_ui/models/wallet_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  late Database _database;

  static const _dbName = "transaction.db";
  static const _dbVersion = 1;
  static const _tableName = "";

  Future<Database> get database async {
    _database = await initiateDatabase();
    return _database;
  }

  Future<Database> initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName);
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE wallet (
      id INTEGER PRIMARY KEY,
      name TEXT NOT NULL,
      balance INTEGER NOT NULL,
      color INTEGER NOT NULL
    )
  ''');

    await db.execute('''
    CREATE TABLE category (
      id INTEGER PRIMARY KEY,
      name TEXT NOT NULL,
      type INTEGER NOT NULL,
      color INTEGER NOT NULL
    )
  ''');

    //   await db.execute('''
    //   CREATE TABLE "transaction" (
    //     id INTEGER PRIMARY KEY,
    //     from_wallet_id INTEGER NOT NULL,
    //     from_wallet_name TEXT NOT NULL,
    //     to_wallet_id INTEGER NOT NULL,
    //     to_wallet_name TEXT NOT NULL,
    //     balance INTEGER NOT NULL,
    //     category_id INTEGER NOT NULL,
    //     category_name TEXT NOT NULL,
    //     date_time TEXT NOT NULL,
    //   )
    // ''');
  }

  // Add Wallet
  Future<int> addWallet(Wallet wallet) async {
    Database db = await instance.database;
    return await db.insert("wallet", wallet.toJson());
  }

  // Delete Wallet
  Future<int> deleteWallet(Wallet wallet) async {
    Database db = await instance.database;
    return await db.delete(
      "wallet",
      where: "id = ?",
      whereArgs: [wallet.id],
    );
  }

  // Delete All Wallets
  Future<int> deleteAllWallets() async {
    Database db = await instance.database;
    return await db.delete("wallet");
  }

  // Update Wallet
  Future<int> updateWallet(Wallet wallet) async {
    Database db = await instance.database;
    return await db.update(
      "wallet",
      wallet.toJson(),
      where: "id = ?",
      whereArgs: [wallet.id],
    );
  }

  // Get List Wallets
  Future<List<Wallet>> getWalletList() async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> maps =
        await db.query("wallet", orderBy: 'id DESC');
    return List.generate(
      maps.length,
      (index) {
        return Wallet(
          id: maps[index]["id"],
          name: maps[index]["name"],
          balance: maps[index]["balance"].toString(),
          color: maps[index]["color"],
        );
      },
    );
  }

  // Add Category
  Future<int> addCategory(Category category) async {
    Database db = await instance.database;
    return await db.insert("category", category.toJson());
  }

  // Delete Category
  Future<int> deleteCategory(Category category) async {
    Database db = await instance.database;
    return await db.delete(
      "category",
      where: "id = ?",
      whereArgs: [category.id],
    );
  }

  //Update Categry
  Future<int> updateCategory(Category category) async {
    Database db = await instance.database;
    return await db.update(
      "category",
      category.toJson(),
      where: "id = ?",
      whereArgs: [category.id],
    );
  }

  // Get List Category Income
  Future<List<Category>> getCategoryIncome() async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      "category",
      where: "type = ?",
      whereArgs: ['Income'],
      orderBy: 'id DESC',
    );

    return List.generate(
      maps.length,
      (index) {
        return Category(
          id: maps[index]["id"],
          name: maps[index]["name"],
          type: maps[index]["type"],
          color: maps[index]["color"],
        );
      },
    );
  }

  // Get List Category Spent
  Future<List<Category>> getCategorySpent() async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      "category",
      where: "type = ?",
      whereArgs: ['Spent'],
      orderBy: 'id DESC',
    );

    return List.generate(
      maps.length,
      (index) {
        return Category(
          id: maps[index]["id"],
          name: maps[index]["name"],
          type: maps[index]["type"],
          color: maps[index]["color"],
        );
      },
    );
  }

  // // Add Transaction
  // Future<int> addTransaction(TransactionModel transaction) async {
  //   Database db = await instance.database;
  //   return await db.insert("transaction", transaction.toJson());
  // }

  // // Delete Category
  // Future<int> deleteTransaction(TransactionModel transaction) async {
  //   Database db = await instance.database;
  //   return await db.delete(
  //     "transaction",
  //     where: "id = ?",
  //     whereArgs: [transaction.id],
  //   );
  // }

  // // Get List Transaction
  // Future<List<TransactionModel>> getTransactionList() async {
  //   Database db = await instance.database;
  //   final List<Map<String, dynamic>> maps =
  //       await db.query("transaction", orderBy: 'id DESC');
  //   return List.generate(
  //     maps.length,
  //     (index) {
  //       return TransactionModel(
  //         id: maps[index]["id"],
  //         fromWalletId: maps[index]["fromWalletId"],
  //         fromWalletName: maps[index]["fromWalletName"],
  //         toWalletId: maps[index]["totoWalletId"],
  //         toWalletName: maps[index]["toWalletName"],
  //         balance: maps[index]["balance"],
  //         categoryId: maps[index]["categoryId"],
  //         categoryName: maps[index]["categoryName"],
  //         dateTime: maps[index]["dateTime"],
  //       );
  //     },
  //   );
  // }
}
