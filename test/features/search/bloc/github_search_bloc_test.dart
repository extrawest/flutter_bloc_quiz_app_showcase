import 'package:bloc_quiz_training/features/search/search.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'github_search_bloc_test.mocks.dart';

@GenerateMocks([
  GithubRepository,
  SearchResultItem,
])
void main() {
  final githubRepository = MockGithubRepository();

  const searchEvent = TextChanged(text: 'test');
  const emptySearchEvent = TextChanged(text: '');
  final exception = Exception('Test');

  final searchResult = SearchResult(items: [
    MockSearchResultItem(),
  ]);

  group('$GithubSearchBloc test', () {
    blocTest<GithubSearchBloc, GithubSearchState>(
      '''WHEN $TextChanged is added 
      AND search text is not empty 
      THEN search is initiated
      AND proper state is emmitted''',
      setUp: () {
        when(githubRepository.search(searchEvent.text)).thenAnswer(
          (_) => Future.value(searchResult),
        );
      },
      build: () => GithubSearchBloc(githubRepository: githubRepository),
      verify: (_) =>
          verify(githubRepository.search(searchEvent.text)).called(1),
      act: (bloc) async {
        bloc.add(searchEvent);
        await Future.delayed(GithubSearchBloc.debounceDuration);
      },
      expect: () => [
        SearchStateLoading(),
        SearchStateSuccess(searchResult.items),
      ],
    );

    blocTest<GithubSearchBloc, GithubSearchState>(
      '''WHEN $TextChanged is added 
      AND search text is empty 
      THEN initial state is emmitted''',
      build: () => GithubSearchBloc(githubRepository: githubRepository),
      act: (bloc) async {
        bloc.add(emptySearchEvent);
        await Future.delayed(GithubSearchBloc.debounceDuration);
      },
      expect: () => [InitialSearchState()],
    );
  });

  blocTest<GithubSearchBloc, GithubSearchState>(
    '''WHEN $TextChanged is added 
      AND search text is not empty 
      AND exception is thrown
      AND proper state is emmitted''',
    setUp: () {
      when(githubRepository.search(searchEvent.text)).thenThrow(exception);
    },
    build: () => GithubSearchBloc(githubRepository: githubRepository),
    verify: (_) => verify(githubRepository.search(searchEvent.text)).called(1),
    act: (bloc) async {
      bloc.add(searchEvent);
      await Future.delayed(GithubSearchBloc.debounceDuration);
    },
    expect: () => [
      SearchStateLoading(),
      SearchStateError(exception.toString()),
    ],
  );
}
