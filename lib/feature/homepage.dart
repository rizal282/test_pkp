import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_pkp/constant/comment_list.dart';
import 'package:test_pkp/core/cubit/comments_cubit.dart';
import 'package:test_pkp/feature/edit_comments.dart';
import 'package:test_pkp/model/comments_model.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<CommentsModel> listCommentsHome = [];
  bool isLoading = true;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommentsCubit(),
      child: BlocConsumer<CommentsCubit, CommentsState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CommentsInitial) {
            context.read<CommentsCubit>().fetchAllComments();
            print('object initial');
          }

          if (state is CommentsLoading) {
            isLoading = true;
          }

          if (state is CommentsLoaded) {
            listCommentsHome = state.listComments;
            isLoading = false;

            print('object loaded');
          }

          return Scaffold(
            appBar: AppBar(
              title: Text('List Comments '),
            ),
            body: isLoading == true
                ? CircularProgressIndicator()
                : ListView.builder(
                    itemCount: CommentList.commentFromJson.length,
                    itemBuilder: (context, i) => Container(
                      padding: const EdgeInsets.all(10).r,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EditComments(
                                    idComment: listCommentsHome[i].id,
                                    title: listCommentsHome[i].title,
                                    body: listCommentsHome[i].body,
                                  )));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('ID ${listCommentsHome[i].id}'),
                                TextButton(
                                    onPressed: () {
                                      CommentList.commentFromJson.removeWhere(
                                          (element) =>
                                              element.id ==
                                              listCommentsHome[i].id);

                                      print('terhapus');
                                      print(CommentList.commentFromJson.length);

                                      
                                    },
                                    child: Text('Hapus'))
                              ],
                            ),
                            Text('User ID ${listCommentsHome[i].userId}'),
                            5.verticalSpace,
                            Text(
                              listCommentsHome[i].title,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            5.verticalSpace,
                            Text(listCommentsHome[i].body)
                          ],
                        ),
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
