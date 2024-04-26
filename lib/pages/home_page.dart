// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:maidstodo/components/addsheet.dart';
import 'package:maidstodo/components/deletesheet.dart';
import 'package:maidstodo/components/drawer_info.dart';
import 'package:maidstodo/components/editsheet.dart';
import 'package:maidstodo/models/user_model.dart';
import 'package:maidstodo/services/get_tasks_service.dart';

class HomePage extends StatefulWidget {
  final UserModel user;
  const HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UserModel userInfo;
  List tasks = [];
  TextEditingController idContoller = TextEditingController();

  @override
  void initState() {
    super.initState();
    userInfo = widget.user;
    getAllTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: const Text('Maids.cc Tasks App'),
        centerTitle: true,
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                  onPressed: () => {Scaffold.of(context).openEndDrawer()},
                  icon: const Icon(Icons.person));
            },
          )
        ],
      ),
      endDrawer: Drawer(
        child: DrawerInfo(userInfo: userInfo),
      ),
      body: RefreshIndicator(
        onRefresh: getAllTasks,
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index] as Map;
            return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue[200],
                  child: Text('${index + 1}'),
                ),
                title: Text(task['todo']),
                trailing: PopupMenuButton(onSelected: (value) {
                  if (value == 'mark') {
                    navigatetoEdit(context, '${index + 1}');
                  } else if (value == 'delete') {
                    navigatetoDelete(context, '${index + 1}');
                  }
                }, itemBuilder: (context) {
                  return [
                    const PopupMenuItem(
                      value: 'mark',
                      child: Text('Mark as completed'),
                    ),
                    const PopupMenuItem(value: 'delete', child: Text('Delete')),
                  ];
                }));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.blue[200],
          onPressed: () {
            navigatetoAdd(context);
          },
          label: const Text('Add New Task')),
    );
  }

  Future<void> getAllTasks() async {
    tasks = await GetAllTasks().getAllTasks();
    setState(() {});
  }
}
