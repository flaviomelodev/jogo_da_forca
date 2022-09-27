import 'package:flutter/material.dart';

class ListTileAppWidget extends StatelessWidget {
  final EdgeInsets contentPadding;
  final ImageProvider? avatarImage;
  final String titleText;
  final String subTitleText;
  final Function()? onTap;
  const ListTileAppWidget(
      {Key? key,
      this.contentPadding =
          const EdgeInsets.only(left: 54.0, top: 0.0, bottom: 8.0),
      this.avatarImage,
      required this.titleText,
      required this.subTitleText,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: contentPadding,
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            (avatarImage == null)
                ? Container(width: 0)
                : Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: avatarImage!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(titleText),
                  Text(
                    subTitleText,
                    style: const TextStyle(fontSize: 10.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
