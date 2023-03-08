import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'history_screen_event.dart';
part 'history_screen_state.dart';

class HistoryScreenBloc extends Bloc<HistoryScreenEvent, HistoryScreenState> {
  HistoryScreenBloc() : super(HistoryScreenInitial()) {
    on<HistoryScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
