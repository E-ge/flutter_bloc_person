import 'package:flutter_bloc/flutter_bloc.dart';

import '../../entitiy/persons.dart';
import '../../repo/persondao_repository.dart';

class HomeCubit extends Cubit<List<Persons>> {
  HomeCubit():super(<Persons>[]);

  var rrepo =  PersondaoRepository();

  Future<void>  search(String result)async{
   var list = await rrepo.search(result);
   emit(list);
  }
  Future<void> delete(int person_id)async{
    await rrepo.delete(person_id);
    print("Delete Person : $person_id");
    await personLoad();
  }
  Future<void> personLoad()async{
    var list = await rrepo.personLoad();
    print(rrepo.personLoad());
    emit(list);
  }
}