import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/task_entity.dart';
import '../bloc/task/task_bloc.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  static const route = '/tasks';

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final _titleController = TextEditingController();
  final _statusOptions = ['Pending', 'Approved', 'Rejected', 'Done'];
  String _selectedStatus = 'Pending';

  @override
  void initState() {
    super.initState();
    context.read<TaskBloc>().add(const TaskEvent.load());
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'Approved':
        return Colors.amber;
      case 'Rejected':
        return Colors.grey;
      case 'Done':
        return Colors.green;
      default:
        return Colors.red;
    }
  }

  void _showAddTaskDialog() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Add New Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  hintText: 'Enter task title',
                ),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: _selectedStatus,
                items: _statusOptions
                    .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                    .toList(),
                onChanged: (value) => setState(() {
                  _selectedStatus = value!;
                }),
                decoration: const InputDecoration(labelText: 'Status'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final title = _titleController.text.trim();
                if (title.isNotEmpty) {
                  context.read<TaskBloc>().add(TaskEvent.add(
                    TaskEntity(
                      id: 0, // backend will assign
                      title: title,
                      status: _selectedStatus,
                    ),
                  ));
                  Navigator.pop(context);
                  _titleController.clear();
                  _selectedStatus = 'Pending';
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mini Task Manager 📝')),
      body: BlocConsumer<TaskBloc, TaskState>(
        listener: (context, state) {
          if (state.message != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message!)),
            );
          }
        },
        builder: (context, state) {
          if (state.status==TaskStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.tasks.isEmpty) {
            return const Center(child: Text('No tasks found.'));
          }

          return RefreshIndicator(
            onRefresh: () async {
              context.read<TaskBloc>().add(const TaskEvent.load());
            },
            child: ListView.builder(
              itemCount: state.tasks.length,
              itemBuilder: (context, index) {
                final task = state.tasks[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: _statusColor(task.status),
                    radius: 8,
                  ),
                  title: Text(
                    task.title,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(task.status),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () {
                      // Navigate to Edit screen (you’ll implement it next)
                      Navigator.pushNamed(
                        context,
                        '/edit-task',
                        arguments: task,
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
