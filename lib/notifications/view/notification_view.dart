import 'package:flutter/material.dart';
import 'package:nba_flutter_app/notifications/view/notification_filter_screen.dart';
import 'package:nba_flutter_app/notifications/widgets/notification_container.dart';
import 'package:nba_flutter_app/notifications/widgets/notification_status_btn.dart';
import 'package:nba_flutter_app/notifications/widgets/notification_tile.dart';
import 'package:nba_flutter_app/utils/page_transition.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff09161C),
      appBar: AppBar(
        backgroundColor: Color(0xff1A2A30),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.white,),
        ),
        centerTitle: true,
        title: Row(
          children: [
            Text(
              'Notifications',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                pushWithTransition(context, NotificationFilterScreen());
              },
              child: Image.asset('assets/icons/filter_list.png',
                width: 24,
                height: 24,
              )
            )
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: NotificationStatusButtons(),
              ),
              for(int i=0;i<3;i++) ...[
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: NotificationContainer(date: 'Today')
                    ),
                    ListView(
                      shrinkWrap: true,
                      primary: false,
                      children: [
                        for(int i=0;i<10;i++) ...[
                          NotificationTile(
                            title: 'Hello',
                            description: 'Hey I am Mohd Jasir KhanS',
                            time: '12:05',
                            status: i%2 == 0 ? NotificationStatus.read : NotificationStatus.unread
                          )
                        ]
                      ],
                    )
                  ],
                )
              ]
            ]
          )
        ),
      ),
    );
  }
}