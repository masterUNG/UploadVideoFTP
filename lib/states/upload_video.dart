import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ftpconnect/ftpconnect.dart';
import 'package:image_picker/image_picker.dart';

class UploadVideo extends StatefulWidget {
  const UploadVideo({super.key});

  @override
  State<UploadVideo> createState() => _UploadVideoState();
}

class _UploadVideoState extends State<UploadVideo> {
  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ElevatedButton(
        onPressed: () async {
          var result = await ImagePicker().pickVideo(
              source: ImageSource.camera,
              preferredCameraDevice: CameraDevice.front);
          if (result != null) {
            file = File(result.path);

            processUpload();
          }
        },
        child: const Text('Record Video'),
      ),
    );
  }

  Future<void> processUpload() async {
    FTPConnect ftpConnect = FTPConnect('stream115.otaro.co.th',
        user: 'adminftp', pass: 'c@WS83m4&C3j');
    await ftpConnect.connect();
    bool response = await ftpConnect.uploadFileWithRetry(file!, pRemoteName: 'ung.mp4');
    await ftpConnect.disconnect();
    print('response ----> $response');
  }
}
