import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../resources/resources.dart';

class ImagePickerDialog{

  static void imagePickerDialog({required BuildContext context,required double myHeight,required double myWidth,required Function(File) setFile}){
    showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
                content: Container(
                  height: myHeight/4,
                  width: myWidth,
                  child: Column(
                    children: [
                      Text('Select Image Source',style: TextStyle(fontSize: (myHeight/4)/10,fontWeight: FontWeight.bold,fontFamily: 'segoe'),),
                      Padding(padding: EdgeInsets.only(left: myWidth/10,right: myWidth/10),child: Divider(thickness: 2,),),
                      SizedBox(height: (myHeight/4)/8,),
                      InkWell(
                        onTap: (){
                          pickImageCamera(context,(file)=> setFile(file));
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: (myHeight/4)/4,
                          width: myWidth/1.5,
                          decoration: BoxDecoration(color: R.colors.theme,
                              boxShadow: [BoxShadow(offset: Offset(0,3), color: Colors.grey.withOpacity(0.4), blurRadius: 1,spreadRadius: 1)],
                              borderRadius: BorderRadius.all(Radius.circular(((myHeight/4)/4)/10))),
                          child: Center(child: Text('Camera',style: TextStyle(color: Colors.white,fontSize: ((myHeight/4)/4)/3,fontWeight: FontWeight.w600,fontFamily: 'segoe'),),),
                        ),
                      ),
                      SizedBox(height: (myHeight/4)/10,),
                      InkWell(
                        onTap: (){
                          pickImageGallery(context,(file)=>setFile(file));
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: (myHeight/4)/4,
                          width: myWidth/1.5,
                          decoration: BoxDecoration(color: R.colors.theme,
                              boxShadow: [BoxShadow(offset: Offset(0,3), color: Colors.grey.withOpacity(0.4), blurRadius: 1, spreadRadius: 1)],
                              borderRadius: BorderRadius.all(Radius.circular(((myHeight/4)/4)/10))),
                          child: Center(child: Text('Gallery',style: TextStyle(color: Colors.white,fontSize: ((myHeight/4)/4)/3,fontWeight: FontWeight.w600,fontFamily: 'segoe'),),),
                        ),
                      ),
                    ],
                  ),
                )
            )
    );
  }

  static void pickImageCamera(BuildContext context,Function(File) addFile)async{
    var image = await ImagePicker.platform.pickImage(source: ImageSource.camera);
    if(image != null){
      File file = File(image.path);
      addFile(file);
    }else{
      print('image is null');
    }

  }


  static void pickImageGallery(BuildContext context,Function(File) addFile)async{
    var image = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    if(image != null){
      File file = File(image.path);
      addFile(file);
    }else{
      print('image is null');
    }

  }




}

