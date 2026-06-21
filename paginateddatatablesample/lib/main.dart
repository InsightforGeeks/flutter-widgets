import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterforGeeks',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: PaginatedDataTableExample(),
    );
  }
}

class PaginatedDataTableExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlutterforGeeks'),
      ),
      body: SingleChildScrollView(
        child: PaginatedDataTable(
          header: const Text('Tasks'),
          columns: const [
            DataColumn(label: Text('Task')),
            DataColumn(label: Text('Priority')),
            DataColumn(label: Text('Due Date')),
          ],
          source: TaskDataSource(),
          rowsPerPage: 10,
        ),
      ),
    );
  }
}

class Task {
  final String name;
  final String priority;
  final DateTime dueDate;

  Task({required this.name, required this.priority, required this.dueDate});
}

class TaskDataSource extends DataTableSource {
  final List<Task> _tasks = [
    Task(name: 'Todo1', priority: 'High', dueDate: DateTime.now()),
    Task(name: 'Todo2', priority: 'High', dueDate: DateTime.now()),
    Task(name: 'Todo3', priority: 'High', dueDate: DateTime.now()),
    Task(name: 'Todo4', priority: 'High', dueDate: DateTime.now()),
    Task(name: 'Todo5', priority: 'High', dueDate: DateTime.now()),
    Task(name: 'Todo6', priority: 'High', dueDate: DateTime.now()),
    Task(name: 'Todo7', priority: 'High', dueDate: DateTime.now()),
    Task(name: 'Todo8', priority: 'High', dueDate: DateTime.now()),
    Task(name: 'Todo9', priority: 'High', dueDate: DateTime.now()),
    Task(name: 'Todo10', priority: 'High', dueDate: DateTime.now()),
    Task(name: 'Todo11', priority: 'High', dueDate: DateTime.now()),
    Task(name: 'Todo12', priority: 'High', dueDate: DateTime.now()),
    Task(name: 'Todo13', priority: 'High', dueDate: DateTime.now()),
    Task(name: 'Todo14', priority: 'High', dueDate: DateTime.now()),
    Task(name: 'Todo15', priority: 'High', dueDate: DateTime.now()),
    Task(name: 'Todo16', priority: 'High', dueDate: DateTime.now()),
    Task(name: 'Todo17', priority: 'High', dueDate: DateTime.now()),
    Task(name: 'Todo18', priority: 'High', dueDate: DateTime.now()),
    Task(name: 'Todo19', priority: 'High', dueDate: DateTime.now()),
    Task(name: 'Todo20', priority: 'High', dueDate: DateTime.now()),
    Task(name: 'Todo21', priority: 'High', dueDate: DateTime.now()),

    // Add more tasks here...
  ];

  @override
  DataRow? getRow(int index) {
    if (index >= _tasks.length) {
      return null;
    }
    final task = _tasks[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(task.name)),
        DataCell(Text(task.priority)),
        DataCell(Text(task.dueDate.toString())),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _tasks.length;

  @override
  int get selectedRowCount => 0;
}
