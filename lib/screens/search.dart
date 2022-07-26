import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/shared/components/componant.dart';
import 'package:my_app/shared/cubit/cuoit.dart';
import 'package:my_app/shared/cubit/states.dart';

class Search extends StatelessWidget{
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCupit,AppState>(
      listener: (context,state){},
      builder: (context,state){
       var keyf = GlobalKey<FormState>();
       var searchC= TextEditingController() ;
       List mylist =AppCupit.get(context).search;
        return Directionality(
          textDirection: (AppCupit.get(context).isEnglish)? TextDirection.ltr:TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(),
            body: Column(
                children: [
                  Form(
                     key: keyf,
                     child: Padding(
                       padding: const EdgeInsets.all(20.0),
                       child: TextFormField( 
                        onFieldSubmitted: (value){
                          if(keyf.currentState!.validate()){
                            //print(value);
                            AppCupit.get(context).getSearch(value);
                          }  
                        },              
                        controller: searchC, keyboardType: TextInputType.text,
                        validator: (value){
                        if(value!.isEmpty) {
                          return (AppCupit.get(context).isEnglish)?"Fild must not be embty":"اكتب شيا للبحث";
                        } else {
                          return null;
                        }},
                        style: Theme.of(context).textTheme.bodyText1,
                        decoration: InputDecoration(
                          border:const OutlineInputBorder() ,
                          labelText: (AppCupit.get(context).isEnglish)?"Search":"بحث",
                          labelStyle: TextStyle(color: AppCupit.get(context).mainColor,fontWeight: FontWeight.bold,fontSize: 15) ,
                          prefixIcon:Icon(Icons.search,color:AppCupit.get(context).mainColor,size: 20,) ,
                          prefixStyle: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),

                        ),
                    ),
                     ),
                  ),
                Expanded(child:(state is GetSrLodinState) ?const Center(child: CircularProgressIndicator()):myList(mylist, context))
              ],),
            
          ),
        );
      },
    );
  }
}