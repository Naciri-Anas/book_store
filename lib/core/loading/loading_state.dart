import 'package:book_store/core/errors/message_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'loading_state.freezed.dart';

@freezed
class LoadingState with _$LoadingState {
  const factory LoadingState.loading() = LOADING;

  const factory LoadingState.empty() = EMPTY;

  const factory LoadingState.error({String? message, MessageType? type}) = ERROR;

  const factory LoadingState.loaded({String? message, MessageType? type}) = LOADED;
}
