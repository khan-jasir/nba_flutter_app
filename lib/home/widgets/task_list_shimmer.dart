import 'package:flutter/material.dart';
import 'package:nba_flutter_app/home/widgets/task_tile.dart';

class TaskListShimmer extends StatelessWidget {
  const TaskListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: false,
      padding: EdgeInsets.symmetric(vertical: 5),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: TaskTileShimmer()
        );
      },
    );
  }
}
