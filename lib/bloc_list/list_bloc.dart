import 'package:bloc_list_db/bloc_list/list_events.dart';
import 'package:bloc_list_db/bloc_list/list_states.dart';
import 'package:bloc_list_db/models/list_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListBloc extends Bloc<ListEvents, ListState> {
  ListBloc() : super(ListState(mList: [])) {

    on<AddInListBloc>((event, emit) {
      List<ListModel> currentList = state.mList;
      currentList.add(event.newModel);
      emit(ListState(mList: currentList));
    });

    on<FetchListBloc>((event,emit){
      emit(ListState(mList: state.mList));
    });


  }
}
