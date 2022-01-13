import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class FileModel {
  List<Widget> mediaList = [];
  String folder = '';
  int currentPage = 0;
  List<AssetEntity> asset = [];
  AssetPathEntity album;

  FileModel({
    required this.mediaList,
    required this.folder,
    required this.currentPage,
    required this.asset,
    required this.album,
  });

  /* FileModel.fromJson(Map<String, dynamic> json) {
    mediaList = json['mediaList'].cast<String>();
    folder = json['folderName'];
  } */
}

class DevPhotoManagerV3 extends StatefulWidget {
  static String routeName = "dev/photo_manager/v3";
  const DevPhotoManagerV3({Key? key}) : super(key: key);

  @override
  _DevPhotoManagerV3State createState() => _DevPhotoManagerV3State();
}

class _DevPhotoManagerV3State extends State<DevPhotoManagerV3> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  // late List<AssetPathEntity> filePaths;
  late FileModel? selectedModel;
  List<FileModel> files = [];

  Map<String, FileModel> fileMap = {};
  List<String> fileMapList = [];
  // late String image;
  // late Uint8List byteData;
  late File? file;

  List<Widget> _mediaList = [];
  int currentPage = 0;
  late int lastPage;

  @override
  void initState() {
    super.initState();
    selectedModel = null;
    file = null;
    _fetchNewMedia();
    print("initState _mediaList: ${_mediaList}");
  }

  _handleScrollEvent(ScrollNotification scroll, FileModel selectModel) async {
    print("_handleScrollEvent: ");
    print("_handleScrollEvent selectedModel.album: ${selectedModel!.album}");
    // print("_handleScrollEvent selectedModel.asset: ${selectedModel!.asset}");
    print(
        "_handleScrollEvent selectedModel.currentPage: ${selectedModel!.currentPage}");
    print("_handleScrollEvent selectedModel.folder: ${selectedModel!.folder}");
    // print(
    //     "_handleScrollEvent selectedModel.mediaList: ${selectedModel!.mediaList}");
    print("_handleScrollEvent scroll: ${scroll}");
    print("_handleScrollEvent currentPage: ${currentPage}");
    print("_handleScrollEvent lastPage: ${lastPage}");
    if (scroll.metrics.pixels / scroll.metrics.maxScrollExtent > 0.33) {
      if (currentPage != lastPage) {
        _fetchSelectMedia(selectModel.album);
      }
    }
  }

  _fetchSelectMedia(AssetPathEntity album) async {
    lastPage = currentPage;
    // print("currentPage: ${currentPage}");
    List<AssetEntity> media = await album.getAssetListPaged(currentPage, 60);
    List<Widget> temp = [];
    for (var asset in media) {
      temp.add(
        FutureBuilder(
          future: asset.thumbDataWithSize(200, 200),
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
                  ],
                ),
                onTap: () {
                  setState(() {
                    print("snapshot: ${snapshot.hasData}");
                  });
                },
              );
            }
            return Container();
          },
        ),
      );
    }

    print("_fetchSelectMedia temp: ${temp}");

    setState(() {
      _mediaList.addAll(temp);
      currentPage++;
    });
  }

  _fetchNewMedia() async {
    lastPage = currentPage;
    var result = await PhotoManager.requestPermission();
    if (result) {
      // success
      //load the album list
      List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
        type: RequestType.image,
        // onlyAll: true,
      );
      for (var album in albums) {
        List<AssetEntity> media =
            await album.getAssetListPaged(currentPage, 60);
        List<Widget> temp = [];
        for (var asset in media) {
          temp.add(
            FutureBuilder(
              future: asset.thumbDataWithSize(200, 200),
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
                      ],
                    ),
                    onTap: () {
                      setState(() {
                        print("snapshot: ${snapshot.hasData}");
                      });
                    },
                  );
                }
                return Container();
              },
            ),
          );
        }

        if (fileMap[album.name] == null) {
          FileModel file = new FileModel(
            mediaList: [],
            folder: album.name,
            currentPage: 0,
            asset: media,
            album: album,
          );
          fileMap[album.name] = file;
        }
        var getFile = fileMap[album.name];
        // print('getFile: ${getFile!.mediaList}');
        getFile!.mediaList.addAll(temp);
        setState(() {
          getFile.currentPage++;
          fileMap[album.name] = getFile;
        });
      }
      print("fileMap: ${fileMap.keys.first}");
      var getFile = await fileMap[fileMap.keys.first]!.asset[0].file;
      // var getFile2 = await fileMap[fileMap.keys.first]!.asset[0].thumbData;
      setState(() {
        var files = fileMap[fileMap.keys.first];
        selectedModel = files!;
        file = getFile;
        _mediaList = selectedModel!.mediaList;
      });
      print("selectedModel.album: ${selectedModel!.album}");
      // print("selectedModel.asset: ${selectedModel!.asset}");
      print("selectedModel.folder: ${selectedModel!.folder}");
      // print("selectedModel.mediaList: ${selectedModel!.mediaList}");
      print("selectedModel.currentPage: ${selectedModel!.currentPage}");
    } else {
      // fail
      /// if result is fail, you can call `PhotoManager.openSetting();`  to open android/ios applicaton's setting to get permission
    }
  }

  getItems() {
    if (fileMap != null) {
      var fileList = fileMap.values;
      return fileList.length > 0
          ? fileList
              .map((e) => DropdownMenuItem(
                    child: Text(
                      e.folder,
                      style: TextStyle(color: Colors.black),
                    ),
                    value: e,
                  ))
              .toList()
          : [];
    }
  }

  getBody() {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scroll) {
        // print("scroll: $scroll");
        // print("_mediaList: $_mediaList");
        _handleScrollEvent(scroll, selectedModel!);
        return true;
      },
      child: GridView.builder(
        itemCount: _mediaList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (BuildContext context, int index) {
          return _mediaList[index];
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("photo_manager"),
      ),
      /* body: SafeArea(
        child: selectedModel == null
            ? Container()
            : Column(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      child: file != null
                          // ? Image.file(File(image),
                          ? Image.file(file!,
                              height: MediaQuery.of(context).size.height * 0.45,
                              width: MediaQuery.of(context).size.width)
                          : Container()),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Icon(Icons.clear),
                      SizedBox(width: 20),
                      SizedBox(width: 10),
                      DropdownButtonHideUnderline(
                        child: DropdownButton<FileModel>(
                          items: fileMap != null ? getItems() : [],
                          // onChanged: (FileModel? d) {},
                          onChanged: (FileModel? d) async {
                            // assert(d!.files.length > 0);
                            // var getFile = (await d!.files[0].file)!;
                            // var getFilePath = await files[0].files[0].getMediaUrl();
                            // image = d!.files[0];
                            // byteData = image
                            setState(() {
                              // file = getFile;
                              // image = getFilePath!;
                              if (d != null) {
                                selectedModel = d;
                              }
                            });
                            print("onChanged selectedModel: ${selectedModel}");
                          },
                          value: selectedModel,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Next',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  // getMediaGrid(),
                  /* selectedModel == null || _mediaList.length < 1
                      ? Container()
                      : NotificationListener<ScrollNotification>(
                          onNotification: (ScrollNotification scroll) {
                            print("scroll: $scroll");
                            _handleScrollEvent(scroll, selectedModel!);
                            return true;
                          },
                          child: GridView.builder(
                            itemCount: _mediaList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return _mediaList[index];
                            },
                          ),
                        ), */
                ],
              ),
      ), */
      body: getBody(),
      // body: MediaGrid(),
    );
  }

  getMediaGrid() {
    if (_mediaList.length == 0 && selectedModel != null) {
      // print("selectedModel!.album: ${selectedModel!.album}");
      setState(() {
        _fetchSelectMedia(selectedModel!.album);
      });
      print("_mediaList: ${_mediaList}");
    }
    print(
        "selectedModel == null || _mediaList.length < 1: ${selectedModel == null || _mediaList.length < 1}");
    return Container();
    /* return selectedModel == null || _mediaList.length < 1
        ? Container()
        : NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scroll) {
              print("scroll: $scroll");
              _handleScrollEvent(scroll, selectedModel!);
              return true;
            },
            child: GridView.builder(
              itemCount: _mediaList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (BuildContext context, int index) {
                return _mediaList[index];
              },
            ),
          ); */
  }
}

