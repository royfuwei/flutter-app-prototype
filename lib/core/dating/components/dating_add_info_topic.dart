import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/core/dating/components/dating.component.dart';

class DatingAddInfoTopicComponent extends StatelessWidget {
  const DatingAddInfoTopicComponent({
    Key? key,
    this.topicFocusNode,
    this.image = const AssetImage("assets/images/splash_1.jpg"),
    this.controller,
    this.onChanged,
    this.onTap,
  }) : super(key: key);

  final FocusNode? topicFocusNode;
  final ImageProvider<Object> image;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  body(BuildContext context) {
    return bodyDatingTopic(context);
  }

  bodyDatingTopic(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.width / 4.5,
            width: MediaQuery.of(context).size.width / 4.5,
            decoration: BoxDecoration(
              color: Colors.green.shade200,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  getTextDatingTextField(
                    context: context,
                    onChanged: onChanged,
                    onTap: onTap,
                    controller: controller,
                    title: "約會主題",
                    hintText: "填寫約會主題... (>5字)",
                    focusNode: topicFocusNode,
                    keyboardType: TextInputType.text,
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 8, left: 16),
                    child: Divider(
                      height: 1,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
