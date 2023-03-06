import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

import '../models/post.dart';
import '../repositories/posts_repository.dart';

part 'posts_event.dart';

part 'posts_state.dart';

const throttleDuration = Duration(milliseconds: 100);

/// [throttleDroppable] Used to run only once in 100 milliseconds, not more often
EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class PostBloc extends Bloc<PostsEvent, PostsState> {
  final PostsRepository postsRepository;

  PostBloc({required this.postsRepository}) : super(const PostsState()) {
    // This function will run only once in 100 milliseconds, not more often
    on<PostsFetchEvent>(_onPostFetched,
        transformer: throttleDroppable(throttleDuration));
  }

  Future<void> _onPostFetched(
      PostsFetchEvent event, Emitter<PostsState> emit) async {
    if (state.hasReachedMax) {
      return;
    }

    try {
      if (state.status == PostsStatus.initial) {
        final posts = await postsRepository.fetchPosts();
        return emit(
          state.copyWith(
              status: PostsStatus.success, posts: posts, hasReachedMax: false),
        );
      }
      final posts =
          await postsRepository.fetchPosts(startIndex: state.posts.length);
      posts.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: PostsStatus.success,
                posts: List.of(state.posts)..addAll(posts),
                hasReachedMax: false,
              ),
            );
    } catch (e, _) {
      /// use exception and [stackTrace] in Firebase Crashlytics or Sentry (for Web)
      emit(
        state.copyWith(
          status: PostsStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
