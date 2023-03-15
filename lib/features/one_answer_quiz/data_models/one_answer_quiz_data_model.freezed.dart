// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'one_answer_quiz_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OneAnswerQuiz _$OneAnswerQuizFromJson(Map<String, dynamic> json) {
  return _OneAnswerQuiz.fromJson(json);
}

/// @nodoc
mixin _$OneAnswerQuiz {
  int? get id => throw _privateConstructorUsedError;
  String? get question => throw _privateConstructorUsedError;
  List<String>? get answers => throw _privateConstructorUsedError;
  String? get rightAnswer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OneAnswerQuizCopyWith<OneAnswerQuiz> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OneAnswerQuizCopyWith<$Res> {
  factory $OneAnswerQuizCopyWith(
          OneAnswerQuiz value, $Res Function(OneAnswerQuiz) then) =
      _$OneAnswerQuizCopyWithImpl<$Res, OneAnswerQuiz>;
  @useResult
  $Res call(
      {int? id, String? question, List<String>? answers, String? rightAnswer});
}

/// @nodoc
class _$OneAnswerQuizCopyWithImpl<$Res, $Val extends OneAnswerQuiz>
    implements $OneAnswerQuizCopyWith<$Res> {
  _$OneAnswerQuizCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? question = freezed,
    Object? answers = freezed,
    Object? rightAnswer = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      answers: freezed == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      rightAnswer: freezed == rightAnswer
          ? _value.rightAnswer
          : rightAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OneAnswerQuizCopyWith<$Res>
    implements $OneAnswerQuizCopyWith<$Res> {
  factory _$$_OneAnswerQuizCopyWith(
          _$_OneAnswerQuiz value, $Res Function(_$_OneAnswerQuiz) then) =
      __$$_OneAnswerQuizCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id, String? question, List<String>? answers, String? rightAnswer});
}

/// @nodoc
class __$$_OneAnswerQuizCopyWithImpl<$Res>
    extends _$OneAnswerQuizCopyWithImpl<$Res, _$_OneAnswerQuiz>
    implements _$$_OneAnswerQuizCopyWith<$Res> {
  __$$_OneAnswerQuizCopyWithImpl(
      _$_OneAnswerQuiz _value, $Res Function(_$_OneAnswerQuiz) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? question = freezed,
    Object? answers = freezed,
    Object? rightAnswer = freezed,
  }) {
    return _then(_$_OneAnswerQuiz(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      answers: freezed == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      rightAnswer: freezed == rightAnswer
          ? _value.rightAnswer
          : rightAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OneAnswerQuiz implements _OneAnswerQuiz {
  const _$_OneAnswerQuiz(
      {required this.id,
      required this.question,
      required final List<String>? answers,
      required this.rightAnswer})
      : _answers = answers;

  factory _$_OneAnswerQuiz.fromJson(Map<String, dynamic> json) =>
      _$$_OneAnswerQuizFromJson(json);

  @override
  final int? id;
  @override
  final String? question;
  final List<String>? _answers;
  @override
  List<String>? get answers {
    final value = _answers;
    if (value == null) return null;
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? rightAnswer;

  @override
  String toString() {
    return 'OneAnswerQuiz(id: $id, question: $question, answers: $answers, rightAnswer: $rightAnswer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OneAnswerQuiz &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.rightAnswer, rightAnswer) ||
                other.rightAnswer == rightAnswer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, question,
      const DeepCollectionEquality().hash(_answers), rightAnswer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OneAnswerQuizCopyWith<_$_OneAnswerQuiz> get copyWith =>
      __$$_OneAnswerQuizCopyWithImpl<_$_OneAnswerQuiz>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OneAnswerQuizToJson(
      this,
    );
  }
}

abstract class _OneAnswerQuiz implements OneAnswerQuiz {
  const factory _OneAnswerQuiz(
      {required final int? id,
      required final String? question,
      required final List<String>? answers,
      required final String? rightAnswer}) = _$_OneAnswerQuiz;

  factory _OneAnswerQuiz.fromJson(Map<String, dynamic> json) =
      _$_OneAnswerQuiz.fromJson;

  @override
  int? get id;
  @override
  String? get question;
  @override
  List<String>? get answers;
  @override
  String? get rightAnswer;
  @override
  @JsonKey(ignore: true)
  _$$_OneAnswerQuizCopyWith<_$_OneAnswerQuiz> get copyWith =>
      throw _privateConstructorUsedError;
}
