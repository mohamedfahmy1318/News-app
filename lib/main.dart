import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'shared/cubit/cuoit.dart';
import 'netWork/dio_helper.dart';
import 'shared/components/shared_preferences.dart';
import 'shared/cubit/states.dart';
import 'screens/homePage.dart';
import 'shared/cubit/observer.dart';

void main() async {
  // للتاكد من جعل اخر حاجه هي ال رن اب
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.inti();
  await CachHelper.inti();
   BlocOverrides.runZoned(
    () {runApp(MyApp(app: AppCupit()..getBusn(),));},
    blocObserver: MyBlocObserver()
  );
}

class MyApp extends StatelessWidget {
  final AppCupit app;

  const MyApp({Key? key,required this.app}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCupit>(
      create: (context) => app,
      child: BlocConsumer<AppCupit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCupit cupit = AppCupit.get(context);
          return MaterialApp(
            theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(color: Colors.black, size: 20),
                  
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0,
                  titleSpacing: 20,
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  selectedItemColor: Colors.orange,
                  type: BottomNavigationBarType.fixed,
                  elevation: 30,
                  backgroundColor: Colors.white,
                ),
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                    backgroundColor:
                        cupit.mainColor),
                textTheme: const TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    bodyText2:  TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                iconTheme: const IconThemeData(color: Colors.black)),
            darkTheme: ThemeData(
                iconTheme: const IconThemeData(color: Colors.white),
                scaffoldBackgroundColor: HexColor('333739'),
                appBarTheme: AppBarTheme(

                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: HexColor('333739'),
                      statusBarIconBrightness: Brightness.light,
                    ),
                    backgroundColor: HexColor('333739'),
                    elevation: 0,
                    titleSpacing: 20,
                    titleTextStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                    iconTheme: const IconThemeData(color: Colors.white, size: 20)),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  selectedItemColor: Colors.orange,
                  unselectedItemColor: Colors.grey,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: HexColor('333739'),
                  elevation: 30,
                ),
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                    backgroundColor:
                        cupit.mainColor),
                textTheme: const TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    bodyText2:  TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white))),
            themeMode: cupit.moodl
                ? ThemeMode.light
                : ThemeMode.dark,
            debugShowCheckedModeBanner: false,
            home: Directionality(
              textDirection: (cupit.isEnglish)
                  ? TextDirection.ltr
                  : TextDirection.rtl,
              child: const SplashScreen(),
            ),
          );
        },
      ),
    );
  }
}