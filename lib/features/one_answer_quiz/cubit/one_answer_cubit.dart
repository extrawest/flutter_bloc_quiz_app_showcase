import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'one_answer_cubit_state.dart';

class OneAnswerCubit extends Cubit<OneAnswerCubitState> {
  OneAnswerCubit() : super(const OneAnswerButtonInitial());

  Future<void> selectAnswer({required int index}) async {
    emit(OneAnswerButtonSelected(index: index));
  }

  Future<void> initial() async {
    emit(const OneAnswerButtonInitial());
  }
}
