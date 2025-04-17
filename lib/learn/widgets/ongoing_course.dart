import 'package:flutter/material.dart';
import 'package:nba_flutter_app/learn/models/learning_course.dart';
import 'package:nba_flutter_app/learn/widgets/course_card.dart';
import 'package:nba_flutter_app/learn/widgets/course_status_header.dart';

class OngoingCourse extends StatelessWidget {
  const OngoingCourse({
    super.key,
    required this.ongoingCourses,
    this.isLoading = false,
  });

  final List<LearningCourse> ongoingCourses;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    // Only render if loading or data is available
    if (!isLoading && ongoingCourses.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CourseSectionHeader(sectionType: SectionType.ongoing),
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
            children: List.generate(ongoingCourses.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: CourseCard(
                  course: ongoingCourses[index],
                ),
              );
            }),
          ),
      ],
    );
  }
}
