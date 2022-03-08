import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/common/components/default_app_bar.dart';

class SelectMediaAlbumNotification extends Notification {
  final AssetPathEntity album;
  SelectMediaAlbumNotification(this.album);
}

class MediaAlbumSelector extends StatefulWidget {
  static String routeName = 'media/cpt/album_selector';
  const MediaAlbumSelector({
    Key? key,
  }) : super(key: key);

  @override
  State<MediaAlbumSelector> createState() => _MediaAlbumSelectorState();
}

class _MediaAlbumSelectorState extends State<MediaAlbumSelector> {
  List<Widget> _albumList = [];
  List<AssetPathEntity> albums = [];

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(
          child: Scaffold(
            backgroundColor: Colors.black,
            appBar: appBar(),
            // body: MediaGridSplash(),
            body: body(),
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    initStateAsync();
  }

  initStateAsync() async {
    await _getAlbums();
    await genAlbumList(albums);
  }

  _getAlbums() async {
    albums = await PhotoManager.getAssetPathList(
      type: RequestType.image,
      // onlyAll: true,
    );
  }

  body() {
    return Container(
      child: _albumList.length > 0
          ? ListView.builder(
              itemCount: _albumList.length,
              itemBuilder: (BuildContext context, int index) {
                return _albumList[index];
              },
            )
          : Container(),
    );
  }

  genAlbumList(List<AssetPathEntity> albums) async {
    // print("genAlbumList albums: ${albums}");
    List<Widget> temp = [];
    for (var album in albums) {
      var asset = (await album.getAssetListPaged(0, 1))[0];
      temp.add(
        FutureBuilder(
          future: asset.thumbDataWithSize(200, 200),
          builder: (BuildContext bc, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // print("snapshot: ${snapshot}");
              return GestureDetector(
                onTap: () {
                  SelectMediaAlbumNotification(album).dispatch(bc);
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  // width: ,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    // borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Image.memory(
                        snapshot.data! as Uint8List,
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              album.name,
                              style: TextStyle(
                                color: colorIconHidden,
                                fontSize: getProportionateScreenWidth(bc, 18),
                              ),
                            ),
                            Text(
                              "${album.assetCount}",
                              style: TextStyle(
                                color: colorIconHidden,
                                fontSize: getProportionateScreenWidth(bc, 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      );
    }

    setState(() {
      _albumList.addAll(temp);
    });
  }

  appBar() {
    return AppBar(
      backgroundColor: Colors.black,
      title: defaultExpandedAppBarTitle(
        startItems: [
          TextButton(
            onPressed: () {
              Navigator.pop(
                context,
              );
            },
            child: Text(
              "取消",
              style: TextStyle(
                color: colorBarWhite,
                fontSize: getProportionateScreenWidth(context, 18),
              ),
            ),
          ),
        ],
        titleItems: [
          Text(
            "選擇相簿",
            style: TextStyle(
              color: colorBarWhite,
              fontSize: getProportionateScreenWidth(context, 20),
            ),
          ),
        ],
        endItems: [],
      ),
    );
  }
}
