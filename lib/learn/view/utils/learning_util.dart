import 'package:nba_flutter_app/learn/models/learning_course.dart';

class LearningUtils {

  static bool _isExpiringSoon(DateTime endDate) {
    final now = DateTime.now();
    final difference = endDate.difference(now).inDays;
    return difference == 7;
  }

  static List<LearningCourse> getExpiringSoonCourses(List<LearningCourse> courses) {
      return courses.where((course) {
        if(course.courseActualEndDate == null) {
          return false;
        }
      return _isExpiringSoon(DateTime.parse(course.courseActualEndDate!));
    }).toList();
  }

  static List<LearningCourse> getCompletedCourses(List<LearningCourse> courses) {
    return courses.where((course) => course.isCourseCompleted).toList();
  }

  static List<LearningCourse> getInProgressCourses(List<LearningCourse> courses) {
    return courses.where((course) => course.isCompleted == CourseCompletionStatus.no &&
      !_isExpiringSoon(DateTime.parse(course.courseActualEndDate ?? DateTime.now().toString()))
    ).toList();
  }

  static List<LearningCourse> getYetToStartCourse(List<LearningCourse> courses) {
    return courses.where((course) => course.userStartDate == null).toList();
  }

}