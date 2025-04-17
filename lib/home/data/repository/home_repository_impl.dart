import 'package:dio/dio.dart';
import 'package:nba_flutter_app/core/local_storage.dart';
import 'package:nba_flutter_app/home/data/models/task_details.dart';
import 'package:nba_flutter_app/home/data/models/task_response.dart';
import 'package:nba_flutter_app/home/domain/home_repository.dart';

class HomeRepositoryImpl implements HomeRespository {

  final Dio _client = Dio();
  final localhost = 'localhost';
  final lan = '35.200.166.244:8080';

  @override
  Future<TaskResponse> getAllAgentsTask(String date) async {
    try {
      final agentId = await LocalStorage.getAgentPhone();
      final response = await _client.get(
        'http://$lan/nba/api/v1/task/$agentId?date=$date'
      );

      if (response.statusCode == 200) {
        return TaskResponseMapper.fromMap(response.data);
      } else {
        throw Exception('Failed to load tasks');
      }
    } catch (e) {
      throw Exception('Failed to load tasks: $e');
    }
  }

  @override
  Future<TaskDetails> getTaskDetails({required String sourceId, required String type}) async {
     try {
      final agentId = await LocalStorage.getAgentPhone();
      final response = await _client.get(
        'http://$lan/nba/api/v1/task/$agentId/source/$sourceId?type=$type'
      );

      if (response.statusCode == 200) {
        return TaskDetailsMapper.fromMap(response.data);
      } else {
        throw Exception('Failed to load tasks');
      }
    } catch (e) {
      throw Exception('Failed to load tasks: $e');
    }
  }
}