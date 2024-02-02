import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:examenformativo/providers/taskProvide.dart';
import 'package:examenformativo/modelo/task.dart';

class AddEditTaskScreen extends StatelessWidget {
  final Task? task;

  AddEditTaskScreen({this.task});

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController =
        TextEditingController(text: task?.title ?? '');
    final TextEditingController descriptionController =
        TextEditingController(text: task?.description ?? '');

    return Scaffold(
      appBar: AppBar(
        title: Text(task == null ? 'Agregar Tarea' : 'Editar Tarea'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Descripción'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final newTask = Task(
                  title: titleController.text,
                  description: descriptionController.text,
                  isCompleted: task?.isCompleted ?? false,
                );

                if (task == null) {
                  Provider.of<TaskProvider>(context, listen: false)
                      .addTask(newTask);
                } else {
                  Provider.of<TaskProvider>(context, listen: false).updateTask(
                    Provider.of<TaskProvider>(context, listen: false)
                        .tasks
                        .indexOf(task!),
                    newTask,
                  );
                }

                Navigator.pop(context);
              },
              child: Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        title: 'Lista de Tareas',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TaskListScreen(),
      ),
    );
  }
}
