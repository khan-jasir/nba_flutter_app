import 'package:flutter/material.dart';
import 'package:nba_flutter_app/learn/models/learning_module.dart';

class CourseMaterialCard extends StatefulWidget {
  const CourseMaterialCard({
    super.key,
    required this.index,
    required this.learningModule,
  });

  final LearningModule learningModule;
  final int index;

  @override
  State<CourseMaterialCard> createState() => _CourseMaterialCardState();
}

class _CourseMaterialCardState extends State<CourseMaterialCard> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF0B1D26),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header row with module name and expand icon
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Title
              Expanded(
                child: Text(
                  '${widget.index}. ${widget.learningModule.moduleName}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),

              /// Expand/collapse icon
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  icon: Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),

          /// Expandable content
          if (isExpanded)
            Container(
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xff1A2A30),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: widget.learningModule.materials!.map((material) {
                  return Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Material name (with text wrap)
                          Expanded(
                            child: Text(
                              material.materialName ?? '',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ),

                          /// Checkmark
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0, top: 2),
                            child: Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.white12,
                        thickness: 0.5,
                        height: 16,
                      )
                    ],
                  );
                }).toList(),
              ),
            )
        ],
      ),
    );
  }
}
