import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/profile/profiles.dart';
import 'package:portfolio/utils/text.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact {
  final Widget leading;
  final String title, description, link;
  final String? usages;
  final bool isUrl;
  final Color color;

  Contact._url({
    required this.leading,
    required this.title,
    required this.description,
    this.usages,
    required this.link,
    required this.color,
  }) : isUrl = true;

  Contact._copy({
    required this.leading,
    required this.title,
    required this.description,
    this.usages,
    required this.link,
    required this.color,
  }) : isUrl = false;

  Future onTap() {
    if (isUrl) {
      return launchUrl(Uri.parse(link));
    } else {
      return Clipboard.setData(ClipboardData(text: link));
    }
  }

  Future openDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (final context) => Dialog(
        child: Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: const Color(0xFF1C1B1F),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle, color: Colors.cyanAccent, size: 50),
              const SizedBox(height: 8),
              const Text('감사합니다!'),
              const SizedBox(height: 20),
              text(isUrl ? '웹페이지가 새 탭에서 열렸습니다.' : '클립보드에 복사되었습니다.', color: Colors.grey, size: 13),
            ],
          ),
        ),
      ),
    );
  }

  Future tapAndOpenDialog(BuildContext context) {
    onTap();
    return openDialog(context);
  }

  static final Contact //
      discord_profile = Contact._copy(
        leading: Icon(Icons.discord, color: Color(0xFF7289da), size: 27),
        color: Color(0xFF7289da),
        title: 'Discord',
        description: Profiles.DISCORD_TAG,
        link: Profiles.DISCORD_TAG,
      ),
      kmong_profile = Contact._url(
        leading: Image.asset('assets/images/contact/kmong.png'),
        color: const Color(0xFFf9d448),
        title: '크몽 프로필',
        description: 'SBKIMXTHEiA',
        link: Profiles.KMONG_PROFILE_ADDRESS,
      ),
      google_mail = Contact._copy(
        leading: Image.asset('assets/images/contact/gmail.png'),
        color: Colors.redAccent,
        title: '이메일',
        description: Profiles.EMAIL_ADDRESS,
        link: Profiles.EMAIL_ADDRESS,
      ),
      github_profile = Contact._url(
        leading: Image.asset('assets/images/contact/github.png', color: Colors.white),
        color: Colors.white,
        title: 'GitHub',
        description: 'sbkimxtheia',
        link: Profiles.GITHUB_PROFILE,
      ),
      youtube_channel = Contact._url(
        leading: Image.asset('assets/images/contact/youtube.png'),
        color: const Color(0xFFFB0000),
        title: 'YouTube',
        description: '세빈 SBXT',
        link: Profiles.YOUTUBE_CHANNEL,
      );

// 의뢰
//  크몽 페이지

// 직접 의뢰/문의/연락
//  디스코드, 메일, 크몽
//
}
