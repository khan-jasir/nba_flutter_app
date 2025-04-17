import 'package:flutter/material.dart';
import 'package:nba_flutter_app/learn/models/learning_course.dart';
import 'package:nba_flutter_app/learn/widgets/course_card.dart';
import 'package:nba_flutter_app/learn/widgets/course_status_header.dart';

class ExpiresSoonCourse extends StatelessWidget {
  const ExpiresSoonCourse({
    super.key,
    required this.expiresSoonCourses,
    this.isLoading = false,
  });

  final List<LearningCourse> expiresSoonCourses;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    // If not loading and list is empty, return nothing
    if (!isLoading && expiresSoonCourses.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CourseSectionHeader(sectionType: SectionType.expiresSoon),
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
            children: List.generate(expiresSoonCourses.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: CourseCard(
                  course: expiresSoonCourses[index],
                ),
              );
            }),
          ),
      ],
    );
  }
}
