import 'package:earn_by_return/modules/qr_code/gain_reward_screen.dart';
import 'package:earn_by_return/shared/component/component/components.dart';
import 'package:earn_by_return/shared/styles/colorsEarn.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../shared/component/component/constants.dart';
import '../../shared/network/end_points.dart';
import '../../shared/network/remote/dio_helper.dart';

enum QRScanState { initial, scanning, success, failure, loading, }

class QRScanCubit extends Cubit<QRScanState> {
  QRViewController? controller;
  Barcode? result;

  String? message;
  double? coins;
  double? money;

  QRScanCubit() : super(QRScanState.initial);

  void initController(QRViewController controller) {
    this.controller = controller;
    emit(QRScanState.scanning);
    controller.scannedDataStream.listen((scanData) {

      result = scanData;
      controller.pauseCamera();
      emit(QRScanState.loading);
      controller.stopCamera();
      print(scanData.code.toString());
      DioHelper.postData(
              url: ADDGIFT,
              data: {
                'GiftCode': result?.code.toString(),
              },
              token: token)
          .then(
        (value) {

         print(value.data);
          coins = value.data['coins'];
          money = value.data['money'];
         controller.stopCamera();
          emit(QRScanState.success);
        },
      ).catchError((error) {
        // if(error.response.statusCode==401){
        //   emit(LoginErrorstate(error.toString(),));
        // }

        emit(QRScanState.failure);
        ShowToast(
            text: error.response.data["message"], state: ToastStates.ERROR);
      });
    });
  }

  @override
  Future<void> close() {
    controller?.dispose();
    return super.close();
  }
}

class QRViewExample extends StatelessWidget {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QRScanCubit(),
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: BlocConsumer<QRScanCubit, QRScanState>(
                listener: (context, state) {
                  if (state == QRScanState.success) {
                    navigateTo(context,
                        GainRewardScren(
                          coins: context.read<QRScanCubit>().coins,
                          money: context.read<QRScanCubit>().money,
                        ));
                  }
                },
                builder: (context, state) {
                   if (state == QRScanState.loading) {
                    return Center(
                      child: LoadingAnimationWidget.inkDrop(
                        size: 80,
                        color: defaultColor,
                      ),
                    );
                  }else{
                    return QRView(
                      key: qrKey,
                      onQRViewCreated: (controller) {
                        context.read<QRScanCubit>().initController(controller);
                      },
                      overlay: QrScannerOverlayShape(
                        borderColor: Colors.green,
                        borderRadius: 10,
                        borderLength: 30,
                        borderWidth: 10,
                        cutOutSize: 200,
                      ),
                    );
                  }
                },

                // builder: (context, state) {
                //   return state == QRScanState.initial
                //       ?  QRView(
                //           key: qrKey,
                //           onQRViewCreated: (controller) {
                //             context
                //                 .read<QRScanCubit>()
                //                 .initController(controller);
                //           },
                //           overlay: QrScannerOverlayShape(
                //               borderColor: Colors.green,
                //               borderRadius: 10,
                //               borderLength: 30,
                //               borderWidth: 10,
                //               cutOutSize: 200),
                //         )
                //       : QRView(
                //           key: qrKey,
                //           onQRViewCreated: (controller) {
                //             context
                //                 .read<QRScanCubit>()
                //                 .initController(controller);
                //           },
                //           overlay: QrScannerOverlayShape(
                //               borderColor: Colors.green,
                //               borderRadius: 10,
                //               borderLength: 30,
                //               borderWidth: 10,
                //               cutOutSize: 200),
                //         );
                //
                //   //     :  Center(
                //   //     child: LoadingAnimationWidget.inkDrop(
                //   //
                //   // size: 200, color:defaultColor,
                //   // ));
                // },

              ),
            ),
          ],
        ),
      ),
    );
  }
}
