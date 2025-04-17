import 'package:equatable/equatable.dart';
import 'package:nba_flutter_app/home/data/models/task_details.dart';
import 'package:nba_flutter_app/home/data/models/task_item.dart';
import 'package:nba_flutter_app/utils/api_status.dart';



class HomeState extends Equatable {

  final List<TaskItem> taskList;
  final List<TaskItem> pendingTaskList;
  final ApiStatus apiStatus;
  final ApiStatus taskDetailsApiStatus;
  final TaskDetails? taskDetails;

  const HomeState({
    this.taskList = const [],
    this.pendingTaskList = const [],
    this.apiStatus = ApiStatus.initial,
    this.taskDetailsApiStatus = ApiStatus.initial,
    this.taskDetails,
  });


  HomeState copyWith({
    List<TaskItem>? taskList,
    List<TaskItem>? pendingTaskList,
    ApiStatus? apiStatus,
    ApiStatus? taskDetailsApiStatus,
    TaskDetails? taskDetails,
  }) {
    return HomeState(
      taskList: taskList ?? this.taskList,
      pendingTaskList: pendingTaskList ?? this.pendingTaskList,
      apiStatus: apiStatus ?? this.apiStatus,
      taskDetails: taskDetails ?? this.taskDetails,
      taskDetailsApiStatus: taskDetailsApiStatus ?? this.apiStatus
    );
  }

  @override
  List<Object?> get props => [
    taskList,
    pendingTaskList,
    taskDetailsApiStatus,
    apiStatus,
    taskDetails,
  ];

}