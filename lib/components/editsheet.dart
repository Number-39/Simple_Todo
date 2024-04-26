// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:maidstodo/components/showmessage.dart';
import 'package:maidstodo/services/edit_task_service.dart';

void navigatetoEdit(
  BuildContext context,
  String id,
) async {
  final EditTaskService taskService = EditTaskService();
  await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Mark task as completed?'),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        String message = await taskService.editTask('true', id);
                        Navigator.pop(context);
                        showMessage(context, message);
                      },
                      child: const Text('Yes')),
                  ElevatedButton(
                      onPressed: () async {
                        String message =
                            await taskService.editTask('false', id);
                        Navigator.pop(context);
                        showMessage(context, message);
                      },
                      child: const Text('No')),
                ],
              ),
            ],
          ),
        );
      });
}
