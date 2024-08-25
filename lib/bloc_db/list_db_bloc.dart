import 'package:bloc_list_db/bloc_db/list_db_events.dart';
import 'package:bloc_list_db/bloc_db/list_db_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../database/local/db_helper.dart';

class DbBloc extends Bloc<ListDbEvents, ListDbState> {
  DbHelper? mainDb;

  DbBloc({required this.mainDb}) : super(DbInitialState()) {

    on<AddDbBlocEvent>((event, emit) async {
      emit(DbLoadingState());
      bool check = await mainDb!.addInDb(newModel: event.newModel);
      if (check) {
        var data = await mainDb!.getFromDb();
        emit(DbLoadedState(allNotes: data));
      } else {
        emit(DbErrorState(msg: "No Notes added"));
      }
    });

    on<UpdateDbBlocEvent>((event, emit) async{
      emit(DbLoadingState());
      bool check = await mainDb!.updateInDb(newModel: event.newModel, s_no: event.s_no);
      if(check){
        var data = await mainDb!.getFromDb();
        emit(DbLoadedState(allNotes: data));
      }else{
        emit(DbErrorState(msg: "No Notes updated"));
      }
    });

    on<DeleteDbBlocEvent>((event, emit)async{
      emit(DbLoadingState());
      bool check = await mainDb!.deleteInDb(s_no: event.s_no);
      if(check){
        var data = await mainDb!.getFromDb();
        emit(DbLoadedState(allNotes: data));
      }else{
        emit(DbErrorState(msg: "No Notes deleted"));
      }
    });

    on<GetInitialNoteDbBlocEvent>((event, emit) async{
      emit(DbLoadingState());
      var data = await mainDb!.getFromDb();
      emit(DbLoadedState(allNotes: data));
    });
  }
}
