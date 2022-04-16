import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/core/media/services/media.service.dart';
import 'package:seeks_app_prototype/domain/announcement.dart';
import 'package:seeks_app_prototype/infrastructures/util/keep_alive_wrapper.dart';

class AnnounBoardSwiperWidget extends StatelessWidget {
  static String routeName = "/announ_board_body";
  const AnnounBoardSwiperWidget({
    Key? key,
    this.items = const [],
    this.itemOnTap,
    this.itemBuilder,
  }) : super(
          key: key,
        );

  final List<AnnounBoardEntity> items;
  final Future<void> Function(AnnounBoardEntity)? itemOnTap;
  final Widget Function(BuildContext, int, AnnounBoardEntity)? itemBuilder;

  @override
  Widget build(BuildContext context) {
    MediaService mediaService = MediaService();
    return body(context, mediaService);
  }

  body(BuildContext context, MediaService mediaService) {
    return Swiper(
      itemBuilder: itemBuilder != null
          ? (BuildContext bc, int index) => itemBuilder!(
                bc,
                index,
                items[index],
              )
          : (BuildContext bc, int index) {
              return genAccouBoardImage(
                mediaService,
                index,
                items[index],
              );
            },
      layout: SwiperLayout.DEFAULT,
      scale: 0.8,
      autoplay: true,
      itemCount: items.length,
      duration: 2000,
      autoplayDelay: 10000,
      // itemWidth: MediaQuery.of(context).size.width * .9,
      pagination: SwiperPagination(
        builder: DotSwiperPaginationBuilder(
          color: Colors.grey,
          activeColor: Colors.white,
          activeSize: 8,
          size: 5,
        ),
      ),
      control: SwiperControl(color: Colors.transparent),
      onTap: (index) => itemOnTap != null ? itemOnTap!(items[index]) : {},
    );
  }

  genAccouBoardImage(
      MediaService mediaService, int index, AnnounBoardEntity item) {
    var image = mediaService.getImageProviderByType(
      item.imageType,
      item.image,
    );
    return KeepAliveWrapper(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
