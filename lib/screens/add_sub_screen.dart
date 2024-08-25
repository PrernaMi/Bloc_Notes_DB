import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/count_bloc.dart';
import '../bloc/count_events.dart';

class AddData extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Increment Count"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          context.read<CountBloc>().add(IncrementCount());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}