import 'package:bloc_list_db/bloc/count_events.dart';
import 'package:bloc_list_db/bloc/count_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountBloc extends Bloc<CountEvent,CountState>{
  CountBloc() : super(CountState(count: 0)){

    on<IncrementCount>((event,emit){
      emit(CountState(count: state.count+1));
    });
  }
}