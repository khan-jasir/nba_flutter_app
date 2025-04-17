import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:nba_flutter_app/learn/models/hooks/course_completion_hook.dart';
import 'package:nba_flutter_app/learn/models/hooks/learning_date_hook.dart';
import 'package:nba_flutter_app/learn/models/learning_module.dart';

part 'learning_course.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.lowerCase)
enum CourseCompletionStatus { no, yes }

@MappableClass()
class LearningCourse with LearningCourseMappable {
  @MappableField(key: 'course_id')
  final String courseId;
  @MappableField(key: 'course_name')
  final String courseName;
  @MappableField(key: 'is_completed', hook: CourseCompletionHook())
  final CourseCompletionStatus isCompleted;
  @MappableField(key: 'course_actual_start_date',)
  final String? courseActualStartDate;
  @MappableField(key: 'course_actual_end_date',)
  final String? courseActualEndDate;
  @MappableField(key: 'course_actual_due_date',)
  final String? courseActualDueDate;
  @MappableField(key: 'user_start_date',)
  final String? userStartDate;
  @MappableField(key: 'user_total_duration')
  final String? userTotalDuration;
  @MappableField(key: 'modules')
  final List<LearningModule> modules;

  LearningCourse({
    required this.courseId,
    required this.courseName,
    required this.isCompleted,
    required this.courseActualStartDate,
    required this.courseActualEndDate,
    required this.courseActualDueDate,
    this.userStartDate,
    this.userTotalDuration,
    required this.modules,
  });
}
