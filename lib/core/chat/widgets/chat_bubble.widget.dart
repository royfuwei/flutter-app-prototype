import 'package:flutter/material.dart';

class ChatBubbleWidget extends StatelessWidget {
  static String widgetName = "/chat_bubble";
  const ChatBubbleWidget({
    Key? key,
    required this.isCurrentUser,
    required this.text,
  }) : super(key: key);
  final bool isCurrentUser;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        isCurrentUser ? 88.0 : 16.0,
        4,
        isCurrentUser ? 16.0 : 88.0,
        4,
      ),
      child: Container(
        // color: Colors.green,
        child: Align(
          alignment:
              isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
          child: PhysicalShape(
            clipper: ChatBubbleClipper(isCurrentUser: isCurrentUser),
            // elevation: 2,
            color: isCurrentUser ? Colors.green.shade200 : Colors.grey.shade300,
            child: Container(
              padding: EdgeInsets.fromLTRB(
                isCurrentUser ? 12 : 18,
                12,
                isCurrentUser ? 18 : 12,
                12,
              ),
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      // color: isCurrentUser ? Colors.white : Colors.black87,
                      color: Colors.black87,
                      // fontSize: 14,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ChatBubbleClipper extends CustomClipper<Path> {
  // final BubbleType? type;
  final double radius;
  final double nipSize;
  final double sizeRatio;
  final bool isCurrentUser;

  ChatBubbleClipper(
      {this.isCurrentUser = false,
      this.radius = 20,
      this.nipSize = 8,
      this.sizeRatio = 3});

  @override
  Path getClip(Size size) {
    var path = Path();

    if (isCurrentUser) {
      path.addRRect(RRect.fromLTRBR(
          0, 0, size.width - radius / 3, size.height, Radius.circular(radius)));

      var path2 = Path();
      path2.arcToPoint(Offset(-radius, radius / 6),
          radius: Radius.circular(radius), clockwise: true);
      path2.lineTo(-radius / 1.5, radius / 1.5);
      path2.arcToPoint(Offset(0, 0),
          radius: Radius.circular(radius * 1.3), clockwise: false);

      path.addPath(path2, Offset(size.width, 0));
      path.addPath(path2, Offset(size.width, 0));
    } else {
      path.addRRect(RRect.fromLTRBR(
          radius / 3, 0, size.width, size.height, Radius.circular(radius)));

      var path2 = Path();
      path2.arcToPoint(Offset(radius, radius / 6),
          radius: Radius.circular(radius), clockwise: false);
      path2.lineTo(radius / 1.5, radius / 1.5);
      path2.arcToPoint(Offset(0, 0), radius: Radius.circular(radius * 1.3));

      path.addPath(path2, Offset(0, 0));
    }
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
