
// ignore_for_file: file_names


import 'dart:async';

import 'package:my_app/screens/dr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/screens/search.dart';
import 'package:my_app/shared/components/componant.dart';
import 'package:my_app/shared/cubit/cuoit.dart';
import 'package:my_app/shared/cubit/states.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      navigatorTo(context, const MyHomePage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 100,
              width: 200,
              child: Image.asset(
                'assets/photos/5.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCupit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCupit cupit = AppCupit.get(context);
        return Directionality(
          textDirection:
              (cupit.isEnglish) ? TextDirection.ltr : TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              title: (cupit.isEnglish)
                  ? Text("${cupit.drawerData[cupit.index][0]} News")
                  : Text("اخبار ${cupit.drawerData[cupit.index][1]}"),
              actions: [
                IconButton(
                    onPressed: () {
                      navigatorTo(context, const Search());
                    },
                    icon: const Icon(Icons.search)),
                IconButton(
                    onPressed: () {
                      cupit.changMood(!cupit.moodl);
                    },
                    icon: const Icon(Icons.brightness_4_outlined)),
              ],
            ),
            body: cupit.screens[cupit.index],
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.refresh),
              onPressed: () {
                if (cupit.index == 0) {
                  cupit.busn = [];
                  cupit.getBusn();
                } else if (cupit.index == 1) {
                  cupit.spo = [];
                  cupit.getSpo();
                } else if (cupit.index == 2) {
                  cupit.sc = [];
                  cupit.getSc();
                } else if (cupit.index == 3) {
                  cupit.tec = [];
                  cupit.getTec();
                } else if (cupit.index == 4) {
                  cupit.hel = [];
                  cupit.getHel();
                } else if (cupit.index == 5) {
                  cupit.ent = [];
                  cupit.getEnt();
                }
                Future.delayed(const Duration(seconds: 1)).then(
                  (value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: cupit.mainColor,
                        content: Text(
                          !(cupit.isEnglish)
                              ? "تم تحديث الاخبار بنجاح"
                              : "The News Has Been Updated Successfully",
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            drawer: const MyDrawer(),
          ),
        );
      },
    );
  }
}
