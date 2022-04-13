import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/media/components/media_image.component.dart';
import 'package:seeks_app_prototype/core/users/controllers/user_controller.dart';
import 'package:seeks_app_prototype/domain/user.dart';

class UserInfoEditorImageComponent extends StatelessWidget {
  const UserInfoEditorImageComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());
    return body(context, userController);
  }

  body(BuildContext context, UserController userController) {
    return bodyUserImagesEditor(
      context,
      userController,
    );
  }

  bodyUserImagesEditor(
    BuildContext context,
    UserController userController,
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
              image: userController.userInfoImageProviders.length > 0
                  ? userController.userInfoImageProviders[0]
                  : AssetImage("assets/images/female-user.png"),
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.bottomRight,
          child: userImagesEditorButton(userController),
        ),
      ),
    );
  }

  getImageByImageType(UserInfoImageEntity item) {
    return getImageProviderByType(item.imageType, item.image);
  }

  userImagesEditorButton(UserController userController) {
    return TextButton(
      onPressed: userController.userImagesEditorOnPressed,
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
