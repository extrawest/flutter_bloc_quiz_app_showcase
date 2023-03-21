import 'package:bloc_quiz_training/features/true_false_quiz/data_models/true_false_quiz_data_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../one_answer_quiz/repositories/true_false_quiz_repository.dart';

part 'true_false_event.dart';
part 'true_false_state.dart';

class TrueFalseBloc extends Bloc<TrueFalseEvent, TrueFalseState> {
  final TrueFalseQuizRepositoryImpl trueFalseQuizRepository;

  TrueFalseBloc({required this.trueFalseQuizRepository}) : super(TrueFalseInitial()) {
    on<TrueFalseFetchEvent>(_onQuizQuestionFetched);
    on<AnswerOnQuestionEvent>(_answeredOnQuestion);
    on<NextQuestionEvent>(_nextQuestion);
  }

  Future<void> _onQuizQuestionFetched(TrueFalseFetchEvent event, Emitter<TrueFalseState> emit) async {
    try {
      if (state.status == TrueFalseStatus.initial) {
        final questions = await trueFalseQuizRepository.fetchOneAnswerQuiz();
        return emit(
          state.copyWith(status: TrueFalseStatus.success, quizQuestions: questions),
        );
      }
      final questions = await trueFalseQuizRepository.fetchOneAnswerQuiz();
      emit(
        state.copyWith(
          status: TrueFalseStatus.success,
          quizQuestions: List.of(state.quizQuestions)..addAll(questions),
          hasReachedMax: false,
        ),
      );
    } catch (e, _) {
      /// use exception and [stackTrace] in Firebase Crashlytics or Sentry (for Web)
      emit(
        state.copyWith(
          status: TrueFalseStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _nextQuestion(NextQuestionEvent event, Emitter<TrueFalseState> emit) async {
    if (event.actualQuestion == null) {
      emit(
        state.copyWith(actualQuestion: 0),
      );
    } else {
      emit(
        state.copyWith(actualQuestion: event.actualQuestion! + 1),
      );
    }
  }

  Future<void> _answeredOnQuestion(AnswerOnQuestionEvent event, Emitter<TrueFalseState> emit) async {
    emit(state.copyWith(
        answeredQuestions: List.of(state.answeredQuestions)..add({'id': event.id, 'answer': event.answer})));
  }
}
