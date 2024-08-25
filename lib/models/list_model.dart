class ListModel{

  String title;
  String desc;

  ListModel({required this.title,required this.desc});

  factory ListModel.fromMap({required Map<String,dynamic>map}){
    return ListModel(title: map['title'], desc: map['desc']);
  }

  Map<String,dynamic> toMap(){
    return {
      'title' : title,
      'desc' : desc
    };
  }
}