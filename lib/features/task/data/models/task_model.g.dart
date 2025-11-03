// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskListModelImpl _$$TaskListModelImplFromJson(Map<String, dynamic> json) =>
    _$TaskListModelImpl(
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => TaskModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      message: json['message'] as String?,
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$$TaskListModelImplToJson(_$TaskListModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'success': instance.success,
    };

_$TaskModelImpl _$$TaskModelImplFromJson(Map<String, dynamic> json) =>
    _$TaskModelImpl(
      taskId: json['task_id'] as String,
      title: json['title'] as String,
      status: json['status'] as String,
      createdAt: json['created_at'] as String?,
      assignedTo: json['assigned_to'] as String?,
    );

Map<String, dynamic> _$$TaskModelImplToJson(_$TaskModelImpl instance) =>
    <String, dynamic>{
      'task_id': instance.taskId,
      'title': instance.title,
      'status': instance.status,
      'created_at': instance.createdAt,
      'assigned_to': instance.assignedTo,
    };
