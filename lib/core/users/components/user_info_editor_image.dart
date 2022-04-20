import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/users/controllers/user_info_controller.dart';

class UserInfoEditorImageComponent extends StatelessWidget {
  const UserInfoEditorImageComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserInfoController userInfoController = Get.put(UserInfoController());
    return body(context, userInfoController);
  }

  body(BuildContext context, UserInfoController userInfoController) {
    return bodyUserImagesEditor(
      context,
      userInfoController,
    );
  }

  bodyUserImagesEditor(
    BuildContext context,
    UserInfoController userInfoController,
  ) {
    return Obx(
      () => Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 0.1, color: Colors.grey),
            image: DecorationImage(
              image: userInfoController.userInfoImageProviders.length > 0
                  ? userInfoController.userInfoImageProviders[0]
                  // : AssetImage("assets/images/female-user.png"),
                  : ExtendedImage.network(
                          "https://seeks.tech/source/images/female-user.png")
                      .image,
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.bottomRight,
          child: userImagesEditorButton(userInfoController),
        ),
      ),
    );
  }

  userImagesEditorButton(UserInfoController userInfoController) {
    return TextButton(
      onPressed: userInfoController.userInfoEditorImagesOnPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.amber),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        ),
      ),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Icon(Icons.edit),
          Text("編輯"),
        ],
      ),
    );
  }
}
