import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_transform/stream_transform.dart';

import '../models/search_result_item.dart';
import '../repositories/github_repository.dart';

part 'github_search_event.dart';

part 'github_search_state.dart';

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class GithubSearchBloc extends Bloc<GithubSearchEvent, GithubSearchState> {
  GithubSearchBloc({required this.githubRepository})
      : super(InitialSearchState()) {
    on<TextChanged>(_onTextChanged, transformer: debounce(debounceDuration));
  }

  @visibleForTesting
  static const debounceDuration = Duration(milliseconds: 300);

  final GithubRepository githubRepository;

  Future<void> _onTextChanged(
    TextChanged event,
    Emitter<GithubSearchState> emit,
  ) async {
    print('AAAA KEKW');
    final searchTerm = event.text;

    if (searchTerm.isEmpty) {
      return emit(InitialSearchState());
    }

    emit(SearchStateLoading());

    try {
      final results = await githubRepository.search(searchTerm);
      emit(SearchStateSuccess(results.items));
    } catch (e, _) {
      emit(SearchStateError(e.toString()));
    }
  }
}
