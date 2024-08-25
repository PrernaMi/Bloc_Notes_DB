import 'package:bloc_list_db/models/list_model.dart';

abstract class ListEvents{}

class AddInListBloc extends ListEvents{
  ListModel newModel;
  AddInListBloc({required this.newModel});
}

class FetchListBloc extends ListEvents{}