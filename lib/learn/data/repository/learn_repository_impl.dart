import 'package:dio/dio.dart';
import 'package:nba_flutter_app/core/local_storage.dart';
import 'package:nba_flutter_app/learn/domain/learn_repository.dart';
import 'package:nba_flutter_app/learn/models/learning_response.dart';

class LearnRepositoryImpl implements LearningRepository {

  final Dio _client = Dio();
  final String lan = '35.200.166.244:8080';

  @override
  Future<LearningResponse> getAllCourses() async {
    try {
      final agentId = await LocalStorage.getAgentPhone();
      final response = await _client.get(
        'http://$lan/nba/api/v1/agent/SOS-000084/courses'
      );

      if (response.statusCode == 200) {
        return LearningResponseMapper.fromMap(response.data);
      } else {
        throw Exception('Failed to load tasks');
      }
    } catch (e) {
      throw Exception('Failed to load tasks: $e');
    }
  }

}