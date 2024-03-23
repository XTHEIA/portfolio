import 'package:flutter/material.dart';
import 'package:portfolio/profile/contact.dart';

class ContactTile extends StatefulWidget {
  final Contact contact;

  const ContactTile(this.contact, {super.key});

  @override
  State<ContactTile> createState() => _ContactTileState();
}

class _ContactTileState extends State<ContactTile> {
  late final contact = widget.contact;
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onHover: (b) => setState(() => isHovering = b),
        onTap: () => contact.tapAndOpenDialog(context),
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF292F35), contact.color],
              stops: [isHovering ? 0.40 : 0.5, 1],
              transform: GradientRotation(1.4),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(1, 1),
                blurRadius: 5,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              SizedBox(
                height: 26,
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                      child: contact.leading,
                    ),
                    SizedBox(width: 6),
                    Text(contact.title, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
                  ],
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 60,
                child: LinearProgressIndicator(minHeight: 1, color: contact.color),
              ),

              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    contact.link,
                    style: TextStyle(color: contact.color, fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
