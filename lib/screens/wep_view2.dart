import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/shared/cubit/cuoit.dart';
import 'package:my_app/shared/cubit/states.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView2 extends StatelessWidget {
  final String url;

  const WebView2({Key? key, required this.url}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCupit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Directionality(
          textDirection: (AppCupit.get(context).isEnglish)
              ? TextDirection.ltr
              : TextDirection.rtl,
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                iconTheme: const IconThemeData(color: Colors.black),
              ),
              body: WebView(
                initialUrl: url,
              )),
        );
      },
    );
  }
}
