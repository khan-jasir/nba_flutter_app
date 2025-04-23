import 'package:flutter/material.dart';
import 'package:nba_flutter_app/notifications/widgets/notification_filter_btn.dart';
import 'package:nba_flutter_app/notifications/widgets/notification_filter_drop_down.dart';


class NotificationFilterScreen extends StatefulWidget {
  const NotificationFilterScreen({super.key});

  @override
  State<NotificationFilterScreen> createState() => _NotificationFilterScreenState();
}

class _NotificationFilterScreenState extends State<NotificationFilterScreen> {
  String selectedType = 'All Types';

  final List<String> notificationTypes = [
    'All Types',
    'New Lead Assignments',
    'Payment Failures',
    'Up-sell / Cross-sell',
    'New Product Training',
    'Webinar Alerts',
    'Belt Level Updates',
  ];

  void resetFilters() {
    setState(() {
      selectedType = 'All Types';
    });
  }

  void applyFilter() {
    // Handle applying filter logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Filter applied: $selectedType')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff09161C),
      appBar: AppBar(
        backgroundColor: const Color(0xff1A2A30),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const Text(
              'Filter - Notifications',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.cancel_outlined, color: Colors.white,),
            )
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: const Text(
              'Notification Type',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.all(16),
            child: NotificationFilterDropdown(
              items: notificationTypes,
              selectedItem: selectedType,
              onChanged: (val) {
                setState(() {
                  selectedType = val!;
                });
              },
            ),
          ),
          const Spacer(),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Color(0xff0F172A),
            ),
            child: Row(
              children: [
                Expanded(
                  child: NotificationFilterBtn(
                    label: 'RESET FILTERS',
                    onPressed: resetFilters,
                    backgroundColor: Colors.grey.shade800,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: NotificationFilterBtn(
                    label: 'APPLY FILTER',
                    onPressed: applyFilter,
                    backgroundColor: const Color(0xff0E86A6),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
