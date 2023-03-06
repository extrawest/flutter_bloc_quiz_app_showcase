part of 'github_search_bloc.dart';

abstract class GithubSearchState extends Equatable {
  const GithubSearchState();

  @override
  List<Object> get props => [];
}

class InitialSearchState extends GithubSearchState {}

class SearchStateLoading extends GithubSearchState {}

class SearchStateSuccess extends GithubSearchState {
  const SearchStateSuccess(this.items);

  final List<SearchResultItem> items;

  @override
  List<Object> get props => [items];

  @override
  String toString() => 'SearchStateSuccess { items: ${items.length} }';
}

class SearchStateError extends GithubSearchState {
  const SearchStateError(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
