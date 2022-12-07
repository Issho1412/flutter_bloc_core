import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:src_core_bloc/core/base/base_state.dart';
import 'package:src_core_bloc/core/const.dart';
import 'package:src_core_bloc/features/extras/qr_code/qr_code_bloc.dart';
import 'package:src_core_bloc/widgets/custom_button.dart';

import '../../core/config/colors.dart';

class QRCodePage extends StatefulWidget {
  const QRCodePage({Key? key}) : super(key: key);

  @override
  State<QRCodePage> createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  final QRCodeBloc _qrCodeBloc = QRCodeBloc();

  @override
  void reassemble() {
    super.reassemble();
    _qrCodeBloc.directCamera();
  }

  @override
  void dispose() {
    super.dispose();
    _qrCodeBloc.disposeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<QRCodeBloc, BaseState>(
          bloc: _qrCodeBloc,
          builder: (context, _) => Center(
            child: Container(
              padding: const EdgeInsets.only(bottom: 30.0),
              color: Colors.black,
              child: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: QRView(
                      key: _qrCodeBloc.qrKey,
                      onQRViewCreated: _qrCodeBloc.onQRViewCreated,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        (_qrCodeBloc.res != null)
                          ? Center(
                            child: Text(
                            'Barcode Type: ${_qrCodeBloc.res?.format}\nData: ${_qrCodeBloc.res?.code}') )                   
                          : const Text('Scan a code'),
                      ]
                    ),
                  ),
                  Container(
                    color: AppColors.kPrimaryColor,
                    child: Row(
                      children: [
                        CustomButton(
                          bgColor: AppColors.kPrimaryColor,
                          text: sBtnSave, onTap: _qrCodeBloc.catchImage
                        ),
                      ],
                    )
                  )
                ],
              )
            ),
          )
        )
      )
    );
  }
}
