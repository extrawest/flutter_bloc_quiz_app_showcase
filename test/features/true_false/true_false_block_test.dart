import 'package:bloc_quiz_training/features/true_false_quiz/bloc/true_false_bloc.dart';
import 'package:bloc_quiz_training/features/true_false_quiz/data_models/true_false_quiz_data_model.dart';
import 'package:bloc_quiz_training/features/true_false_quiz/repositories/true_false_quiz_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'true_false_block_test.mocks.dart';

@GenerateMocks([
  TrueFalseQuizRepositoryImpl,
  TrueFalseQuiz,
])
void main() {
  final trueFalseRepository = MockTrueFalseQuizRepositoryImpl();
  final quiz1 = MockTrueFalseQuiz();
  final quiz2 = MockTrueFalseQuiz();
  final exception = Exception('Test');

  final loadedState = const TrueFalseState().copyWith(
    status: TrueFalseStatus.success,
    quizQuestions: [quiz1],
  );

  final answeredState = const TrueFalseState().copyWith(status: TrueFalseStatus.success, quizQuestions: [
    quiz2
  ], answeredQuestions: [
    {'id': 0, 'answer': true}
  ]);

  group('$TrueFalseBloc test', () {
    blocTest<TrueFalseBloc, TrueFalseState>(
      '''WHEN $TrueFalseFetchEvent is added
      AND status is ${TrueFalseStatus.initial}
      THEN posts are fetched
      AND proper state is emitted''',
      setUp: () {
        when(trueFalseRepository.fetchOneAnswerQuiz()).thenAnswer(
          (_) => Future.value([quiz1]),
        );
      },
      build: () => TrueFalseBloc(trueFalseQuizRepository: trueFalseRepository),
      verify: (_) => verify(trueFalseRepository.fetchOneAnswerQuiz()).called(1),
      act: (bloc) => bloc.add(TrueFalseFetchEvent()),
      expect: () => [loadedState],
    );

    blocTest<TrueFalseBloc, TrueFalseState>(
      '''WHEN $TrueFalseFetchEvent is added
      AND status is ${TrueFalseStatus.success}
      AND some posts are already loaded
      THEN quizzes is fetched again with another quiz
      THEN AnswerOnQuestionEvent added twice
      AND proper states are emitted''',
      setUp: () {
        when(trueFalseRepository.fetchOneAnswerQuiz()).thenAnswer(
          (_) => Future.value([quiz2]),
        );
      },
      build: () => TrueFalseBloc(trueFalseQuizRepository: trueFalseRepository),
      seed: () => loadedState,
      verify: (_) => verify(trueFalseRepository.fetchOneAnswerQuiz()).called(1),
      act: (bloc) => bloc
        ..add(TrueFalseFetchEvent())
        ..add(AnswerOnQuestionEvent(id: 0, answer: true, rightAnswer: false))
        ..add(NextQuestionEvent(null))
        ..add(NextQuestionEvent(0)),
      expect: () => [
        loadedState.copyWith(quizQuestions: [quiz1, quiz2]),
        answeredState.copyWith(
          quizQuestions: [quiz1, quiz2],
          answeredQuestions: [
            {'id': 0, 'answer': true},
          ],
          rightAnswers: 0,
          wrongAnswers: 1,
        ),
        answeredState.copyWith(
          quizQuestions: [quiz1, quiz2],
          answeredQuestions: [
            {'id': 0, 'answer': true}
          ],
          actualQuestion: 0,
          rightAnswers: 0,
          wrongAnswers: 1,
        ),
        answeredState.copyWith(
          quizQuestions: [quiz1, quiz2],
          answeredQuestions: [
            {'id': 0, 'answer': true}
          ],
          actualQuestion: 1,
          rightAnswers: 0,
          wrongAnswers: 1,
        )
      ],
    );
  });

  blocTest<TrueFalseBloc, TrueFalseState>(
    '''WHEN $TrueFalseFetchEvent is added 
      AND exception is thrown
      THEN proper state is emitted''',
    setUp: () {
      when(trueFalseRepository.fetchOneAnswerQuiz()).thenThrow(exception);
    },
    build: () => TrueFalseBloc(trueFalseQuizRepository: trueFalseRepository),
    verify: (_) => verify(trueFalseRepository.fetchOneAnswerQuiz()).called(1),
    act: (bloc) => bloc.add(TrueFalseFetchEvent()),
    expect: () => [
      TrueFalseState(
        errorMessage: exception.toString(),
        status: TrueFalseStatus.failure,
      )
    ],
  );
}
