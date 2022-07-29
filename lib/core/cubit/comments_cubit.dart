import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_pkp/core/repository/comments_repository.dart';
import 'package:test_pkp/model/comments_model.dart';

part 'comments_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  CommentsCubit() : super(CommentsInitial());

  final commentsRepository = CommentsRepository();

  var listCommentsCubit = <CommentsModel>[];

  Future<void> fetchAllComments() async {
    if (state is CommentsInitial) {
      await commentsRepository.getListPostsData().then((comments) {
        listCommentsCubit.addAll(comments);
      });

      emit(CommentsLoaded(listCommentsCubit));
    }
  }
}
