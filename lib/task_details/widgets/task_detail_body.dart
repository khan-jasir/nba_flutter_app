import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TaskDetailsBody extends StatelessWidget {
  const TaskDetailsBody({
    super.key,
    required this.heading,
    required this.subheading,
    required this.clientName,
    required this.clientPhoneNo,
    required this.clientEmailId,
    required this.isBirthdayTask,
    this.clientAge,
  });

  final String heading;
  final String subheading;
  final String clientName;
  final String clientPhoneNo;
  final String clientEmailId;
  final bool isBirthdayTask;
  final String? clientAge;

  Future<void> _makePhoneCall(String phoneNumber) async {
    // Remove any spaces or special characters from the phone number
    final String cleanNumber = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');
    
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: cleanNumber,
    );
    
    try {
      final bool canLaunch = await canLaunchUrl(launchUri);
      print('Can launch URL: $canLaunch');
      print('Launch URI: $launchUri');
      
      if (canLaunch) {
        await launchUrl(launchUri);
      } else {
        print('Cannot launch phone call');
      }
    } catch (e) {
      print('Error launching phone call: $e');
      print('Phone number: $phoneNumber');
      print('Cleaned number: $cleanNumber');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xff1A2A30),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5,),
          Text(
            subheading,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 15,),
          Divider(color: Colors.white,),
          SizedBox(height: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 
              Text(
                clientName,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff33BADD),
                ),
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [                      
                  Text(
                    clientPhoneNo,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                //  SizedBox(width: 140,),
                  GestureDetector(
                    onTap: () => _makePhoneCall(clientPhoneNo.replaceAll('+91 ', '')),
                    child: Image.asset('assets/icons/phone.png', width: 40, height: 40,),
                  ),
                ],
              ),
               SizedBox(height: 5,),
              Text(
                clientEmailId,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          if(isBirthdayTask) ...[
            Text(
            'They turn $clientAge years today!',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          ]
        ],
      ),
    );
  }
}