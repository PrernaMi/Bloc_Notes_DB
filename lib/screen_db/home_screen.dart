import 'package:bloc_list_db/bloc_db/list_db_bloc.dart';
import 'package:bloc_list_db/bloc_db/list_db_events.dart';
import 'package:bloc_list_db/bloc_db/list_db_states.dart';
import 'package:bloc_list_db/models/list_model.dart';
import 'package:bloc_list_db/screen_db/add_data_notes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';

class HomeScreenDb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<DbBloc>().add(GetInitialNoteDbBlocEvent());
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Home Page")),
      ),
      body: BlocBuilder<DbBloc, ListDbState>(
        builder: (_, state) {
          if (state is DbLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is DbErrorState) {
            return Center(
              child: Text(state.msg),
            );
          }
          if (state is DbLoadedState) {
            return ListView.builder(
                itemCount: state.allNotes.length,
                itemBuilder: (_, Index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text('${Index + 1}'),
                    ),
                    title: Text(state.allNotes[Index].title),
                    subtitle: Text(state.allNotes[Index].desc),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return AddUpdate(
                                    flag: false,
                                    prevTitle: state.allNotes[Index].title,
                                    prevDesc: state.allNotes[Index].desc,
                                    s_no: state.allNotes[Index].s_no,
                                  );
                                }));
                              },
                              icon: Icon(Icons.edit)),
                          IconButton(onPressed: () {
                            context.read<DbBloc>().add(DeleteDbBlocEvent(s_no: state.allNotes[Index].s_no!));
                          }, icon: Icon(Icons.delete))
                        ],
                      ),
                    ),
                  );
                });
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddUpdate(
              flag: true,
            );
          }));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
