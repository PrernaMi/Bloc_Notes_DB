import '../models/list_model.dart';

class ListDbState{}

class DbInitialState extends ListDbState{}

class DbLoadingState extends ListDbState{}

class DbLoadedState extends ListDbState{
  List<ListModel> allNotes = [];
  DbLoadedState({required this.allNotes});
}

class DbErrorState extends ListDbState{
  String msg;
  DbErrorState({required this.msg});
}