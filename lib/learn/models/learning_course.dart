import 'package:dart_mappable/dart_mappable.dart';
import 'package:nba_flutter_app/learn/models/learning_module.dart';

part 'learning_course.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.lowerCase)
enum CourseCompletionStatus { no, yes }

@MappableClass()
class LearningCourse with LearningCourseMappable {
  @MappableField(key: 'courseId')
  final String? courseId;
  @MappableField(key: 'courseName')
  final String? courseName;
  @MappableField(key: 'isCompleted')
  final String? isCompleted;
  @MappableField(key: 'courseActualStartDate')
  final String? courseActualStartDate;
  @MappableField(key: 'courseActualEndDate')
  final String? courseActualEndDate;
  @MappableField(key: 'courseActualDueDate')
  final String? courseActualDueDate;
  @MappableField(key: 'userStartDate')
  final String? userStartDate;
  @MappableField(key: 'userTotalDuration')
  final String? userTotalDuration;
  @MappableField(key: 'modules')
  final List<LearningModule>? modules;

  LearningCourse({
    this.courseId,
    this.courseName,
    this.isCompleted,
    this.courseActualStartDate,
    this.courseActualEndDate,
    this.courseActualDueDate,
    this.userStartDate,
    this.userTotalDuration,
    this.modules,
  });

  bool get isCourseCompleted {
    return isCompleted?.toLowerCase() == 'yes';
  }
} 