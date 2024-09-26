import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repo/persondao_repository.dart';

class RegsterCubit extends Cubit<void> {
  RegsterCubit():super(0);

  var rrepo =  PersondaoRepository();

  Future<void> save (String person_name, String person_phone) async{
    rrepo.save(person_name, person_phone);
    print("Person Save : $person_name - $person_phone");
  }
}