import 'package:maidstodo/helpers/api.dart';

class AddTaskService {
  Future<String> addTask(String task, String id) async {
    final body = {'todo': task, 'completed': false, 'userId': id};
    // ignore: missing_required_param
    dynamic status = await Api().post(
      url: 'https://dummyjson.com/todos/add',
      body: body,
      headers: {'Content-Type': 'application/json'},
    );
    if (status == 200) {
      return 'Task added successfully';
    } else {
      return 'Error in adding the task, please try again';
    }
  }
}
