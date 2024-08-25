import '../models/list_model.dart';

abstract class ListDbEvents {}

class AddDbBlocEvent extends ListDbEvents {
  ListModel newModel;

  AddDbBlocEvent({required this.newModel});
}

class UpdateDbBlocEvent extends ListDbEvents {
  ListModel newModel;
  int s_no;

  UpdateDbBlocEvent({required this.newModel, required this.s_no});
}

class DeleteDbBlocEvent extends ListDbEvents {
  int s_no;

  DeleteDbBlocEvent({required this.s_no});
}

class GetInitialNoteDbBlocEvent extends ListDbEvents {}
