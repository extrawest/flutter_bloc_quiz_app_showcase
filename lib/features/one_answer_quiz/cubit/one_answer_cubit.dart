import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'one_answer_state.dart';

class OneAnswerCubit extends Cubit<OneAnswerCubitState> {
  OneAnswerCubit() : super(const OneAnswerButtonInitial());

  Future<void> selectAnswer({required int index}) async {
    emit(OneAnswerButtonSelected(index: index));
  }

  Future<void> initial() async {
    emit(const OneAnswerButtonInitial());
  }
}
