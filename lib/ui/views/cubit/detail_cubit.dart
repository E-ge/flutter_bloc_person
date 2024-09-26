import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repo/persondao_repository.dart';

class DetailCubit extends Cubit<void> {
  DetailCubit():super(0);

  var rrepo =  PersondaoRepository();

  Future<void> update (int person_id, String person_name, String person_phone) async{
    await rrepo.update(person_id, person_name, person_phone);
    print("Person Update : $person_id - $person_name - $person_phone");
  }

}