part of 'comments_cubit.dart';

@immutable
abstract class CommentsState {}

class CommentsInitial extends CommentsState {}

class CommentsLoaded extends CommentsState {
  final List<CommentsModel> listComments;

  CommentsLoaded(this.listComments);
}

class CommentsLoading extends CommentsState {
  CommentsLoading();
}
