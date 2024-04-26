import 'package:maidstodo/helpers/api.dart';

class EditTaskService {
  Future<String> editTask(
    String completed,
    String id,
  ) async {
    final body = {
      'completed': completed,
    };
    // ignore: missing_required_param
    int status = await Api().put(
      url: 'https://dummyjson.com/todos/$id',
      body: body,
    );
    if (status == 200 && completed == 'true') {
      return 'Task is completed';
    } else {
      return 'Task is not completed yet';
    }
  }
}
