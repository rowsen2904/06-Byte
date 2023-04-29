import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_one_v1/configs/my_scroll_behavior.dart';
import 'package:get_it/get_it.dart';

void main() {
  runApp(const MyApp());
}

GetIt getIt = GetIt.instance;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (context, child) => MaterialApp(
        builder: (context, child) =>
            ScrollConfiguration(behavior: MyBehavior(), child: child!),
        debugShowCheckedModeBanner: false,
        home: const TestScreen(),
      ),
    );
  }
}

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final dio = Dio();
  void listen() async {
    final user = {
      // 'username': 'luxx_',
      'first_name': 'Rowsen',
      'last_name': 'Meredow',
      'password': '11111111',
      'password2': '11111111',
    };

    final data = await dio.post(
      '',
      data: user,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    log('${data.data} datdaaa');
    log('${data.statusCode} datdaaa');
    log('${data.statusMessage} ressponse');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                listen();
              },
              child: Text(
                'soem',
              ),
            )
          ],
        ),
      ),
    );
  }
}
