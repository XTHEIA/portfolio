import 'package:flutter/material.dart';
import 'package:portfolio/profile/contact.dart';
import 'package:portfolio/widgets/hover_tile.dart';

class ProfileTile extends StatelessWidget {
  final Contact contact;
  final Widget leading;
  final Color color;
  final String title, description, link;
  final bool isUrl;

  const ProfileTile(
    this.contact, {
    super.key,
    required this.color,
    required this.leading,
    required this.title,
    required this.description,
    this.isUrl = false,
    required this.link,
  });

  ProfileTile.contact(Contact contact, {Key? key})
      : this(
          contact,
          key: key,
          color: contact.color,
          leading: contact.leading,
          title: contact.title,
          description: contact.description,
          link: contact.link,
          isUrl: contact.isUrl,
        );

  @override
  Widget build(BuildContext context) {
    return HoverTile(
      onTap: () => contact.tapAndOpenDialog(context),
      color: color,
      idleWidget: SizedBox.square(
        dimension: 28,
        child: leading,
      ),
      hoverWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(fontSize: 12),
            maxLines: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isUrl ? Icons.open_in_new : Icons.copy,
                color: color,
                size: 15,
              ),
              const SizedBox(width: 3),
              Text(
                description,
                style: TextStyle(
                  color: color,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.fade,
                ),
                maxLines: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
