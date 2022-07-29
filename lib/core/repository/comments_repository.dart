import 'dart:convert';

import 'package:test_pkp/constant/comment_list.dart';
import 'package:test_pkp/constant/url_constant.dart';
import 'package:test_pkp/model/comments_model.dart';
import 'package:http/http.dart' as http;

class CommentsRepository {
  Future<List<CommentsModel>> getListPostsData() async {
    List<CommentsModel> listPostsData = [];

    try {
      final response = await http.get(UrlConstant.urlSource);

      final jsonComments = json.decode(response.body);

      for (var comments in jsonComments) {
        listPostsData.add(CommentsModel(
            userId: comments['userId'].toString(),
            id: comments['id'].toString(),
            title: comments['title'],
            body: comments['body']));
      }

      CommentList.commentFromJson.addAll(listPostsData);

      print('getting object from repo');

      return listPostsData;
    } catch (e) {
      return [];
    }
  }
}
