import 'package:bloc_list_db/bloc/count_bloc.dart';
import 'package:bloc_list_db/bloc_db/list_db_bloc.dart';
import 'package:bloc_list_db/bloc_list/list_bloc.dart';
import 'package:bloc_list_db/database/local/db_helper.dart';
import 'package:bloc_list_db/screen_db/home_screen.dart';
import 'package:bloc_list_db/screen_list/home_screen.dart';
import 'package:bloc_list_db/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) {
      return DbBloc(mainDb: DbHelper.getInstances);
    },
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreenDb(),
    );
  }
}
