import 'dart:io';

import 'package:flutter/material.dart';
import 'package:seeks_flutter/configs/size_config.dart';
import 'package:seeks_flutter/constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:seeks_flutter/core/common/components/default_button.dart';
import 'package:photo_gallery/photo_gallery.dart';

class FileModel {
  List<String> files = [];
  String folder = '';

  FileModel({
    required this.files,
    required this.folder,
  });

  FileModel.fromJson(Map<String, dynamic> json) {
    files = json['files'].cast<String>();
    folder = json['folderName'];
  }
}

class DevImageIGPicker extends StatefulWidget {
  static String routeName = "dev/image/ig/picker";
  const DevImageIGPicker({Key? key}) : super(key: key);

  @override
  _DevImageIGPickerState createState() => _DevImageIGPickerState();
}

class _DevImageIGPickerState extends State<DevImageIGPicker> {
  Future<Directory?>? _appDocumentsDirectory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            DefaultButton(
              text: "test",
              press: () {
                /* print("start _folders: $_folders");
                getDir();
                print("end _folders: $_folders"); */
                getImagesPath();
              },
            ),
            /* FutureBuilder<Directory?>(
              builder: buildDirectory,
              future: _appDocumentsDirectory,
            ), */
            /* _folders.isEmpty && _folders.length > 0
                ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                    ),
                    itemBuilder: (_, i) {
                      var file = _folders[i];
                      return GestureDetector(
                        child: Text('file: ${file.path}'),
                      );
                    },
                  )
                : Container(), */
          ],
        ),
      ),
    );
  }

  Widget buildDirectory(
    BuildContext context,
    AsyncSnapshot<Directory?> snapshot,
  ) {
    Text text = const Text('');
    print("snapshot: $snapshot");
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasData) {
        String combined = snapshot.data!.path;
        text = Text('paths: $combined');
      }
    }
    return Padding(
      padding: EdgeInsets.all(16),
      child: text,
    );
  }

  initState() {
    super.initState();
    // print("_folders: ${_folders}");
    // getImagesPath();
  }

  late List<FileSystemEntity> _folders;
  Future<void> getDir() async {
    final directory = await getApplicationDocumentsDirectory();
    final dir = directory.path;
    String pdfDirectory = '$dir/';
    final myDir = new Directory(pdfDirectory);
    setState(() {
      _folders = myDir.listSync(recursive: true, followLinks: false);
    });
    print(_folders);
  }

  getImagesPath() async {
    Directory _appDocumentsDirectory = await getApplicationDocumentsDirectory();
    // Directory _appDocumentsDirectory = await getApplicationSupportDirectory();

    print("_appDocumentsDirectory: $_appDocumentsDirectory");
    print("_appDocumentsDirectory.path: ${_appDocumentsDirectory.path}");
    print("_appDocumentsDirectory.list(): ${_appDocumentsDirectory.list()}");
  }

  appBar() {
    return AppBar(
      elevation: 0.2,
      // backgroundColor: colorBarWhite,
      backgroundColor: Colors.white,
      title: Text(
        "新增照片 IG",
        style: TextStyle(
          color: colorFont02,
          fontSize: getProportionateScreenWidth(context, 20),
        ),
      ),
    );
  }
}
