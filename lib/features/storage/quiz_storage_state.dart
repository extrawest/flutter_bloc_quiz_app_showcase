part of 'quiz_storage_bloc.dart';

class QuizStorageState extends Equatable {
  final List<SavedQuiz>? quizList;

  const QuizStorageState({this.quizList});

  QuizStorageState copyWith({List<SavedQuiz>? quizList}) {
    return QuizStorageState(quizList: quizList ?? this.quizList);
  }

  @override
  List<Object?> get props => [quizList];
}

class QuizStorageInitial extends QuizStorageState {
  const QuizStorageInitial({super.quizList});

  @override
  List<Object?> get props => [quizList];
}

class QuizStorageSaved extends QuizStorageState {
  const QuizStorageSaved({super.quizList});
  @override
  List<Object?> get props => [quizList];
}

class QuizStorageFetched extends QuizStorageState {
  const QuizStorageFetched({super.quizList});
  @override
  List<Object?> get props => [quizList];
}
