import 'package:bloc_quiz_training/features/posts/posts.dart';
import 'package:bloc_quiz_training/features/posts/repositories/posts_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'posts_bloc_test.mocks.dart';

@GenerateMocks([
  PostsRepository,
  Post,
])
void main() {
  final postsRepository = MockPostsRepository();
  final post1 = MockPost();
  final post2 = MockPost();
  final exception = Exception('Test');

  final loadedState = const PostsState().copyWith(
    status: PostsStatus.success,
    hasReachedMax: false,
    posts: [post1],
  );

  group('$PostBloc test', () {
    blocTest<PostBloc, PostsState>(
      '''WHEN $PostsFetchEvent is added 
      AND status is ${PostsStatus.initial} 
      THEN posts are fetched with empty index 
      AND proper state is emmitted''',
      setUp: () {
        when(postsRepository.fetchPosts()).thenAnswer(
          (_) => Future.value([post1]),
        );
      },
      build: () => PostBloc(postsRepository: postsRepository),
      verify: (_) => verify(postsRepository.fetchPosts()).called(1),
      act: (bloc) => bloc.add(PostsFetchEvent()),
      expect: () => [loadedState],
    );

    blocTest<PostBloc, PostsState>(
      '''WHEN $PostsFetchEvent is added 
      AND status is ${PostsStatus.success} 
      AND some posts are already loaded
      THEN posts is fetched with index equal to posts list length
      AND proper state is emmitted''',
      setUp: () {
        when(postsRepository.fetchPosts(startIndex: 1)).thenAnswer(
          (_) => Future.value([post2]),
        );
      },
      build: () => PostBloc(postsRepository: postsRepository),
      seed: () => loadedState,
      verify: (_) =>
          verify(postsRepository.fetchPosts(startIndex: 1)).called(1),
      act: (bloc) => bloc.add(PostsFetchEvent()),
      expect: () => [
        loadedState.copyWith(posts: [...loadedState.posts, post2])
      ],
    );

    blocTest<PostBloc, PostsState>(
      '''WHEN $PostsFetchEvent is added 
      AND status is ${PostsStatus.success} 
      AND fetched posts is empty
      THEN hasReachedMax is true
      AND proper state is emmitted''',
      setUp: () {
        when(postsRepository.fetchPosts(startIndex: 1)).thenAnswer(
          (_) => Future.value([]),
        );
      },
      build: () => PostBloc(postsRepository: postsRepository),
      seed: () => loadedState,
      verify: (_) =>
          verify(postsRepository.fetchPosts(startIndex: 1)).called(1),
      act: (bloc) => bloc.add(PostsFetchEvent()),
      expect: () => [
        loadedState.copyWith(hasReachedMax: true),
      ],
    );
  });

  blocTest<PostBloc, PostsState>(
    '''WHEN $PostsFetchEvent is added 
      AND exception is thrown
      THEN proper state is emmitted''',
    setUp: () {
      when(postsRepository.fetchPosts()).thenThrow(exception);
    },
    build: () => PostBloc(postsRepository: postsRepository),
    verify: (_) => verify(postsRepository.fetchPosts()).called(1),
    act: (bloc) => bloc.add(PostsFetchEvent()),
    expect: () => [
      PostsState(
        errorMessage: exception.toString(),
        status: PostsStatus.failure,
      )
    ],
  );
}
