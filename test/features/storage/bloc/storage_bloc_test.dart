import 'package:bloc_quiz_training/features/storage/data_models/quiz_result_model.dart';
import 'package:bloc_quiz_training/features/storage/quiz_storage_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../theme/bloc/theme_bloc_test.mocks.dart';

@GenerateMocks([
  Box,
])
void main() {
  final box = MockBox();
  const storageState = QuizStorageSaved();
  const storageState2 = QuizStorageFetched();
  const String boxKey = '1680516242721';
  final savedQuiz = SavedQuiz(
    date: 1680516242721,
    rightAnswers: 4,
    wrongAnswers: 0,
    quizType: QuizType.trueFalse,
  );

  group('$QuizStorageBloc test', () {
    blocTest<QuizStorageBloc, QuizStorageState>(
      '''WHEN $QuizStorageWriteEvent is added
      THEN box.put is called
      AND proper state is emitted''',
      setUp: () {
        when(
          box.put(boxKey, savedQuiz),
        ).thenAnswer(
          (_) => Future.value(null),
        );
      },
      build: () => QuizStorageBloc(box),
      verify: (_) => verify(
        box.put(boxKey, savedQuiz),
      ).called(1),
      act: (bloc) => bloc.add(QuizStorageWriteEvent(savedQuiz: savedQuiz)),
      expect: () => [storageState],
    );

    blocTest<QuizStorageBloc, QuizStorageState>(
      '''WHEN $QuizStorageWriteEvent is added
      THEN box.values is called
      AND proper state is emitted''',
      setUp: () {
        when(
          box.values.toList().cast<SavedQuiz>(),
        ).thenReturn([savedQuiz]);
        when(
          box.put(boxKey, savedQuiz),
        ).thenAnswer(
          (_) => Future.value(null),
        );
      },
      build: () => QuizStorageBloc(box),
      verify: (_) => verify(box.values.toList().cast<SavedQuiz>()).called(1),
      act: (bloc) => bloc.add(QuizStorageReadEvent()),
      expect: () => [
        storageState2.copyWith(quizList: [savedQuiz]),
      ],
    );
  });
}
