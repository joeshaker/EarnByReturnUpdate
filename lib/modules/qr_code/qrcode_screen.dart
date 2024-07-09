import 'package:earn_by_return/modules/bottomnavbar/bottomnav.dart';
import 'package:earn_by_return/modules/qr_code/gain_reward_screen.dart';
import 'package:earn_by_return/shared/component/component/components.dart';
import 'package:earn_by_return/shared/styles/colorsEarn.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../shared/component/component/constants.dart';
import '../../shared/network/end_points.dart';
import '../../shared/network/local/cache_helper.dart';
import '../../shared/network/remote/dio_helper.dart';

enum QRScanState { initial, scanning, success, failure, loading, }

class QRScanCubit extends Cubit<QRScanState> {
  QRViewController? controller;
  Barcode? result;

  String? message;
  dynamic? coins;
  dynamic? money;

  QRScanCubit() : super(QRScanState.initial);

  void initController(QRViewController controller) {
    this.controller = controller;
    emit(QRScanState.scanning);
    controller.scannedDataStream.listen((scanData) {
      result = scanData;
      controller.pauseCamera();
      emit(QRScanState.loading);
      controller.pauseCamera();
      print(scanData.code.toString());
      print("loooookkkkkk outside response");

      String? token = CacheHelper.getData(key: "token");
      DioHelper.postData(
        url: ADDGIFT,
        data: {
          'GiftCode': result?.code.toString(),
        },
        token: token,
      ).then((value) {
        print(value.data);
        print("loooookkkkkk hereeeeeeeeeeeee");

        print(value.data['coins']);
        coins = value.data['coins'];
        money = value.data['money'];
        print(value.statusCode);
        emit(QRScanState.success);
        if (value.statusCode==200) {
          print("loooookkkkkk henaaaaaaaa");
          print(value.statusCode);
          emit(QRScanState.success);
        }
        else {
          emit(QRScanState.failure);
          ShowToast(text: value.data['message'], state: ToastStates.ERROR);

        }

      }).catchError((error) {
        controller.dispose();
        String errorMessage = "An error occurred";
        print(error);
        emit(QRScanState.failure);
        ShowToast(text: errorMessage, state: ToastStates.ERROR);
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
                    navigateAndFinish(context,
                        GainRewardScren(
                          coins: context.read<QRScanCubit>().coins??0.0,
                          money: context.read<QRScanCubit>().money??0.0,
                        ));
                  }
                  if (state == QRScanState.failure) {

                    navigateAndFinish(context,
                        Bottonav());
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
