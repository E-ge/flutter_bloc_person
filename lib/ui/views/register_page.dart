
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/regster_cubit.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var tfPersonName= TextEditingController();
  var tfPersonPhone= TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("R E G I S T E R",
        style: TextStyle(fontSize: 36, fontFamily: "Bebas"),),centerTitle: true,),
      body:Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfPersonName,decoration: const InputDecoration(hintText: "Person Name"),),
              TextField(controller: tfPersonPhone,decoration: const InputDecoration(hintText: "Person Phone"),),
              ElevatedButton(onPressed: (){
                  context.read<RegsterCubit>().save(tfPersonName.text, tfPersonPhone.text);
              }, child: const Text("S A V E", style: TextStyle(fontFamily: "Bebas"),))
            ],
          ),
        ),
      ),
    );
  }
}