/* --- */

class MediaGrid extends StatefulWidget {
  @override
  _MediaGridState createState() => _MediaGridState();
}

class _MediaGridState extends State<MediaGrid> {
  List<Widget> _mediaList = [];
  int currentPage = 0;
  late int lastPage;
  @override
  void initState() {
    super.initState();
    _fetchNewMedia();
  }

  _handleScrollEvent(ScrollNotification scroll) {
    if (scroll.metrics.pixels / scroll.metrics.maxScrollExtent > 0.33) {
      if (currentPage != lastPage) {
        _fetchNewMedia();
      }
    }
  }

  _fetchNewMedia() async {
    lastPage = currentPage;
    var result = await PhotoManager.requestPermission();
    if (result) {
      // success
      //load the album list
      // List<AssetPathEntity> albums =
      //     await PhotoManager.getAssetPathList(onlyAll: true);
      List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
        type: RequestType.image,
        onlyAll: true,
      );
      // print("albums: $albums");
      List<AssetEntity> media =
          await albums[0].getAssetListPaged(currentPage, 60);
      // print("media: $media");
      List<Widget> temp = [];
      for (var asset in media) {
        temp.add(
          FutureBuilder(
            future: asset.thumbDataWithSize(200, 200),
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
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      print("snapshot: ${snapshot.hasData}");
                    });
                  },
                );
              }
              return Container();
            },
          ),
        );
      }
      setState(() {
        _mediaList.addAll(temp);
        currentPage++;
      });
    } else {
      // fail
      /// if result is fail, you can call `PhotoManager.openSetting();`  to open android/ios applicaton's setting to get permission
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scroll) {
        // print("scroll: $scroll");
        _handleScrollEvent(scroll);
        return true;
      },
      child: GridView.builder(
          itemCount: _mediaList.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return _mediaList[index];
          }),
    );
  }
}
