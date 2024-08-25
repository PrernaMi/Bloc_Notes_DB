import 'package:bloc_list_db/bloc_list/list_bloc.dart';
import 'package:bloc_list_db/bloc_list/list_events.dart';
import 'package:bloc_list_db/models/list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddList extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Your Note"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: titleController,
          ),
          TextField(
            controller: descController,
          ),
          ElevatedButton(
              onPressed: () {
                context.read<ListBloc>().add(AddInListBloc(
                    newModel: ListModel(
                        title: titleController.text.toString(),
                        desc: descController.text.toString())));
                Navigator.pop(context);
              },
              child: Text("Add"))
        ],
      ),
    );
  }
}
