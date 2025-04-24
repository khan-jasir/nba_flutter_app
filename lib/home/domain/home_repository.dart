import 'package:nba_flutter_app/home/data/models/task_details.dart';
import 'package:nba_flutter_app/home/data/models/task_response.dart';
import 'package:nba_flutter_app/learn/models/learning_course.dart';

abstract class HomeRespository {
  Future<TaskResponse> getAllAgentsTask(String date);
  Future<TaskDetails> getTaskDetails({
    required String sourceId,
    required String type,
  });

  Future<LearningCourse> getLearningDetails({
    required String sourceId,
    required String type,
  });
}