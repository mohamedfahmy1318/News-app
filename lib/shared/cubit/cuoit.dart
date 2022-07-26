// ignore_for_file: avoid_print

import 'package:my_app/screens/entertainment.dart';
import 'package:my_app/screens/health.dart';
import 'package:my_app/screens/technology.dart';

import 'package:my_app/screens/business.dart';
import 'package:my_app/screens/science.dart';
import 'package:my_app/screens/sport.dart';
import 'package:my_app/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/netWork/dio_helper.dart';
import 'package:my_app/shared/components/shared_preferences.dart';
//https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=175d092819df4b5883da782634fcd12f
//c806ed6527df4f2aadc50d564e6923d4
//175d092819df4b5883da782634fcd12f
class AppCupit extends Cubit<AppState>{
  AppCupit():super(IntiAppState());
  
  static AppCupit get(contixt)=>BlocProvider.of(contixt);
  var screens=[const Bus(),const Sport(),const Science(),const Tec(),const Hel(),const Ent()];
  List drawerData=[
    ["Business","الاعمال",Icons.business],
    ["Sports","الرياضه",Icons.sports],
    ["Science","العلوم",Icons.science],
    ["Technology","التكنولجيا",Icons.engineering],
    ["Health","الصحه",Icons.toll_outlined],
    ["Entertainment","الترفيه",Icons.face],
  ];
  
  
  var moodl=(CachHelper.getMood(key: "mood")==null)?true:CachHelper.getMood(key: "mood");
  void changMood(value){
     moodl=value;
     CachHelper.setMood(key: "mood", value: moodl).then((value) {emit(Mood());});
     print('l mood is $isEnglish');
  }

  var isEnglish=(CachHelper.getLan(key:"lan")==null)?true:CachHelper.getLan(key: "lan");
  void changLang(value){
     isEnglish=value;
     CachHelper.setLan(key: "lan", value: isEnglish).then((value) {emit(ChangLange());});
     print('english is $isEnglish');
  }

  Color mainColor=(CachHelper.getColor(key: "color")==null)?Colors.orange:Color(CachHelper.getColor(key:"color"));
  void changeMainColor(color){
     mainColor=color;
     CachHelper.setColor(key:"color",colorValue:mainColor.value).then((value) {
       emit(ChangColor());
     });
     print('main color is ${mainColor.toString()}');
  }

  var index =0;
  void changIndx(value){
    index=value;
    emit(ChangBottomBarIndix());
    if(value==1) getSpo();
    if(value==2) getSc();
    if(value==3) getTec();
    if(value==4) getHel();
    if(value==5) getEnt();    
  }
  
  List<dynamic> busn=[];
  void getBusn(){
    emit(GetBusLodinState());
    DioHelper.getData(
    url: 'v2/top-headlines',
    q_p: {
      'country':'eg',
      'category':'business',
      'apiKey':'c806ed6527df4f2aadc50d564e6923d4',
    }).then((value) {
       print('title is ${value.data['articles'][0]['title']}');
      busn=value.data['articles'];
      emit(GetBusSuccSTate());
    }).catchError((onError){
      print('the erorr is ${onError.toString()}');
       emit(GetBusErorrState(onError.toString()));
    });
  }

  List<dynamic> spo=[];
  void getSpo(){
    emit(GetSpoLodinState());
    if(spo.isEmpty){
      DioHelper.getData(
          url: 'v2/top-headlines',
          q_p: {
            'country':'eg',
            'category':'sports',
            'apiKey':'c806ed6527df4f2aadc50d564e6923d4',
          }).then((value) {
           print('title is ${value.data['articles'][0]['title']}');
            spo=value.data['articles'];
            emit(GetSpoSuccSTate());
          }).catchError((onError){
            print('the erorr is ${onError.toString()}');
            emit(GetSpoErorrState(onError.toString()));
          });
    }else{
     emit(GetSpoSuccSTate());
    } 
  }

  List<dynamic> sc=[];
  void getSc(){
    emit(GetScLodinState());
    if(sc.isEmpty){
      DioHelper.getData(
          url: 'v2/top-headlines',
          q_p: {
            'country':'eg',
            'category':'science',
            'apiKey':'c806ed6527df4f2aadc50d564e6923d4',
          }).then((value) {
            print('title is ${value.data['articles'][0]['title']}');
            sc=value.data['articles'];
            emit(GetScSuccSTate());
          }).catchError((onError){
            print('the erorr is ${onError.toString()}');
            emit(GetScErorrState(onError.toString()));
          });
    }else{
      emit(GetScSuccSTate());
    }
  }

  List<dynamic> ent=[];
  void getEnt(){
    emit(GetENLodinState());
    if(ent.isEmpty){
      DioHelper.getData(
          url: 'v2/top-headlines',
          q_p: {
            'country':'eg',
            'category':'entertainment',
            'apiKey':'c806ed6527df4f2aadc50d564e6923d4',
          }).then((value) {
           print('title is ${value.data['articles'][0]['title']}');
            ent=value.data['articles'];
            emit(GetENSuccSTate());
          }).catchError((onError){
            print('the erorr is ${onError.toString()}');
            emit(GetENErorrState(onError.toString()));
          });
    }else{
     emit(GetENSuccSTate());
    } 
  }

  List<dynamic> hel=[];
  void getHel(){
    emit(GetHeLodinState());
    if(hel.isEmpty){
      DioHelper.getData(
          url: 'v2/top-headlines',
          q_p: {
            'country':'eg',
            'category':'health',
            'apiKey':'c806ed6527df4f2aadc50d564e6923d4',
          }).then((value) {
           print('title is ${value.data['articles'][0]['title']}');
            hel=value.data['articles'];
            emit(GetHeSuccSTate());
          }).catchError((onError){
            print('the erorr is ${onError.toString()}');
            emit(GetHeErorrState(onError.toString()));
          });
    }else{
     emit(GetHeSuccSTate());
    } 
  }
  
  List<dynamic> tec=[];
  void getTec(){
    emit(GetTECLodinState());
    if(tec.isEmpty){
      DioHelper.getData(
          url: 'v2/top-headlines',
          q_p: {
            'country':'eg',
            'category':'technology',
            'apiKey':'c806ed6527df4f2aadc50d564e6923d4',
          }).then((value) {
           print('title is ${value.data['articles'][0]['title']}');
            tec=value.data['articles'];
            emit(GetTECSuccSTate());
          }).catchError((onError){
            print('the erorr is ${onError.toString()}');
            emit(GetTECErorrState(onError.toString()));
          });
    }else{
     emit(GetSpoSuccSTate());
    } 
  }
  
  List<dynamic> search=[];
  void getSearch(valueToFind){
      emit(GetSrLodinState());
      search=[];
      DioHelper.getData(
      url: 'v2/everything',
      q_p: {
        'q':'$valueToFind',
        'apiKey':'c806ed6527df4f2aadc50d564e6923d4',
      }).then((value) {
        search=value.data['articles'];
        emit(GetSrSuccSTate());
      }).catchError((onError){
        print('the erorr is ${onError.toString()}');
        emit(GetSrErorrState(onError.toString()));
      });
    }
}