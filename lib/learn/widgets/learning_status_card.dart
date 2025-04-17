import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LearningStatusCard extends StatelessWidget {
  const LearningStatusCard({
    super.key,
    required this.expiresSoonCount,
    required this.ongoingCount,
    required this.yetToStartCount,
    this.isLoading = false,
  });

  final int expiresSoonCount;
  final int ongoingCount;
  final int yetToStartCount;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
      decoration: BoxDecoration(
        color: const Color(0xff1A2A30),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xff0E86A6),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _StatusColumn(
            count: expiresSoonCount,
            label: 'Expires Soon',
            isLoading: isLoading,
          ),
          const _VerticalDivider(),
          _StatusColumn(
            count: ongoingCount,
            label: 'Ongoing',
            isLoading: isLoading,
          ),
          const _VerticalDivider(),
          _StatusColumn(
            count: yetToStartCount,
            label: 'Yet To Begin',
            isLoading: isLoading,
          ),
        ],
      ),
    );
  }
}

class _StatusColumn extends StatelessWidget {
  final int count;
  final String label;
  final bool isLoading;

  const _StatusColumn({
    required this.count,
    required this.label,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    final countWidget = Text(
      '$count',
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w800,
        color: Colors.white,
      ),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        isLoading
            ? Shimmer.fromColors(
                baseColor: Colors.white24,
                highlightColor: Colors.white30,
                child: Container(
                  width: 24,
                  height: 24,
                  color: Colors.white,
                ),
              )
            : countWidget,
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.white.withOpacity(0.6),
          ),
        ),
      ],
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  const _VerticalDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 1,
      color: const Color(0xff0E86A6),
      margin: const EdgeInsets.symmetric(horizontal: 12),
    );
  }
}
