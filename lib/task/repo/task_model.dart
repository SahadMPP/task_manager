class TaskModel {
  int? id;
  String? title;
  int? isCompleted;

  TaskModel({this.title, this.isCompleted,this.id});

  factory TaskModel.fromMap(Map value) {
    return TaskModel(
      isCompleted: value['isCompleted'],
      title: value['title'],
      id: value['id'],
    );
  }
}
