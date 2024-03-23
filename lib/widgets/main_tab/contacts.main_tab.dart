import 'package:flutter/material.dart';
import 'package:portfolio/profile/contact.dart';
import 'package:portfolio/utils/text.dart';
import 'package:portfolio/widgets/contact_tile.dart';
import 'package:portfolio/widgets/titled_divider.dart';

class ContactsMainTab extends StatelessWidget {
  const ContactsMainTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          const TitledDivider(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('연락 프로필', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 19)),
                SizedBox(width: 10),
                Text(
                  '작업 문의, 상담 등',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(child: ContactTile(Contact.discord_profile)),
              SizedBox(width: 10),
              Flexible(child: ContactTile(Contact.google_mail)),
            ],
          ),
          SizedBox(height: 40),
          text('디스코드를 통하여 연락주시면 가장 빠르게 확인할 수 있습니다.', color: Colors.grey, size: 13),
        ],
      ),
    );
  }
}
