import 'package:freezed_annotation/freezed_annotation.dart';

part 'smart_item_failure.freezed.dart';

@freezed
class SmartItemFailure with _$SmartItemFailure {
  factory SmartItemFailure.unexpected() = Unexpected;
  factory SmartItemFailure.serverError() = ServerError;
}
