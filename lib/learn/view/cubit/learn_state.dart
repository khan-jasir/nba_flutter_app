part of 'learn_cubit.dart';

class LearnState extends Equatable {
  const LearnState({
    this.learningDataSummary,
    this.expiringSoonCourses = const [],
    this.completedCourses = const [],
    this.onGoingCourses = const [],
    this.yetToStartCourses = const [],
    this.courseApiStatus = ApiStatus.initial,
  });

  final LearningDataSummary? learningDataSummary;
  final List<LearningCourse> expiringSoonCourses;
  final List<LearningCourse> completedCourses;
  final List<LearningCourse> onGoingCourses;
  final List<LearningCourse> yetToStartCourses;
  final ApiStatus courseApiStatus;


  LearnState copyWith({
    LearningDataSummary? learningDataSummary,
    List<LearningCourse>? expiringSoonCourses,
    List<LearningCourse>? completedCourses,
    List<LearningCourse>? onGoingCourses,
    List<LearningCourse>? yetToStartCourses,
    ApiStatus? courseApiStatus,
  }) {
    return LearnState(
      learningDataSummary: learningDataSummary ?? this.learningDataSummary,
      expiringSoonCourses: expiringSoonCourses ?? this.expiringSoonCourses,
      completedCourses: completedCourses ?? this.completedCourses,
      onGoingCourses: onGoingCourses ?? this.onGoingCourses,
      yetToStartCourses: yetToStartCourses ?? this.yetToStartCourses,
      courseApiStatus: courseApiStatus ?? this.courseApiStatus,
    );
  }

  @override
  List<Object?> get props => [
        learningDataSummary,
        expiringSoonCourses,
        completedCourses,
        onGoingCourses,
        yetToStartCourses,
        courseApiStatus,
  ];
}
