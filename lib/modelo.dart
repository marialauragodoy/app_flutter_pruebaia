import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class ModeloPage extends StatefulWidget {
  const ModeloPage({Key? key}) : super(key: key);

  @override
  State<ModeloPage> createState() => _ModeloPageState();
}

class _ModeloPageState extends State<ModeloPage> {
  bool isWorking = false;
  String result = '';
  late CameraController cameraController;
  late CameraImage cameraImage;

  initCamera() async {
    cameraController = CameraController(cameras[0], ResolutionPreset.medium);
    cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }

      setState(() {
        cameraController.startImageStream((image) {
          if (!isWorking) {
            isWorking = true;
            cameraImage = image;
          }
        });
      });
    });
  }

  @override
  void initState() {
    initCamera();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:
              (result == '') ? const Text('Enfoque el vehiculo') : Text(result),
        ),
        body: Container(
          alignment: Alignment.center,
          child: CameraPreview(cameraController),
        ),
      ),
    );
  }
}
