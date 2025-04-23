import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:nba_flutter_app/home/data/models/task_item.dart';
import 'package:nba_flutter_app/home/data/models/task_response.dart';
import 'package:nba_flutter_app/home/data/models/task_details.dart';
import 'package:nba_flutter_app/home/data/utils/task_sorter.dart';
import 'package:nba_flutter_app/home/data/repository/home_repository_impl.dart';
import 'package:nba_flutter_app/home/domain/home_repository.dart';
import 'package:nba_flutter_app/home/view/cubit/dummy_data.dart';
import 'package:nba_flutter_app/home/view/cubit/home_state.dart';
import 'package:nba_flutter_app/utils/api_status.dart';


class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  final HomeRespository _homeRespository = HomeRepositoryImpl();
  final TaskSorter _taskSorter = TaskSorter();

  void getTask({
    DateTime? selectedDate
  }) async {
    try {
      emit(state.copyWith(apiStatus: ApiStatus.loading));
      final today = DateTime.now();
      final formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate ?? today);
      final taskResponse = await _homeRespository.getAllAgentsTask(formattedDate);
      if(taskResponse.data.items == null) {
        emit(
          state.copyWith(
            taskList: [],
            pendingTaskList: [] ,
            apiStatus: ApiStatus.empty,
          ),
        );
        return;
      }
      emit(state.copyWith(
        taskList: taskResponse.data.items,
        pendingTaskList: taskResponse.data.items?.where((data) => data.finalStatus == 'PENDING').toList(),
        apiStatus: ApiStatus.success,
      ));
    } catch(e) {
      emit(
        state.copyWith(
          taskList: [],
          pendingTaskList: [],
          apiStatus: ApiStatus.failure
        )
      );
      print('Error: $e');
    }
  }

  void getTaskDetails({
    required String sourceId,
    required String type,
  }) async {
    try {
      emit(state.copyWith(taskDetailsApiStatus: ApiStatus.loading));
      final taskDetails = await _homeRespository.getTaskDetails(
        sourceId: sourceId,
        type: type,
      );
      
      if (!taskDetails.success) {
        emit(
          state.copyWith(
            taskDetailsApiStatus: ApiStatus.failure,
          ),
        );
        return;
      }

      emit(state.copyWith(
        taskDetails: taskDetails,
        taskDetailsApiStatus: ApiStatus.success,
      ));
    } catch(e) {
      emit(
        state.copyWith(
          taskDetailsApiStatus: ApiStatus.failure
        )
      );
      print('Error: $e');
    }
  }

  void getCourseDetails({
    required String sourceId,
    required String type,
  }) async {
    try {
      emit(state.copyWith(courseDetailsApiStatus: ApiStatus.loading));
      final courseDetails = await _homeRespository.getLearningDetails(sourceId: sourceId, type: type);

      emit(state.copyWith(
        courseDetails: courseDetails.data?.courses?.first,
        courseDetailsApiStatus: ApiStatus.success,
      ));
    } catch(e) {
      emit(state.copyWith(courseDetailsApiStatus: ApiStatus.failure));
    } 
  }
}
