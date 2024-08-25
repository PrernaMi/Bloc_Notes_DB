import 'package:bloc_list_db/bloc/count_bloc.dart';
import 'package:bloc_list_db/bloc/count_events.dart';
import 'package:bloc_list_db/bloc/count_states.dart';
import 'package:bloc_list_db/screens/add_sub_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Home Page")),
      ),
      body: BlocBuilder<CountBloc,CountState>(
        builder: (_,state){
          return Center(
            child: Text('${state.count}',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return AddData();
          }));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}