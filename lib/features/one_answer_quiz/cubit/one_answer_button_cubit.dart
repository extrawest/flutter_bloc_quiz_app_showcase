import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'one_answer_button_state.dart';

class OneAnswerButtonCubit extends Cubit<OneAnswerButtonState> {
  OneAnswerButtonCubit() : super(const OneAnswerButtonInitial());

  int? selectedButton;

  Future<void> selectAnswer({required int index}) async {
    // emit(const OneAnswerButtonInitial());
    selectedButton = index;
    emit(OneAnswerButtonSelected(index: index));
  }

  Future<void> unselectAction() async {
    emit(const OneAnswerButtonInitial());
  }
}
