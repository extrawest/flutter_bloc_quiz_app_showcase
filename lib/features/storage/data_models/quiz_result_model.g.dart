// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_result_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SavedQuizAdapter extends TypeAdapter<SavedQuiz> {
  @override
  final int typeId = 0;

  @override
  SavedQuiz read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SavedQuiz(
      date: fields[0] as int,
      rightAnswers: fields[1] as int,
      wrongAnswers: fields[2] as int,
      quizType: fields[3] as QuizType,
    );
  }

  @override
  void write(BinaryWriter writer, SavedQuiz obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.rightAnswers)
      ..writeByte(2)
      ..write(obj.wrongAnswers)
      ..writeByte(3)
      ..write(obj.quizType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SavedQuizAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class QuizTypeAdapter extends TypeAdapter<QuizType> {
  @override
  final int typeId = 1;

  @override
  QuizType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return QuizType.none;
      case 1:
        return QuizType.oneAnswer;
      case 2:
        return QuizType.trueFalse;
      default:
        return QuizType.none;
    }
  }

  @override
  void write(BinaryWriter writer, QuizType obj) {
    switch (obj) {
      case QuizType.none:
        writer.writeByte(0);
        break;
      case QuizType.oneAnswer:
        writer.writeByte(1);
        break;
      case QuizType.trueFalse:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuizTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
