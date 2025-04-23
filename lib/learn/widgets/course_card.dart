import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nba_flutter_app/learn/models/learning_course.dart';
import 'package:nba_flutter_app/learn/view/course_preview.dart';
import 'package:nba_flutter_app/utils/page_transition.dart';
import 'package:shimmer/shimmer.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
    required this.course,
  });

  final LearningCourse course;

 

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xff1A2A30), // Dark background
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Assigned by system",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 11,
                  fontWeight: FontWeight.w400
                ),
              ),
              Text(
                "EXPIRES ${course.courseActualEndDate}",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontWeight: FontWeight.w700,
                  fontSize: 11,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),  
          Text(
            course.courseName ?? '',
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontWeight: FontWeight.w400,
              fontSize: 11,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            course.courseName ?? '',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          Divider(height: 1, color: Colors.white.withOpacity(0.6),),
          const SizedBox(height: 12),
           Center(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => pushWithTransition(context, CoursePreview(course: course,) ),
                  child: Text(
                    "RESUME LEARNING",
                    style: TextStyle(
                      color: Color(0xff33BADD),
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Started yesterday",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CourseCardShimmer extends StatelessWidget {
  const CourseCardShimmer({super.key});

  Widget shimmerBox({double width = double.infinity, double height = 14, BorderRadius? borderRadius}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade700,
      highlightColor: Colors.grey.shade500,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: borderRadius ?? BorderRadius.circular(4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xff1A2A30),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              shimmerBox(width: 100, height: 10),
              shimmerBox(width: 80, height: 10),
            ],
          ),
          const SizedBox(height: 12),

          // Description
          shimmerBox(width: double.infinity, height: 10),
          const SizedBox(height: 5),

          // Title
          shimmerBox(width: double.infinity, height: 18),
          const SizedBox(height: 6),
          shimmerBox(width: 200, height: 18),

          const SizedBox(height: 12),
          Divider(height: 1, color: Colors.white.withOpacity(0.6)),
          const SizedBox(height: 12),

          // Bottom section
          Center(
            child: Column(
              children: [
                shimmerBox(width: 140, height: 16),
                const SizedBox(height: 4),
                shimmerBox(width: 100, height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
