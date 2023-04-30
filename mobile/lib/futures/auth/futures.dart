import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';
import 'package:new_one_v1/constants/urls.dart';
import 'package:new_one_v1/data/main_data.dart';
import 'package:new_one_v1/main.dart';
import 'package:new_one_v1/models/user_model.dart';

class AuthFutures {
  final dio = Dio();
  MainData? mainData;
  void init() {
    mainData = getIt<MainData>(instanceName: 'mainData');
  }

  Future singUp(UserModel user) async {
    final model = UserModel.toMap(user);
    model['password2'] = user.password;
    final data = await dio.post('$mainUrl$singUpUrl',
        data: UserModel.toMap(user),
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }));
  }

  Future getLocation() async {
    final location = mainData!.location;
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    log(_serviceEnabled.toString());
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _locationData = await location.getLocation().then(
      (value) {
        log('message');
        return value;
      },
    );
  }

  Future sentSos(BuildContext context) async {
    bool sent = true;
    bool pop = true;
    final seconds = ValueNotifier<int>(5);
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      enableDrag: false,
      builder: (context) {
        return ValueListenableBuilder(
          valueListenable: seconds,
          builder: (context, value, child) {
            return Container(
              height: 60.h,
              color: Colors.transparent,
              margin: EdgeInsets.only(bottom: 76.h),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                  horizontal: 25.w,
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'SOS sent',
                        style: GoogleFonts.urbanist(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              sent = false;
                              pop = false;
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Cancle',
                              style: GoogleFonts.urbanist(
                                decorationThickness: 2.sp,
                                fontSize: 23.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            width: 65.w,
                            height: 2.5.h,
                            color: Colors.white,
                          )
                        ],
                      )
                    ]),
              ),
            );
          },
        );
      },
    );
    for (int i = 0; i < 5; i++) {
      await Future.delayed(const Duration(seconds: 1), () {
        seconds.value--;
      });
    }
    if (sent && pop) {
      Navigator.pop(context);
    }
    // final location = await mainData!.location.getLocation();
    // final model = {
    //   'user_id': mainData!.theUser!.id,
    //   'location': '${location.longitude},${location.latitude}',
    //   'date': DateTime.now().toString(),
    // };

    // final data = dio.post('path');
  }
}
