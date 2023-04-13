import 'package:bloc_quiz_training/features/one_answer_quiz/data_models/one_answer_quiz_data_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../storage/data_models/quiz_result_model.dart';
import '../repositories/one_answer_quiz_repository.dart';

part 'one_answer_event.dart';
part 'one_answer_state.dart';

class OneAnswerBloc extends Bloc<OneAnswerEvent, OneAnswerState> {
  final OneAnswerQuizRepository oneAnswerQuizRepository;

  OneAnswerBloc({required this.oneAnswerQuizRepository}) : super(OneAnswerInitial()) {
    on<OneAnswerFetchEvent>(_onQuizQuestionFetched);
    on<NextQuestionEvent>(_nextQuestion);
    on<AnswerOnQuestionEvent>(_answeredOnQuestion);
  }

  Future<void> _onQuizQuestionFetched(OneAnswerFetchEvent event, Emitter<OneAnswerState> emit) async {
    try {
      if (state.status == OneAnswerStatus.initial) {
        final questions = await oneAnswerQuizRepository.fetchOneAnswerQuiz();
        return emit(
          state.copyWith(status: OneAnswerStatus.success, quizQuestions: questions),
        );
      }
      final questions = await oneAnswerQuizRepository.fetchOneAnswerQuiz();
      emit(
        state.copyWith(
          status: OneAnswerStatus.success,
          quizQuestions: List.of(state.quizQuestions)..addAll(questions),
          hasReachedMax: false,
        ),
      );
    } catch (e, _) {
      /// use exception and [stackTrace] in Firebase Crashlytics or Sentry (for Web)
      emit(
        state.copyWith(
          status: OneAnswerStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _nextQuestion(NextQuestionEvent event, Emitter<OneAnswerState> emit) async {
    if (state.actualQuestion == null) {
      emit(
        state.copyWith(actualQuestion: 0),
      );
    } else {
      emit(
        state.copyWith(actualQuestion: state.actualQuestion! + 1),
      );
    }
  }

  Future<void> _answeredOnQuestion(AnswerOnQuestionEvent event, Emitter<OneAnswerState> emit) async {
    final isRightAnswer = event.answer == event.rightAnswer;
    emit(state.copyWith(
        rightAnswers: isRightAnswer ? state.rightAnswers + 1 : state.rightAnswers,
        wrongAnswers: !isRightAnswer ? state.wrongAnswers + 1 : state.wrongAnswers,
        answeredQuestions: List.of(state.answeredQuestions)..add({'id': event.id, 'answer': event.answer})));
  }
}
