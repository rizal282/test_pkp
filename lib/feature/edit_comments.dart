import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_pkp/constant/comment_list.dart';
import 'package:test_pkp/model/comments_model.dart';

class EditComments extends StatefulWidget {
  EditComments({Key? key, this.idComment = '', this.title = '', this.body = ''})
      : super(key: key);

  String idComment, title, body;

  @override
  State<EditComments> createState() => _EditCommentsState();
}

class _EditCommentsState extends State<EditComments> {
  TextEditingController judul = TextEditingController();
  TextEditingController body = TextEditingController();

  List<CommentsModel> commentToEdit = [];

  void getEditCommentFromList() {
    var comment = CommentList.commentFromJson
        .firstWhere((element) => element.id == widget.idComment);

    setState(() {
      commentToEdit.add(comment);
      judul.text = commentToEdit[0].title;
      body.text = commentToEdit[0].body;
    });
  }

  void editComment() {
    CommentList.commentFromJson[CommentList.commentFromJson
            .indexWhere((element) => element.id == widget.idComment)] =
        CommentsModel(id: widget.idComment, title: judul.text, body: body.text);

    print('updated');

    print(CommentList
        .commentFromJson[CommentList.commentFromJson
            .indexWhere((element) => element.id == widget.idComment)]
        .body);

        print(CommentList
        .commentFromJson[CommentList.commentFromJson
            .indexWhere((element) => element.id == widget.idComment)]
        .title);
    Navigator.pop(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    getEditCommentFromList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Comment'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10).r,
        child: Column(
          children: [
            TextFormField(
              controller: judul,
            ),
            TextFormField(
              controller: body,
            ),
            OutlinedButton(
                onPressed: () => editComment(), child: Text('Update'))
          ],
        ),
      ),
    );
  }
}
