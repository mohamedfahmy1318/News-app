import 'package:my_app/shared/components/componant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/shared/cubit/cuoit.dart';
import 'package:my_app/shared/cubit/states.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:hexcolor/hexcolor.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCupit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCupit cupit = AppCupit.get(context);

          List<DropdownMenuItem<String>> langs = [
            DropdownMenuItem(
                value: 'English',
                child: Text(
                  'English',
                  style: Theme.of(context).textTheme.bodyText1,
                )),
            DropdownMenuItem(
                value: 'عربي',
                child: Text(
                  'عربي',
                  style: Theme.of(context).textTheme.bodyText1,
                )),
          ];
          
          String selected = (cupit.isEnglish) ? 'English' : 'عربي';

          return Drawer(
            child: Container(
              color: cupit.moodl ? Colors.white : HexColor('333739'),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        top: 30,
                      ),
                      height: 70,
                      width: double.infinity,
                      color: AppCupit.get(context).mainColor,
                      child: Center(
                          child: Center(
                              child: Text(
                        cupit.isEnglish ? "News app" : "برنامج اخبار",
                        style: Theme.of(context).textTheme.bodyText1,
                      ))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, value) => InkWell(
                                onTap: () {
                                  cupit.changIndx(value);
                                  Navigator.pop(context);
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      cupit.drawerData[value][2],
                                      size: 25,
                                      color:
                                          AppCupit.get(context).mainColor,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      (cupit.isEnglish)
                                          ? cupit.drawerData[value][0]
                                          : cupit.drawerData[value][1],
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    )
                                  ],
                                ),
                              ),
                          separatorBuilder: (context, value) =>
                              const SizedBox(height: 20),
                          itemCount: cupit.drawerData.length),
                    ),
                    const SizedBox(height: 20),
                    slider(context),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: InkWell(
                        child: Text(
                          cupit.isEnglish
                              ? "Choose The Main Color"
                              : "اختر اللون الاساسي",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              backgroundColor: cupit.moodl
                                  ? Colors.white
                                  : HexColor('333739'),
                              content: MaterialColorPicker(
                                  onMainColorChange: (Color ?color) {
                                    cupit.changeMainColor(color);
                                  },
                                  selectedColor: cupit.mainColor),
                              actions: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 8, left: 8),
                                  child: TextButton(
                                    child: Text(
                                      cupit.isEnglish ? "Submet" : "موافق",
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            barrierDismissible: true,
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    slider(context),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        children: [
                          Text(
                            (cupit.isEnglish) ? 'language' : 'اللغه',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          DropdownButton<String>(
                            dropdownColor:
                                cupit.moodl ? Colors.white : HexColor('333739'),
                            items: langs,
                            onChanged: (value) {
                              if (value == selected) {
                              } else {
                                cupit.changLang(!cupit.isEnglish);
                              }
                            },
                            value: selected,
                            underline: Container(
                                height: 2,
                                color: AppCupit.get(context).mainColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}
