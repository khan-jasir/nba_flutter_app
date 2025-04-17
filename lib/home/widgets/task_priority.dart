import 'package:flutter/material.dart';
import 'package:nba_flutter_app/home/data/models/task_item.dart';
import 'package:shimmer/shimmer.dart';

class TaskPriority extends StatelessWidget {
  const TaskPriority({
    super.key,
    required this.priorityLevel,
    this.isLoading = false,
  });

  final bool isLoading;
  final PriorityLevel priorityLevel;

  Color get _color {
    switch(priorityLevel) {
      case PriorityLevel.high:
        return const Color(0xffE7615B);
      case PriorityLevel.medium:
        return const Color(0xffD7824F);
      case PriorityLevel.low:
        return const Color(0xffC3B730);
    }
  }

  @override
  Widget build(BuildContext context) {
    final priorityBar = Container(
      decoration: BoxDecoration(
        color: _color,
        borderRadius: BorderRadius.circular(16),
      ),
      width: 5,
      height: 52,
    );

    if (!isLoading) return priorityBar;

    return Shimmer.fromColors(
      baseColor: const Color(0xff1A2A30),
      highlightColor:const Color(0xff2E3F46),
      child: priorityBar,
    );
  }
}
