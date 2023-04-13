import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:translator/translator.dart';

import '../../../generated/locale_keys.g.dart';

part 'true_false_translate_state.dart';

class TrueFalseTranslateCubit extends Cubit<TrueFalseTranslateState> {
  TrueFalseTranslateCubit() : super(TrueFalseTranslateInitial());

  Future<void> translateQuestion(String langCode, String? question) async {
    if (question != null) {
      String tempQuestion = question;
      if (langCode == 'uk') {
        await GoogleTranslator().translate(question, from: 'en', to: 'uk').then((value) {
          tempQuestion = value.text;
        });
        emit(TrueFalseTranslated(tempQuestion));
      } else {
        emit(TrueFalseTranslated(question));
      }
    } else {
      emit(TrueFalseTranslated(tr(LocaleKeys.something_went_wrong)));
    }
  }

  Future<void> setInitial() async {
    emit(TrueFalseTranslateInitial());
  }
}
