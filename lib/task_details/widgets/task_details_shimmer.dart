import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TaskDetailsShimmer extends StatelessWidget {
  const TaskDetailsShimmer({super.key});

  Widget shimmerBox({double width = double.infinity, double height = 14, BorderRadius? borderRadius}) {
    return Shimmer.fromColors(
      baseColor: const Color(0xff1A2A30),
      highlightColor: const Color(0xff2E3F46),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey[700],
          borderRadius: borderRadius ?? BorderRadius.circular(4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          // Header shimmer
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              color: const Color(0xff003A4A),
              borderRadius: BorderRadius.circular(131),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                shimmerBox(width: 100, height: 16),
                shimmerBox(width: 100, height: 16),
              ],
            ),
          ),
          const SizedBox(height: 15),
          // Body shimmer
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const Color(0xff1A2A30),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                shimmerBox(width: double.infinity, height: 24),
                const SizedBox(height: 5),
                shimmerBox(width: double.infinity, height: 16),
                const SizedBox(height: 15),
                shimmerBox(width: double.infinity, height: 1),
                const SizedBox(height: 15),
                shimmerBox(width: 200, height: 16),
                const SizedBox(height: 8),
                shimmerBox(width: 150, height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 