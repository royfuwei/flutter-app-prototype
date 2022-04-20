import 'package:get/get.dart';
import 'package:seeks_app_prototype/domain/announcement.dart';
import 'package:seeks_app_prototype/domain/media.dart';

class AnnounController extends GetxController {
  Rx<List<AnnounBoardEntity>> _announBoardList = Rx<List<AnnounBoardEntity>>(
    [
      AnnounBoardEntity(
          id: "04",
          image: "https://i.ytimg.com/vi/x-S8vKV59Ik/maxresdefault.jpg",
          imageType: ImageType.URL),
      AnnounBoardEntity(
          id: "02", image: "assets/images/test/announcement/開幕慶04.png"),
      AnnounBoardEntity(
          id: "02", image: "assets/images/test/announcement/MVP02_0.png"),
      AnnounBoardEntity(
          id: "02", image: "assets/images/test/announcement/MVP02.png"),
      AnnounBoardEntity(
          id: "02", image: "assets/images/test/announcement/MVP04.png"),
    ],
  );
  set announBoardList(value) => _announBoardList.value = value;
  List<AnnounBoardEntity> get announBoardList => _announBoardList.value;

  Future<void> onTapAnnounBoardItem(AnnounBoardEntity item) async {
    print("item.id: ${item.id}");
  }
}
