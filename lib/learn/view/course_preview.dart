import 'package:flutter/material.dart';
import 'package:nba_flutter_app/learn/models/learning_course.dart';
import 'package:nba_flutter_app/learn/widgets/course_card.dart';
import 'package:nba_flutter_app/learn/widgets/course_material_card.dart';

class CoursePreview extends StatelessWidget {
  const CoursePreview({
    super.key,
    required this.course,
  });

  final LearningCourse course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1D26),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: course.modules.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: CourseMaterialCard(
                      index: index + 1,
                      learningModule: course.modules[index],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}