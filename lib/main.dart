import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_person/ui/views/cubit/detail_cubit.dart';
import 'package:flutter_bloc_person/ui/views/cubit/home_cubit.dart';
import 'package:flutter_bloc_person/ui/views/cubit/regster_cubit.dart';

import 'ui/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegsterCubit()),
        BlocProvider(create: (context) => DetailCubit()),
        BlocProvider(create: (context) => HomeCubit() )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}


