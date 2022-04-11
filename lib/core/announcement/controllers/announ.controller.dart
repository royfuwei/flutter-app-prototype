import 'package:get/get.dart';
import 'package:seeks_app_prototype/domain/announcement.dart';
import 'package:seeks_app_prototype/domain/media.dart';

class AnnounController extends GetxController {
  Rx<List<AnnounBoardEntity>> _announBoardList = Rx<List<AnnounBoardEntity>>(
    [
      AnnounBoardEntity(id: "01"),
      AnnounBoardEntity(id: "02", image: "assets/images/splash_2.jpg"),
      AnnounBoardEntity(id: "03", image: "assets/images/splash_3.jpg"),
      AnnounBoardEntity(
          id: "04",
          image: "https://i.ytimg.com/vi/x-S8vKV59Ik/maxresdefault.jpg",
          imageType: ImageType.URL),
      AnnounBoardEntity(id: "05", image: "assets/images/splash_2.jpg"),
    ],
  );
  set announBoardList(value) => _announBoardList.value = value;
  List<AnnounBoardEntity> get announBoardList => _announBoardList.value;

  Future<void> onTapAnnounBoardItem(AnnounBoardEntity item) async {
    print("item.id: ${item.id}");
  }
}
