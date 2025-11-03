import '../../domain/entities/task_entity.dart';
import '../models/task_model.dart';

extension TaskListModelMapper on TaskListModel {
  TaskListEntity toEntity() => TaskListEntity(
    success: success,
    message: message,
    tasks: data.map((TaskModel e) => e.toEntity()).toList(),
  );
}

extension TaskModelMapper on TaskModel {
  TaskEntity toEntity() => TaskEntity(
    id: int.tryParse(taskId) ?? 0,
    title: title,
    status: status,
    createdAt: createdAt,
    assignedTo: assignedTo,
  );
}


extension TaskListEntityMapper on TaskListEntity {
  TaskListModel toModel() => TaskListModel(
    success: success,
    message: message,
    data: tasks.map((TaskEntity e) => e.toModel()).toList(),
  );
}

extension TaskEntityMapper on TaskEntity {
  TaskModel toModel() => TaskModel(
    taskId: id.toString(),
    title: title,
    status: status,
    createdAt: createdAt,
    assignedTo: assignedTo,
  );
}
