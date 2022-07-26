import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/shared/components/componant.dart';
import 'package:my_app/shared/cubit/cuoit.dart';
import 'package:my_app/shared/cubit/states.dart';

class Ent extends StatelessWidget {
  const Ent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCupit,AppState>(
      listener: (context,state){},
      builder: (context,state){
        List mylist =AppCupit.get(context).ent;
        if ((mylist.isEmpty)) {
          return const Center(child: CircularProgressIndicator(),);
        }else {
          return myList(mylist,context);
        }
      }
    );
  }
}