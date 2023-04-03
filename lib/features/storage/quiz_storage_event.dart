part of 'quiz_storage_bloc.dart';

abstract class QuizStorageEvent extends Equatable {
  const QuizStorageEvent();
  @override
  List<Object?> get props => [];
}

class QuizStorageReadEvent extends QuizStorageEvent {}

class QuizStorageWriteEvent extends QuizStorageEvent {
  final SavedQuiz savedQuiz;

  const QuizStorageWriteEvent({required this.savedQuiz});
}
