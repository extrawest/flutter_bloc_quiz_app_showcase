import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import 'data_models/quiz_result_model.dart';

part 'quiz_storage_event.dart';
part 'quiz_storage_state.dart';

class QuizStorageBloc extends Bloc<QuizStorageEvent, QuizStorageState> {
  final Box _quizBox;

  QuizStorageBloc(this._quizBox) : super(const QuizStorageInitial()) {
    on<QuizStorageWriteEvent>(_onWriteEvent);
    on<QuizStorageReadEvent>(_onReadEvent);
  }

  Future<void> _onWriteEvent(QuizStorageWriteEvent event, Emitter<QuizStorageState> emit) async {
    await _quizBox.put(
      event.savedQuiz.date.toString(),
      event.savedQuiz,
    );
    emit(const QuizStorageSaved());
  }

  Future<void> _onReadEvent(QuizStorageReadEvent event, Emitter<QuizStorageState> emit) async {
    emit(const QuizStorageFetched().copyWith(quizList: _quizBox.values.toList().cast<SavedQuiz>()));
  }
}
