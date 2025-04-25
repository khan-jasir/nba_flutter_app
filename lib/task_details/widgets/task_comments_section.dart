import 'package:flutter/material.dart';
import 'package:nba_flutter_app/task_details/widgets/task_comment_item.dart';

class TaskCommentsSection extends StatelessWidget {
  const TaskCommentsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '2 Comments',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          TaskCommentItem(
            comment: 'Called Arjun, seemed hesitant to make payment by this week.',
            timestamp: 'Today, 2:54 PM',
            showDeleteButton: true,
          ),
          TaskCommentItem(
            comment: 'Called, Arjun didn\'t pick up',
            timestamp: 'Yesterday, 2:01 PM',
            showDeleteButton: true,
          ),
        ],
      ),
    );
  }
} 