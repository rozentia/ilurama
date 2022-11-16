import 'package:freezed_annotation/freezed_annotation.dart';

part 'actions.freezed.dart';

@freezed
class CRUDActions with _$CRUDActions {
  const CRUDActions._();

  const factory CRUDActions.delete() = Delete;
  const factory CRUDActions.update() = Update;
  const factory CRUDActions.save() = Save;
  const factory CRUDActions.read() = Read;
}
