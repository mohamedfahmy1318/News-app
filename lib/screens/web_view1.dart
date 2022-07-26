import 'package:my_app/screens/wep_view2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/shared/components/componant.dart';
import 'package:my_app/shared/cubit/cuoit.dart';
import 'package:my_app/shared/cubit/states.dart';

class WebView1 extends StatelessWidget {
  final dynamic artical;
  const WebView1({Key? key, this.artical}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCupit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCupit cupit=AppCupit.get(context);
        return Directionality(
          textDirection: (AppCupit.get(context).isEnglish)
              ? TextDirection.ltr
              : TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView(scrollDirection: Axis.vertical, children: [
                SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: (artical['urlToImage'] == null || artical['urlToImage'] == "")
                      ? ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Hero(
                          tag: artical['title'],
                          child: Image.asset(
                          'assets/photos/6.png',
                          fit: BoxFit.contain,
                        ),
                        ),
                      )
                      : ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Hero(
                          tag: artical['title'],
                          child: Image.network(
                              artical['urlToImage'],
                              fit: BoxFit.cover,
                              loadingBuilder: (context, child,
                                  ImageChunkEvent ?loadingProgress) {
                                if (loadingProgress == null) return child;
                                return const Center(child: CircularProgressIndicator());
                              },
                            ),
                        ),
                      ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text("${artical['title']}",
                    style: Theme.of(context).textTheme.bodyText1),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    (AppCupit.get(context).isEnglish)
                        ? "information"
                        : "تفاصيل",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: cupit.mainColor),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  (artical['description'] == null ||
                      artical['description'] == "")
                  ? ((AppCupit.get(context).isEnglish))
                      ? "See The Description In Source"
                      : "شاهد التفاصيل في المصدر"
                  : "${artical['description']}",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(
                  height: 30,
                ),
               
                const SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  color: cupit.mainColor,
                  child: Text(
                    (AppCupit.get(context).isEnglish)
                        ? "Source"
                        : "المصدر",
                  ),
                  onPressed: () {
                    navigatorTo(context, WebView2(url: artical['url']));
                  },
                ),
              ]),
            ),
          ),
        );
      },
    );
  }
}
