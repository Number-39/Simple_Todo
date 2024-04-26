// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:maidstodo/components/showmessage.dart';
import 'package:maidstodo/services/delete_task_service.dart';

void navigatetoDelete(
  BuildContext context,
  String id,
) async {
  final DeleteTaskService taskService = DeleteTaskService();
  await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Are you sure you want to delete the task?'),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        String message = await taskService.deleteTask(id);
                        Navigator.pop(context);
                        showMessage(context, message);
                      },
                      child: const Text('Yes')),
                  ElevatedButton(
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      child: const Text('No')),
                ],
              ),
            ],
          ),
        );
      });
}
