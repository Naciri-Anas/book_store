// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loading_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoadingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(String? message, MessageType? type) error,
    required TResult Function(String? message, MessageType? type) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(String? message, MessageType? type)? error,
    TResult? Function(String? message, MessageType? type)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(String? message, MessageType? type)? error,
    TResult Function(String? message, MessageType? type)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LOADING value) loading,
    required TResult Function(EMPTY value) empty,
    required TResult Function(ERROR value) error,
    required TResult Function(LOADED value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LOADING value)? loading,
    TResult? Function(EMPTY value)? empty,
    TResult? Function(ERROR value)? error,
    TResult? Function(LOADED value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LOADING value)? loading,
    TResult Function(EMPTY value)? empty,
    TResult Function(ERROR value)? error,
    TResult Function(LOADED value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadingStateCopyWith<$Res> {
  factory $LoadingStateCopyWith(
          LoadingState value, $Res Function(LoadingState) then) =
      _$LoadingStateCopyWithImpl<$Res, LoadingState>;
}

/// @nodoc
class _$LoadingStateCopyWithImpl<$Res, $Val extends LoadingState>
    implements $LoadingStateCopyWith<$Res> {
  _$LoadingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LOADINGImplCopyWith<$Res> {
  factory _$$LOADINGImplCopyWith(
          _$LOADINGImpl value, $Res Function(_$LOADINGImpl) then) =
      __$$LOADINGImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LOADINGImplCopyWithImpl<$Res>
    extends _$LoadingStateCopyWithImpl<$Res, _$LOADINGImpl>
    implements _$$LOADINGImplCopyWith<$Res> {
  __$$LOADINGImplCopyWithImpl(
      _$LOADINGImpl _value, $Res Function(_$LOADINGImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LOADINGImpl implements LOADING {
  const _$LOADINGImpl();

  @override
  String toString() {
    return 'LoadingState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LOADINGImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(String? message, MessageType? type) error,
    required TResult Function(String? message, MessageType? type) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(String? message, MessageType? type)? error,
    TResult? Function(String? message, MessageType? type)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(String? message, MessageType? type)? error,
    TResult Function(String? message, MessageType? type)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LOADING value) loading,
    required TResult Function(EMPTY value) empty,
    required TResult Function(ERROR value) error,
    required TResult Function(LOADED value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LOADING value)? loading,
    TResult? Function(EMPTY value)? empty,
    TResult? Function(ERROR value)? error,
    TResult? Function(LOADED value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LOADING value)? loading,
    TResult Function(EMPTY value)? empty,
    TResult Function(ERROR value)? error,
    TResult Function(LOADED value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LOADING implements LoadingState {
  const factory LOADING() = _$LOADINGImpl;
}

/// @nodoc
abstract class _$$EMPTYImplCopyWith<$Res> {
  factory _$$EMPTYImplCopyWith(
          _$EMPTYImpl value, $Res Function(_$EMPTYImpl) then) =
      __$$EMPTYImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EMPTYImplCopyWithImpl<$Res>
    extends _$LoadingStateCopyWithImpl<$Res, _$EMPTYImpl>
    implements _$$EMPTYImplCopyWith<$Res> {
  __$$EMPTYImplCopyWithImpl(
      _$EMPTYImpl _value, $Res Function(_$EMPTYImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EMPTYImpl implements EMPTY {
  const _$EMPTYImpl();

  @override
  String toString() {
    return 'LoadingState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EMPTYImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(String? message, MessageType? type) error,
    required TResult Function(String? message, MessageType? type) loaded,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(String? message, MessageType? type)? error,
    TResult? Function(String? message, MessageType? type)? loaded,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(String? message, MessageType? type)? error,
    TResult Function(String? message, MessageType? type)? loaded,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LOADING value) loading,
    required TResult Function(EMPTY value) empty,
    required TResult Function(ERROR value) error,
    required TResult Function(LOADED value) loaded,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LOADING value)? loading,
    TResult? Function(EMPTY value)? empty,
    TResult? Function(ERROR value)? error,
    TResult? Function(LOADED value)? loaded,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LOADING value)? loading,
    TResult Function(EMPTY value)? empty,
    TResult Function(ERROR value)? error,
    TResult Function(LOADED value)? loaded,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class EMPTY implements LoadingState {
  const factory EMPTY() = _$EMPTYImpl;
}

/// @nodoc
abstract class _$$ERRORImplCopyWith<$Res> {
  factory _$$ERRORImplCopyWith(
          _$ERRORImpl value, $Res Function(_$ERRORImpl) then) =
      __$$ERRORImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message, MessageType? type});
}

/// @nodoc
class __$$ERRORImplCopyWithImpl<$Res>
    extends _$LoadingStateCopyWithImpl<$Res, _$ERRORImpl>
    implements _$$ERRORImplCopyWith<$Res> {
  __$$ERRORImplCopyWithImpl(
      _$ERRORImpl _value, $Res Function(_$ERRORImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? type = freezed,
  }) {
    return _then(_$ERRORImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageType?,
    ));
  }
}

/// @nodoc

class _$ERRORImpl implements ERROR {
  const _$ERRORImpl({this.message, this.type});

  @override
  final String? message;
  @override
  final MessageType? type;

  @override
  String toString() {
    return 'LoadingState.error(message: $message, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ERRORImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ERRORImplCopyWith<_$ERRORImpl> get copyWith =>
      __$$ERRORImplCopyWithImpl<_$ERRORImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(String? message, MessageType? type) error,
    required TResult Function(String? message, MessageType? type) loaded,
  }) {
    return error(message, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(String? message, MessageType? type)? error,
    TResult? Function(String? message, MessageType? type)? loaded,
  }) {
    return error?.call(message, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(String? message, MessageType? type)? error,
    TResult Function(String? message, MessageType? type)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LOADING value) loading,
    required TResult Function(EMPTY value) empty,
    required TResult Function(ERROR value) error,
    required TResult Function(LOADED value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LOADING value)? loading,
    TResult? Function(EMPTY value)? empty,
    TResult? Function(ERROR value)? error,
    TResult? Function(LOADED value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LOADING value)? loading,
    TResult Function(EMPTY value)? empty,
    TResult Function(ERROR value)? error,
    TResult Function(LOADED value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ERROR implements LoadingState {
  const factory ERROR({final String? message, final MessageType? type}) =
      _$ERRORImpl;

  String? get message;
  MessageType? get type;
  @JsonKey(ignore: true)
  _$$ERRORImplCopyWith<_$ERRORImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LOADEDImplCopyWith<$Res> {
  factory _$$LOADEDImplCopyWith(
          _$LOADEDImpl value, $Res Function(_$LOADEDImpl) then) =
      __$$LOADEDImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message, MessageType? type});
}

/// @nodoc
class __$$LOADEDImplCopyWithImpl<$Res>
    extends _$LoadingStateCopyWithImpl<$Res, _$LOADEDImpl>
    implements _$$LOADEDImplCopyWith<$Res> {
  __$$LOADEDImplCopyWithImpl(
      _$LOADEDImpl _value, $Res Function(_$LOADEDImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? type = freezed,
  }) {
    return _then(_$LOADEDImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageType?,
    ));
  }
}

/// @nodoc

class _$LOADEDImpl implements LOADED {
  const _$LOADEDImpl({this.message, this.type});

  @override
  final String? message;
  @override
  final MessageType? type;

  @override
  String toString() {
    return 'LoadingState.loaded(message: $message, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LOADEDImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LOADEDImplCopyWith<_$LOADEDImpl> get copyWith =>
      __$$LOADEDImplCopyWithImpl<_$LOADEDImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(String? message, MessageType? type) error,
    required TResult Function(String? message, MessageType? type) loaded,
  }) {
    return loaded(message, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(String? message, MessageType? type)? error,
    TResult? Function(String? message, MessageType? type)? loaded,
  }) {
    return loaded?.call(message, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(String? message, MessageType? type)? error,
    TResult Function(String? message, MessageType? type)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(message, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LOADING value) loading,
    required TResult Function(EMPTY value) empty,
    required TResult Function(ERROR value) error,
    required TResult Function(LOADED value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LOADING value)? loading,
    TResult? Function(EMPTY value)? empty,
    TResult? Function(ERROR value)? error,
    TResult? Function(LOADED value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LOADING value)? loading,
    TResult Function(EMPTY value)? empty,
    TResult Function(ERROR value)? error,
    TResult Function(LOADED value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LOADED implements LoadingState {
  const factory LOADED({final String? message, final MessageType? type}) =
      _$LOADEDImpl;

  String? get message;
  MessageType? get type;
  @JsonKey(ignore: true)
  _$$LOADEDImplCopyWith<_$LOADEDImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
