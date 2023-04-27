// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'true_false_quiz_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TrueFalseQuiz _$TrueFalseQuizFromJson(Map<String, dynamic> json) {
  return _TrueFalseQuiz.fromJson(json);
}

/// @nodoc
mixin _$TrueFalseQuiz {
  int? get id => throw _privateConstructorUsedError;
  String? get question =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'rightAnswer')
  bool? get rightAnswer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrueFalseQuizCopyWith<TrueFalseQuiz> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrueFalseQuizCopyWith<$Res> {
  factory $TrueFalseQuizCopyWith(
          TrueFalseQuiz value, $Res Function(TrueFalseQuiz) then) =
      _$TrueFalseQuizCopyWithImpl<$Res, TrueFalseQuiz>;
  @useResult
  $Res call(
      {int? id,
      String? question,
      @JsonKey(name: 'rightAnswer') bool? rightAnswer});
}

/// @nodoc
class _$TrueFalseQuizCopyWithImpl<$Res, $Val extends TrueFalseQuiz>
    implements $TrueFalseQuizCopyWith<$Res> {
  _$TrueFalseQuizCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? question = freezed,
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
      rightAnswer: freezed == rightAnswer
          ? _value.rightAnswer
          : rightAnswer // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TrueFalseQuizCopyWith<$Res>
    implements $TrueFalseQuizCopyWith<$Res> {
  factory _$$_TrueFalseQuizCopyWith(
          _$_TrueFalseQuiz value, $Res Function(_$_TrueFalseQuiz) then) =
      __$$_TrueFalseQuizCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? question,
      @JsonKey(name: 'rightAnswer') bool? rightAnswer});
}

/// @nodoc
class __$$_TrueFalseQuizCopyWithImpl<$Res>
    extends _$TrueFalseQuizCopyWithImpl<$Res, _$_TrueFalseQuiz>
    implements _$$_TrueFalseQuizCopyWith<$Res> {
  __$$_TrueFalseQuizCopyWithImpl(
      _$_TrueFalseQuiz _value, $Res Function(_$_TrueFalseQuiz) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? question = freezed,
    Object? rightAnswer = freezed,
  }) {
    return _then(_$_TrueFalseQuiz(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      rightAnswer: freezed == rightAnswer
          ? _value.rightAnswer
          : rightAnswer // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TrueFalseQuiz implements _TrueFalseQuiz {
  const _$_TrueFalseQuiz(
      {this.id, this.question, @JsonKey(name: 'rightAnswer') this.rightAnswer});

  factory _$_TrueFalseQuiz.fromJson(Map<String, dynamic> json) =>
      _$$_TrueFalseQuizFromJson(json);

  @override
  final int? id;
  @override
  final String? question;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'rightAnswer')
  final bool? rightAnswer;

  @override
  String toString() {
    return 'TrueFalseQuiz(id: $id, question: $question, rightAnswer: $rightAnswer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TrueFalseQuiz &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.rightAnswer, rightAnswer) ||
                other.rightAnswer == rightAnswer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, question, rightAnswer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TrueFalseQuizCopyWith<_$_TrueFalseQuiz> get copyWith =>
      __$$_TrueFalseQuizCopyWithImpl<_$_TrueFalseQuiz>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TrueFalseQuizToJson(
      this,
    );
  }
}

abstract class _TrueFalseQuiz implements TrueFalseQuiz {
  const factory _TrueFalseQuiz(
          {final int? id,
          final String? question,
          @JsonKey(name: 'rightAnswer') final bool? rightAnswer}) =
      _$_TrueFalseQuiz;

  factory _TrueFalseQuiz.fromJson(Map<String, dynamic> json) =
      _$_TrueFalseQuiz.fromJson;

  @override
  int? get id;
  @override
  String? get question;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'rightAnswer')
  bool? get rightAnswer;
  @override
  @JsonKey(ignore: true)
  _$$_TrueFalseQuizCopyWith<_$_TrueFalseQuiz> get copyWith =>
      throw _privateConstructorUsedError;
}
