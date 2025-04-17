import 'package:flutter/material.dart';
import 'package:nba_flutter_app/learn/models/learning_course.dart';
import 'package:nba_flutter_app/learn/widgets/course_card.dart';
import 'package:nba_flutter_app/learn/widgets/course_status_header.dart';

class YetToStartCourse extends StatelessWidget {
  const YetToStartCourse({
    super.key,
    required this.yetToStartCourses,
    this.isLoading = false,
  });

  final List<LearningCourse> yetToStartCourses;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    // Only show section if loading or if we have data
    if (!isLoading && yetToStartCourses.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CourseSectionHeader(sectionType: SectionType.yetToStart),
        const SizedBox(height: 15),
        if (isLoading)
          Column(
            children: List.generate(2, (index) {
              return const Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: CourseCardShimmer(),
              );
            }),
          )
        else
          Column(
            children: List.generate(yetToStartCourses.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: CourseCard(
                  course: yetToStartCourses[index],
                ),
              );
            }),
          ),
      ],
    );
  }
}
