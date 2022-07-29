class CommentsModel {
  final String userId;
  final String id;
  final String title;
  final String body;

  CommentsModel({this.userId = '', this.id = '', this.title = '', this.body = ''});

  // factory CrudModel.fromJson(dynamic obj) {
  //   return CrudModel(
  //     userId: obj['userId'],
  //     id: obj['id'],
  //     title: obj['title'],
  //     body: obj['body']
  //   );
  // }
}
