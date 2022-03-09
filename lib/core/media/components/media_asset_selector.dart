import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/media/components/media_album_selector.dart';
import 'package:seeks_app_prototype/core/media/models/media_asset.dart';

class MediaAssetSelectorNotification extends Notification {
  final List<AssetEntity> selectAssets;
  final AssetEntity selectAsset;
  MediaAssetSelectorNotification({
    required this.selectAssets,
    required this.selectAsset,
  });
}

class MediaAssetSelector extends StatefulWidget {
  static String routeName = 'media/cpt/asset_selector';
  const MediaAssetSelector({Key? key}) : super(key: key);

  @override
  State<MediaAssetSelector> createState() => _MediaAssetSelectorState();
}

class _MediaAssetSelectorState extends State<MediaAssetSelector> {
  ScrollController _scrollController = new ScrollController();
  List<MediaAssetModel> _mediaAssetModelList = [];
  List<AssetPathEntity> albums = [];
  int currentPage = 0;
  late AssetPathEntity selectAlbum;
  late int lastPage;
  late String selectName = '';
  List<AssetEntity> selectAssets = [];
  late AssetEntity selectAsset;
  bool isSelectMulti = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottom: false,
      backgroundColor: Colors.black,
      body: SafeArea(
        bottom: false,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              bodySelecter(),
              bodyMediaGridView(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    /* _scrollController.addListener(() {
      print(_scrollController.offset);
    }); */
    initStateAsync();
  }

  initStateAsync() async {
    await _getAlbums();
    selectAlbum = albums[0];
    selectName = selectAlbum.name;
    await _fetchNewMedia();
  }

  bodySelecter() {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      height: getProportionateScreenWidth(context, 56),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    showModalMediaBottomSheet(context);
                  },
                  child: Row(
                    children: [
                      Text(
                        selectName, // "最近項目",
                        style: TextStyle(
                          color: colorIconHidden,
                          fontSize: getProportionateScreenWidth(context, 20),
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: colorIconHidden,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.only(
                        right: 5,
                        left: 5,
                      ),
                    ),
                  ),
                  onPressed: () {
                    toggleSelectMulit();
                  },
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: isSelectMulti ? Colors.blue : Colors.black45,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: colorIconHidden,
                      ),
                    ),
                    child: Icon(
                      Icons.my_library_add_sharp,
                      color: colorIconHidden,
                      size: getProportionateScreenWidth(context, 24),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.only(right: 2, left: 5),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: colorIconHidden,
                      ),
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      color: colorIconHidden,
                      size: getProportionateScreenWidth(context, 24),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bodyMediaGridView() {
    return Expanded(
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scroll) {
          _handleScrollEvent(scroll);
          return true;
        },
        child: GridView.builder(
          controller: _scrollController,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemCount: _mediaAssetModelList.length,
          itemBuilder: (BuildContext context, int index) {
            var model = _mediaAssetModelList[index];
            var asset = model.asset;
            return GestureDetector(
              key: Key(asset.id),
              child: Stack(
                children: <Widget>[
                  model.widget,
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelectAsset(asset) ? mediaSelectColor : null,
                        border: Border.all(
                          width: 0.5,
                        ),
                      ),
                    ),
                  ),
                  if (isSelectMulti)
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 3, top: 3),
                        child: Container(
                          width: getProportionateScreenWidth(context, 24),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isSelectAssets(asset) ? Colors.blue : null,
                            border: Border.all(
                              width: 1,
                              color: Colors.white,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 2),
                            child: Text(
                              isSelectAssets(asset)
                                  ? "${selectAssets.indexOf(asset) + 1}"
                                  : "",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    getProportionateScreenWidth(context, 18),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              onTap: () {
                updateSelectAssets(asset);
              },
            );
          },
        ),
      ),
    );
  }

  void showModalMediaBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) =>
          NotificationListener<SelectMediaAlbumNotification>(
        onNotification: (notification) {
          if (notification.album.name == selectAlbum.name) {
            return true;
          }
          setState(() {
            _refreshFetchNewMedia(notification.album);
          });
          return true;
        },
        child: MediaAlbumSelector(),
      ),
    );
  }

  _handleScrollEvent(ScrollNotification scroll) {
    if (scroll.metrics.pixels / scroll.metrics.maxScrollExtent > 0.33) {
      if (currentPage != lastPage) {
        _fetchNewMedia();
      }
    }
  }

  _getAlbums() async {
    albums = await PhotoManager.getAssetPathList(
      type: RequestType.image,
      // onlyAll: true,
    );
  }

  _refreshFetchNewMedia(AssetPathEntity newAlbum) async {
    selectAlbum = newAlbum;
    selectName = selectAlbum.name;
    currentPage = 0;
    lastPage = 0;
    _mediaAssetModelList = [];
    if (!isSelectMulti) {
      selectAssets = [];
    }
    await _fetchNewMedia();
  }

  _fetchNewMedia() async {
    lastPage = currentPage;
    var isReqPermission = await PhotoManager.requestPermission();
    if (!isReqPermission) {
      return;
    }
    List<AssetEntity> media =
        await selectAlbum.getAssetListPaged(currentPage, 40);
    List<MediaAssetModel> temp = [];
    for (var asset in media) {
      if (selectAssets.isEmpty) {
        selectAssets.add(asset);
        selectAsset = asset;
        MediaAssetSelectorNotification(
          selectAssets: selectAssets,
          selectAsset: selectAsset,
        ).dispatch(context);
      }
      var mediaGridItem = genMediaGridItem(asset);
      MediaAssetModel model = MediaAssetModel(
        widget: mediaGridItem,
        asset: asset,
      );
      temp.add(model);
    }
    setState(() {
      _mediaAssetModelList.addAll(temp);
      currentPage++;
    });
  }

  Widget genMediaGridItem(AssetEntity asset) {
    return FutureBuilder(
      key: Key(asset.id),
      future: asset.thumbDataWithSize(300, 300),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(
            children: <Widget>[
              Positioned.fill(
                child: Image.memory(
                  snapshot.data! as Uint8List,
                  fit: BoxFit.cover,
                ),
              ),
              if (asset.type == AssetType.video)
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 5, bottom: 5),
                    child: Icon(
                      Icons.videocam,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          );
        }
        return Container();
      },
    );
  }

  updateSelectAsset(AssetEntity asset) {
    setState(() {
      if (isSelectAssets(asset)) {
        selectAsset = asset;
      } else {
        selectAsset = selectAssets.last;
      }
    });
  }

  updateSelectAssets(AssetEntity asset) {
    if (!isSelectMulti && asset.id == selectAsset.id) return true;
    setState(() {
      if (!isSelectMulti) {
        selectAssets = [asset];
      } else {
        if (selectAsset == asset) {
          selectAssets.remove(asset);
        } else if (!isSelectAssets(asset)) {
          selectAssets.add(asset);
        }
      }
    });
    updateSelectAsset(asset);
    MediaAssetSelectorNotification(
      selectAssets: selectAssets,
      selectAsset: selectAsset,
    ).dispatch(context);
  }

  isSelectAsset(AssetEntity asset) {
    return selectAsset == asset;
  }

  isSelectAssets(AssetEntity asset) {
    return selectAssets.indexOf(asset) >= 0;
  }

  toggleSelectMulit() {
    setState(() {
      isSelectMulti = !isSelectMulti;
      if (!isSelectMulti) {
        selectAssets = [selectAsset];
        _jumpToGridView(selectAsset);
      }
    });
  }

  _jumpToGridView(AssetEntity asset) {
    var assets = _mediaAssetModelList.map((e) => e.asset).toList();
    var count = assets.indexOf(selectAsset) + 1;
    var gridIndex = (count ~/ 4);
    _scrollController.animateTo(
      gridIndex * MediaQuery.of(context).size.width / 4,
      duration: Duration(seconds: 1),
      curve: Curves.easeIn,
    );
  }
}
