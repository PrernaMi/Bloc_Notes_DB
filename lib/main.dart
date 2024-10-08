import 'package:bloc_list_db/bloc/count_bloc.dart';
import 'package:bloc_list_db/bloc_list/list_bloc.dart';
import 'package:bloc_list_db/screen_list/home_screen.dart';
import 'package:bloc_list_db/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) {
      return ListBloc();
    },
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
