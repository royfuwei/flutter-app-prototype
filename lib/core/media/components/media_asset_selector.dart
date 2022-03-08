import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/media/components/media_album_selector.dart';

class MediaAssetSelectorNotification extends Notification {
  final List<AssetEntity> selectAssets;
  MediaAssetSelectorNotification(this.selectAssets);
}

class MediaAssetSelector extends StatefulWidget {
  static String routeName = 'media/cpt/asset_selector';
  const MediaAssetSelector({Key? key}) : super(key: key);

  @override
  State<MediaAssetSelector> createState() => _MediaAssetSelectorState();
}

class _MediaAssetSelectorState extends State<MediaAssetSelector> {
  List<Widget> _mediaList = [];
  List<AssetEntity> _assetList = [];
  List<AssetPathEntity> albums = [];
  int currentPage = 0;
  late AssetPathEntity selectAlbum;
  late int lastPage;
  late String selectName = '';
  List<AssetEntity> selectAssets = [];

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
                        // "最近項目",
                        selectName,
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
                  onPressed: null,
                  child: Icon(
                    Icons.camera_alt,
                    color: colorIconHidden,
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
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemCount: _mediaList.length,
          itemBuilder: (BuildContext context, int index) {
            return _mediaList[index];
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
    _mediaList = [];
    _assetList = [];
    selectAssets = [];
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
    List<Widget> temp = [];
    for (var asset in media) {
      File? imageFile = await asset.originFile;
      if (selectAssets.isEmpty) {
        selectAssets.add(asset);
        MediaAssetSelectorNotification(selectAssets).dispatch(context);
      }
      var mediaGridItem = genMediaGridItem(asset);
      temp.add(mediaGridItem);
    }
    setState(() {
      _assetList.addAll(media);
      _mediaList.addAll(temp);
      currentPage++;
    });
  }

  Widget genMediaGridItem(AssetEntity asset) {
    return FutureBuilder(
      key: Key(asset.id),
      future: asset.thumbDataWithSize(300, 300),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return GestureDetector(
            child: Stack(
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
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelectAsset(asset) ? mediaSelectColor : null,
                      border: Border.all(
                        width: 0.5,
                      ),
                    ),
                  ),
                )
              ],
            ),
            onTap: () {
              updateAssetSelect(asset);
            },
          );
        }
        return Container();
      },
    );
  }

  updateAssetSelect(AssetEntity asset) {
    if (asset.id == selectAssets[0].id) return true;
    var originalSelectAsset = selectAssets[0];
    List<Widget> temp = _mediaList;
    selectAssets[0] = asset;

    for (var assetWidget in _mediaList) {
      if (assetWidget.key == Key(originalSelectAsset.id)) {
        var idx = _mediaList.indexOf(assetWidget);
        _mediaList[idx] = genMediaGridItem(originalSelectAsset);
      }
      if (assetWidget.key == Key(asset.id)) {
        var idx = _mediaList.indexOf(assetWidget);
        _mediaList[idx] = genMediaGridItem(asset);
      }
    }
    MediaAssetSelectorNotification(selectAssets).dispatch(context);
    setState(() {
      _mediaList = _mediaList;
    });
  }

  isSelectAsset(AssetEntity asset) {
    return selectAssets.indexOf(asset) >= 0;
  }
}
