import 'package:bloc_list_db/bloc_list/list_bloc.dart';
import 'package:bloc_list_db/bloc_list/list_events.dart';
import 'package:bloc_list_db/bloc_list/list_states.dart';
import 'package:bloc_list_db/screen_list/addList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/list_model.dart';

class HomeScreen extends StatelessWidget{
  List<ListModel> mList = [];

  @override
  Widget build(BuildContext context) {
    List<ListModel> mList = [];
    mList = context.watch<ListBloc>().state.mList;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Home page")),
      ),
      body: BlocBuilder<ListBloc,ListState>(
        builder: (_,state){
          return ListView.builder(
            itemCount: mList.length,
              itemBuilder: (_,Index){
              return ListTile(
                title: Text(mList[Index].title),
                subtitle: Text(mList[Index].desc),
              );
              }
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return AddList();
          }));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}