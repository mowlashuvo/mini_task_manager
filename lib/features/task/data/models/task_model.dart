import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
class TaskListModel with _$TaskListModel {
  const factory TaskListModel({
    @Default([]) List<TaskModel> data,
    String? message,
    bool? success,
  }) = _TaskListModel;

  factory TaskListModel.fromJson(Map<String, dynamic> json) =>
      _$TaskListModelFromJson(json);
}

@freezed
class TaskModel with _$TaskModel {
  const factory TaskModel({
    @JsonKey(name: 'task_id') required String taskId,
    required String title,
    required String status,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'assigned_to') String? assignedTo,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
}