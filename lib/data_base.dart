import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class EXDB{
  Future<Database> initDb()async{
    Directory dr=await getApplicationDocumentsDirectory();
    var path=join(dr.path,"QuotesDatabase.sqlite");
    bool isCheck=await File(path).exists();
    if(isCheck==false){
      ByteData bytedata=await rootBundle.load("assets/data_base/QuotesDatabase.sqlite");
      var data=bytedata.buffer.asUint8List();
      await File(path).writeAsBytes(data,flush: true);
    }
    return await openDatabase(path);
  }

  Future<List<Map<String, dynamic>>> readData() async {
    var database = await initDb();

    String query = "SELECT * FROM categorytable";
    List<Map<String, dynamic>> l1 = await database.rawQuery(query);
    print(l1);
    return l1;
  }

  Future<List<Map<String, dynamic>>> readData1(int id) async {
    var database = await initDb();
    String query = "SELECT * FROM quotestable WHERE catid = $id";
    List<Map<String, dynamic>> l1 = await database.rawQuery(query);
    print("================>>>>>${l1}");
    return l1;
  }
}