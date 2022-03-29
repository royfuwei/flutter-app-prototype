import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:seeks_app_prototype/infrastructures/util/keep_alive_wrapper.dart';

class DevSwiperWidget extends StatefulWidget {
  static String routeName = "/dev/swiper_widget";
  const DevSwiperWidget({Key? key}) : super(key: key);

  @override
  State<DevSwiperWidget> createState() => _DevSwiperWidgetState();
}

class _DevSwiperWidgetState extends State<DevSwiperWidget> {
  List<String> imageUrl = [
    "https://via.placeholder.com/350x150",
    "https://pbs.twimg.com/media/DfkhrO1XUAEYkdw.jpg",
    "https://images.ctfassets.net/hrltx12pl8hq/7yQR5uJhwEkRfjwMFJ7bUK/dc52a0913e8ff8b5c276177890eb0129/offset_comp_772626-opt.jpg?fit=fill&w=800&h=300",
  ];
  @override
  Widget build(BuildContext context) {
    return body();
  }

  body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.width,
          ),
          decoration: BoxDecoration(
            // color: Colors.amber.shade100,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              var _widget = ExtendedImage.network(
                imageUrl[index],
                fit: BoxFit.cover,
                mode: ExtendedImageMode.gesture,
                initGestureConfigHandler: (state) {
                  return GestureConfig(
                    minScale: 1.0,
                    animationMinScale: 0.7,
                    maxScale: 50.0,
                    animationMaxScale: 50.0,
                    speed: 1.0,
                    inertialSpeed: 100.0,
                    initialScale: 1.0,
                    inPageView: false,
                    initialAlignment: InitialAlignment.center,
                  );
                },
              );
              return KeepAliveWrapper(
                child: _widget,
                key: Key("$index"),
              );
            },
            itemCount: imageUrl.length,
            // scale: 0.8,
            pagination: SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                activeColor: Colors.amber,
              ),
              // builder: FractionPaginationBuilder(),
            ),
            autoplay: true,
            control: SwiperControl(
              color: Colors.transparent,
            ),
            onTap: (idx) {
              print("idx: ${idx}");
              setState(() {
                imageUrl.add(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCosNE8U8r4l6IY0NHJ7icaHynM8gFLQimNg&usqp=CAU");
              });
            },
          ),
        ),
      ],
    );
  }
}
