import 'package:equatable/equatable.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

abstract class QRCodeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class OnSetQRView extends QRCodeEvent {
  OnSetQRView(this.controller);
  final QRViewController controller;
  @override
  String toString() => 'OnSetQRView';
}
