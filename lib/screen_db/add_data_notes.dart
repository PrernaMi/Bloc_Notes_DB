import 'package:bloc_list_db/bloc_db/list_db_bloc.dart';
import 'package:bloc_list_db/bloc_db/list_db_events.dart';
import 'package:bloc_list_db/models/list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddUpdate extends StatelessWidget {
  bool flag;
  String? prevTitle;
  String? prevDesc;
  int? s_no;

  AddUpdate({required this.flag, this.prevTitle, this.prevDesc, this.s_no});

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if(flag == false){
      titleController.text = prevTitle!;
    descController.text = prevDesc!;
    }
    return Scaffold(
      appBar: AppBar(
        title: flag == true ? Text("Add Your Note") : Text("Update your Note"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: TextField(
              controller: titleController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              )),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: TextField(
              controller: descController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              )),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                flag == true
                    ? context.read<DbBloc>().add(AddDbBlocEvent(
                        newModel: ListModel(
                            title: titleController.text.toString(),
                            desc: descController.text.toString())))
                    : context.read<DbBloc>().add(UpdateDbBlocEvent(
                        newModel: ListModel(
                            title: titleController.text.toString(),
                            desc: descController.text.toString()),
                        s_no: s_no!));
                Navigator.pop(context);
              },
              child: flag == true ? Text("Add") : Text("Update"))
        ],
      ),
    );
  }
}
