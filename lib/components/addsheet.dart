// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:maidstodo/components/showmessage.dart';
import 'package:maidstodo/components/textfield.dart';
import 'package:maidstodo/services/add_task_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void navigatetoAdd(
  BuildContext context,
) async {
  TextEditingController taskContoller = TextEditingController();
  final AddTaskService taskService = AddTaskService();
  await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('What is your new task?'),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextField(
                  controller: taskContoller,
                  labelText: 'Enter Task',
                  obscureText: false),
            ),
            ElevatedButton(
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  int id = prefs.getInt('id')!;
                  String message = await taskService.addTask(
                      taskContoller.text, id.toString());
                  showMessage(context, message);
                  Navigator.pop(context);
                },
                child: const Text('Add'))
          ],
        );
      });
}
