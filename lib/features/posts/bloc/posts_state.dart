part of 'posts_bloc.dart';

enum PostsStatus { initial, success, failure }

class PostsState extends Equatable {
  final PostsStatus status;
  final List<Post> posts;
  final bool hasReachedMax;
  final String? errorMessage;

  const PostsState({
    this.status = PostsStatus.initial,
    this.posts = const <Post>[],
    this.hasReachedMax = false,
    this.errorMessage,
  });

  PostsState copyWith({
    PostsStatus? status,
    List<Post>? posts,
    bool? hasReachedMax,
    String? errorMessage,
  }) {
    return PostsState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [status, posts, hasReachedMax];

  @override
  String toString() {
    return '''PostsState { status: $status, hasReachedMax: $hasReachedMax, posts: ${posts.length}, errorMessage: $errorMessage }''';
  }
}
