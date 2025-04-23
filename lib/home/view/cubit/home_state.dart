import 'package:equatable/equatable.dart';
import 'package:nba_flutter_app/home/data/models/task_details.dart';
import 'package:nba_flutter_app/home/data/models/task_item.dart';
import 'package:nba_flutter_app/learn/models/learning_course.dart';
import 'package:nba_flutter_app/utils/api_status.dart';



class HomeState extends Equatable {

  final List<TaskItem> taskList;
  final List<TaskItem> pendingTaskList;
  final ApiStatus apiStatus;
  final ApiStatus taskDetailsApiStatus;
  final ApiStatus courseDetailsApiStatus;
  final TaskDetails? taskDetails;
  final LearningCourse? courseDetails;

  const HomeState({
    this.taskList = const [],
    this.pendingTaskList = const [],
    this.apiStatus = ApiStatus.initial,
    this.taskDetailsApiStatus = ApiStatus.initial,
    this.courseDetailsApiStatus = ApiStatus.initial,
    this.taskDetails,
    this.courseDetails,
  });


  HomeState copyWith({
    List<TaskItem>? taskList,
    List<TaskItem>? pendingTaskList,
    ApiStatus? apiStatus,
    ApiStatus? taskDetailsApiStatus,
    ApiStatus? courseDetailsApiStatus,
    TaskDetails? taskDetails,
    LearningCourse? courseDetails,
  }) {
    return HomeState(
      taskList: taskList ?? this.taskList,
      pendingTaskList: pendingTaskList ?? this.pendingTaskList,
      apiStatus: apiStatus ?? this.apiStatus,
      taskDetails: taskDetails ?? this.taskDetails,
      courseDetailsApiStatus: courseDetailsApiStatus ?? this.courseDetailsApiStatus,
      taskDetailsApiStatus: taskDetailsApiStatus ?? this.apiStatus,
      courseDetails: courseDetails ?? this.courseDetails,
    );
  }

  @override
  List<Object?> get props => [
    taskList,
    pendingTaskList,
    taskDetailsApiStatus,
    courseDetailsApiStatus,
    apiStatus,
    taskDetails,
    courseDetails,
  ];

}