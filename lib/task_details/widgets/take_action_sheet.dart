import 'package:flutter/material.dart';

class TakeActionSheet extends StatelessWidget {
  const TakeActionSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xff1A2A30),
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Take Action',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'SEND BIRTHDAY GREETINGS',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xff33BADD),
            ),
          ),
          SizedBox(height: 15,),
          Divider(color: Colors.white,),
           SizedBox(height: 20),
          Text(
            'SEND WHATSAPP MESSAGE',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xff33BADD),
            ),
          ),
          SizedBox(height: 15,),
          Divider(color: Colors.white,),
          SizedBox(height: 20),
          Text(
            'REQUEST CLOSURE',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xff33BADD),
            ),
          ),
          SizedBox(height: 15,),
        ],
      ),
    );
  }
}