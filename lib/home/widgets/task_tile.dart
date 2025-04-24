import 'package:flutter/material.dart';
import 'package:nba_flutter_app/home/widgets/task_priority.dart';
import 'package:shimmer/shimmer.dart';

import '../data/models/task_item.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key, 
    required this.title, 
    required this.description,
    required this.priorityLevel,
    required this.lob,
    this.isBirthdayTask = false,
    this.isLearningTask = false,
    required this.clientName,
  });

  final String title;
  final String description;
  final PriorityLevel priorityLevel;
  final String lob;
  final bool isBirthdayTask;
  final String clientName;
  final bool isLearningTask;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xff1A2A30),
        border: Border.all(width: 1, color: Color(0xff1A2A30)),
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          TaskPriority(
            priorityLevel: priorityLevel,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                if(isBirthdayTask) ...[
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
                if(isLearningTask) ...[
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
                if(!isBirthdayTask && !isLearningTask) ...[
                  Text(
                    '${lob.toUpperCase()} | $clientName',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TaskTileShimmer extends StatelessWidget {
  const TaskTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final baseColor = const Color(0xff1A2A30);
    final highlightColor = const Color(0xff2E3F46);

    Widget shimmerBox({double height = 12, double? width}) {
      return Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Colors.grey[700],
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: baseColor,
        border: Border.all(width: 1, color: baseColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TaskPriority shimmer
          Shimmer.fromColors(
            baseColor: baseColor,
            highlightColor: highlightColor,
            child: Container(
              width: 5,
              height: 52,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                shimmerBox(height: 16, width: double.infinity), // title
                const SizedBox(height: 6),
                shimmerBox(), // description line 1
                const SizedBox(height: 4),
                shimmerBox(), // description line 2
                const SizedBox(height: 4),
                shimmerBox(width: MediaQuery.of(context).size.width * 0.6), // description line 3
              ],
            ),
          ),
        ],
      ),
    );
  }
}
