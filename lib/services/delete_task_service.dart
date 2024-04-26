import 'package:maidstodo/helpers/api.dart';

class DeleteTaskService {
  Future<String> deleteTask(
    String id,
  ) async {
    // ignore: missing_required_param
    int status = await Api().delete(
      url: 'https://dummyjson.com/todos/$id',
      headers: {'Content-Type': 'application/json'},
    );
    if (status == 200) {
      return 'Task deleted successfully';
    } else {
      return 'Error in deleting the task, please try again';
    }
  }
}
