import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'true_false_event.dart';
part 'true_false_state.dart';

class TrueFalseBloc extends Bloc<TrueFalseEvent, TrueFalseState> {
  TrueFalseBloc() : super(TrueFalseInitial()) {
    on<TrueFalseEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
