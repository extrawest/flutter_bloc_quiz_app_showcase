import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'one_answer_event.dart';
part 'one_answer_state.dart';

class OneAnswerBloc extends Bloc<OneAnswerEvent, OneAnswerState> {
  OneAnswerBloc() : super(OneAnswerInitial()) {
    on<OneAnswerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
