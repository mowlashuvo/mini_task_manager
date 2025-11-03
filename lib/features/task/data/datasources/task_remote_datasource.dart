import '../../../../core/http_client/client.dart';
import '../../../../core/http_client/exception.dart';
import '../models/task_model.dart';

abstract class TaskRemoteDataSource {
  Future<TaskListModel> getTasks({
    required String userId,
    required String createdBy,
  });

  Future<TaskListModel> addTask({required TaskModel request});
}

class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  final BaseApiClient client;

  TaskRemoteDataSourceImpl({required this.client});

  @override
  Future<TaskListModel> getTasks({
    required String userId,
    required String createdBy,
  }) async {
    try {
      final response = await client.get(
        endPoint: 'gettask.php/$createdBy/$userId/tasklist',
      );
      final data = response;
      if (data['status'] == true) {
        return TaskListModel.fromJson(data);
      } else {
        throw Exception(data['message'] ?? 'Failed to add task');
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<TaskListModel> addTask({required TaskModel request}) async {
    try {
      final response = await client.post(
        endPoint: 'addtask.php',
        data: {
          'user_id': '10',
          'title': request.title,
          'created_by': request.assignedTo ?? 'unknown',
          'status': request.status,
        }
      );
      final data = response;
      if (data['status'] == true) {
        return TaskListModel.fromJson(data);
      } else {
        throw Exception(data['message'] ?? 'Failed to add task');
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
