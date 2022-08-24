import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:src_core_bloc/features/extras/qr_code/qr_code_event.dart';
import '../../../core/base/base_state.dart';

class QRCodeBloc extends Bloc<QRCodeEvent, BaseState> {
  Barcode? res;
  XFile? imgCap;
  late QRViewController _controller;
  ImagePicker picker = ImagePicker();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  QRCodeBloc() : super(const InitialState()) {
    on<OnSetQRView>((event, emit) {
      emit(DataLoadingState());
      onQRViewCreated(event.controller);
      emit(const DataLoadedState());
    });
    init();
  }

  void init() {
    log('QRCodeBloc init');
  }

  void directCamera(){
    if(Platform.isAndroid) {
      _controller.pauseCamera();
    }
    _controller.resumeCamera();
  }

  void disposeCamera() {
    _controller.dispose();
  }

   void onQRViewCreated (QRViewController controller) {
    _controller = controller;
    _controller.scannedDataStream.listen((scanData) {
      res = scanData;
    });
  }

  catchImage() async {
    var imgCap = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 680.0,
      maxWidth: 970.0,
    ).then((XFile? recordedImage) {
      if (recordedImage != null) {
        GallerySaver.saveImage(recordedImage.path);
      }
    });

    imgCap = imgCap;
  }
}
