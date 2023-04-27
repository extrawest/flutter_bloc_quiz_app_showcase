import 'package:bloc_quiz_training/features/one_answer_quiz/bloc/one_answer_bloc.dart';
import 'package:bloc_quiz_training/features/one_answer_quiz/data_models/one_answer_quiz_data_model.dart';
import 'package:bloc_quiz_training/features/one_answer_quiz/repositories/one_answer_quiz_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'one_answer_bloc_test.mocks.dart';

@GenerateMocks([
  OneAnswerQuizRepositoryImpl,
  OneAnswerQuiz,
])
void main() {
  final oneAnswerRepository = MockOneAnswerQuizRepositoryImpl();
  final quiz1 = MockOneAnswerQuiz();
  final quiz2 = MockOneAnswerQuiz();
  final exception = Exception('Test');

  final loadedState = const OneAnswerState().copyWith(
    status: OneAnswerStatus.success,
    quizQuestions: [quiz1],
  );

  final answeredState = const OneAnswerState().copyWith(status: OneAnswerStatus.success, quizQuestions: [
    quiz2
  ], answeredQuestions: [
    {'id': 0, 'answer': 'answer'}
  ]);

  group('$OneAnswerBloc test', () {
    blocTest<OneAnswerBloc, OneAnswerState>(
      '''WHEN $OneAnswerFetchEvent is added
      AND status is ${OneAnswerStatus.initial}
      THEN posts are fetched
      AND proper state is emitted''',
      setUp: () {
        when(oneAnswerRepository.fetchOneAnswerQuiz()).thenAnswer(
          (_) => Future.value([quiz1]),
        );
      },
      build: () => OneAnswerBloc(oneAnswerQuizRepository: oneAnswerRepository),
      verify: (_) => verify(oneAnswerRepository.fetchOneAnswerQuiz()).called(1),
      act: (bloc) => bloc.add(OneAnswerFetchEvent()),
      expect: () => [loadedState],
    );

    blocTest<OneAnswerBloc, OneAnswerState>(
      '''WHEN $OneAnswerFetchEvent is added
      AND status is ${OneAnswerStatus.success}
      AND some posts are already loaded
      THEN quizzes is fetched again with another quiz
      THEN AnswerOnQuestionEvent added twice
      AND proper states are emitted''',
      setUp: () {
        when(oneAnswerRepository.fetchOneAnswerQuiz()).thenAnswer(
              (_) => Future.value([quiz2]),
        );
      },
      build: () => OneAnswerBloc(oneAnswerQuizRepository: oneAnswerRepository),
      seed: () => loadedState,
      verify: (_) => verify(oneAnswerRepository.fetchOneAnswerQuiz()).called(1),
      act: (bloc) => bloc
        ..add(OneAnswerFetchEvent())
        ..add(AnswerOnQuestionEvent(id: 0, answer: 'answer4', rightAnswer: 'answer'))
        ..add(NextQuestionEvent())
        ..add(NextQuestionEvent()),
      expect: () => [
        loadedState.copyWith(quizQuestions: [quiz1, quiz2]),
        answeredState.copyWith(
          quizQuestions: [quiz1, quiz2],
          answeredQuestions: [
            {'id': 0, 'answer': 'answer4'},
          ],
          rightAnswers: 0,
          wrongAnswers: 1,
        ),
        answeredState.copyWith(
          quizQuestions: [quiz1, quiz2],
          answeredQuestions: [
            {'id': 0, 'answer': 'answer4'}
          ],
          actualQuestion: 0,
          rightAnswers: 0,
          wrongAnswers: 1,
        ),
        answeredState.copyWith(
          quizQuestions: [quiz1, quiz2],
          answeredQuestions: [
            {'id': 0, 'answer': 'answer4'}
          ],
          actualQuestion: 1,
          rightAnswers: 0,
          wrongAnswers: 1,
        )
      ],
    );
  });

  blocTest<OneAnswerBloc, OneAnswerState>(
    '''WHEN $OneAnswerFetchEvent is added 
      AND exception is thrown
      THEN proper state is emitted''',
    setUp: () {
      when(oneAnswerRepository.fetchOneAnswerQuiz()).thenThrow(exception);
    },
    build: () => OneAnswerBloc(oneAnswerQuizRepository: oneAnswerRepository),
    verify: (_) => verify(oneAnswerRepository.fetchOneAnswerQuiz()).called(1),
    act: (bloc) => bloc.add(OneAnswerFetchEvent()),
    expect: () => [
      OneAnswerState(
        errorMessage: exception.toString(),
        status: OneAnswerStatus.failure,
      )
    ],
  );
}
