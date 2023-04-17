import 'package:bloc_quiz_training/features/true_false_quiz/data_models/true_false_quiz_data_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../storage/data_models/quiz_result_model.dart';
import '../repositories/true_false_quiz_repository.dart';

part 'true_false_event.dart';
part 'true_false_state.dart';

class TrueFalseBloc extends Bloc<TrueFalseEvent, TrueFalseState> {
  final TrueFalseQuizRepository trueFalseQuizRepository;

  TrueFalseBloc({required this.trueFalseQuizRepository}) : super(TrueFalseInitial()) {
    on<TrueFalseFetchEvent>(_onQuizQuestionFetched);
    on<AnswerOnTrueFalseQuestionEvent>(_answeredOnQuestion);
    on<NextTrueFalseQuestionEvent>(_nextQuestion);
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

  Future<void> _nextQuestion(NextTrueFalseQuestionEvent event, Emitter<TrueFalseState> emit) async {
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

  Future<void> _answeredOnQuestion(AnswerOnTrueFalseQuestionEvent event, Emitter<TrueFalseState> emit) async {
    final isRightAnswer = event.answer == event.rightAnswer;
    emit(state.copyWith(
        rightAnswers: isRightAnswer ? state.rightAnswers + 1 : state.rightAnswers,
        wrongAnswers: !isRightAnswer ? state.wrongAnswers + 1 : state.wrongAnswers,
        answeredQuestions: List.of(state.answeredQuestions)
          ..add({
            'id': event.id,
            'answer': event.answer,
          })));
  }
}
