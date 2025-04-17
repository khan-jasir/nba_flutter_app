import 'package:flutter/material.dart';

enum SectionType {
  expiresSoon('Expires Soon'),
  ongoing('Ongoing'),
  yetToStart('Yet To Start');

  const SectionType(this.value);
  final String value;
}

class CourseSectionHeader extends StatelessWidget {
  const CourseSectionHeader({
    super.key,
    required this.sectionType,
  });

  final SectionType sectionType;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.white.withOpacity(0.6),
            thickness: 0.5,
            endIndent: 12,
          ),
        ),
        Text(
          sectionType.value,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.white.withOpacity(0.6),
            thickness: 0.5,
            indent: 12,
          ),
        ),
      ],
    );
  }
}
