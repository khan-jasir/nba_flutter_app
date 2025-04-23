import 'package:nba_flutter_app/learn/models/learning_response.dart';

abstract class LearningRepository {
 
  Future<LearningResponse> getAllCourses();
}
