import 'package:flutter_bloc_person/sqlite/sqlite_helper.dart';

import '../entitiy/persons.dart';

class PersondaoRepository {
  Future<void> save (String person_name, String person_phone) async{
    var db = await SqliteHelper.databaseConnection();
    var newPerson = Map<String,dynamic>();
    newPerson["person_name"] = person_name;
    newPerson["person_prhone"] = person_phone;
    await db.insert("persons", newPerson);
    print("Person Save : $person_name - $person_phone");
  }
  Future<void> update (int person_id, String person_name, String person_phone) async{
    var db = await SqliteHelper.databaseConnection();
    var updatePerson = Map<String,dynamic>();
    updatePerson["person_name"] = person_name;
    updatePerson["person_prhone"] = person_phone;
    await db.update("persons", updatePerson, where: "person_id = ?", whereArgs: [person_id]);
    print("Person Update : $person_id - $person_name - $person_phone");
  }
  Future<List<Persons>>  search(String seacrhname)async{
    var db = await SqliteHelper.databaseConnection();
    List<Map<String,dynamic>> maps = await db.rawQuery("Select * from persons where person_name like'%$seacrhname%'");
    
    return List.generate(maps.length, (i){
      var row =maps[i];
      print("$personLoad()");
      return Persons(person_id: row["person_id"], person_name: row["person_name"], person_phone: row["person_prhone"]);
    });
  }
  Future<void> delete(int person_id)async{
    var db = await SqliteHelper.databaseConnection();
    await db.delete("persons", where: "person_id = ?", whereArgs: [person_id]);
    print("Delete Person : $person_id");
  }
  Future<List<Persons>> personLoad()async{
   var db = await SqliteHelper.databaseConnection();
   List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM persons");

   return List.generate(maps.length, (i){
     var row =maps[i];
     print("$personLoad()");
     return Persons(person_id: row["person_id"], person_name: row["person_name"], person_phone: row["person_prhone"]);

   });
  }
}