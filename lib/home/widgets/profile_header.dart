import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nba_flutter_app/home/widgets/notification.dart';
import 'package:nba_flutter_app/core/local_storage.dart';
import 'package:nba_flutter_app/login/view/login.dart';
import 'package:nba_flutter_app/utils/page_transition.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xff1A2A30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        title: const Text(
          'Logout',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        content: const Text(
          'Are you sure you want to logout?',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Color(0xff33BADD),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          TextButton(
            onPressed: () async {
              await LocalStorage.setAgentPhone('');
              if (context.mounted) {
                pushAndRemoveUntilWithTransition(
                  context,
                  const PhoneNumberScreen(),
                  beginOffset: const Offset(0.0, 1.0), // Slide up from bottom
                );
              }
            },
            child: const Text(
              'Logout',
              style: TextStyle(
                color: Color(0xffE7615B),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15,),
      decoration: const BoxDecoration(
        color: Color(0xff000000)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 22,
            height: 22,
            child: Image.asset('assets/icons/wr_home_icon.png'),
          ),
          const SizedBox(width: 5),
          const Text(
            'Home',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white
            ),
          ),
          const Spacer(),
          const NotificationWidget(),
         // const SizedBox(width: 5),
          PopupMenuButton<String>(
            color: const Color(0xff1A2A30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            icon: SizedBox(
              width: 22,
              height: 22,
              child: Icon(Icons.person_outline, color: Colors.white,),
            ),
            onSelected: (value) {
              if (value == 'logout') {
                _showLogoutDialog(context);
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem<String>(
                value: 'logout',
                child: Row(
                  children: [
                    const Icon(
                      Icons.logout,
                      color: Color(0xffE7615B),
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}