
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_person/main.dart';
import 'package:flutter_bloc_person/ui/views/cubit/home_cubit.dart';
import '../entitiy/persons.dart';
import 'detail_page.dart';
import 'register_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool searchingStatus = false;

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().personLoad();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          searchingStatus ?
          IconButton(onPressed: (){
            setState(() {
              searchingStatus = false;
            });
            context.read<HomeCubit>().personLoad();
          }, icon: const Icon(Icons.clear)):
          IconButton(onPressed: (){
            setState(() {
              searchingStatus = true;
            });
          }, icon: const Icon(Icons.search))
        ],
        title:searchingStatus ?

        TextField(decoration: const InputDecoration(hintText: "SEARCHING"),
          onChanged: (result){
            context.read<HomeCubit>().search(result);
          },
        ) : const Text("P E R S O N S",
          style: TextStyle(fontSize: 36, fontFamily: "Bebas"),),centerTitle: true,),
      body:
      BlocBuilder<HomeCubit, List<Persons>>(
        builder: (context,personList){
          if(personList.isNotEmpty){
            return ListView.builder(
              itemCount: personList.length,
              itemBuilder: (context,index){
                var person = personList[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(person: person)))
                        .then((data){
                          context.read<HomeCubit>().personLoad();
                    });
                    print("${person.person_name} is selected");
                  },
                  child: Card(
                      child: SizedBox(height: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(person.person_name,style: TextStyle(fontFamily: "Beabas",fontSize: 22),),
                                  Text(person.person_phone, style: TextStyle(fontSize: 18),),
                                ],
                              ),
                              const Spacer(),
                              IconButton(onPressed: (){
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(
                                    SnackBar(content: Text("Do you want to delete this Person ${person.person_name} "),
                                      action: SnackBarAction(label: "Y E S", onPressed: (){
                                        context.read<HomeCubit>().delete(person.person_id);
                                      }),)
                                );
                              }, icon: Icon(Icons.close))
                            ],
                          ),
                        ),
                      )
                  ),
                );
              },
            );
          }else{
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage()))
              .then((data){
                context.read<HomeCubit>().personLoad();
            print("return to mainpage");
          });
        },
        child: const Icon(Icons.add,color: Colors.redAccent,),
        backgroundColor: Colors.black,),
    );
  }
}