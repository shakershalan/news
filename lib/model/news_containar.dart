import 'package:flutter/material.dart';
import 'package:untitled5/api/api_manager.dart';
import 'package:untitled5/category/tap_item.dart';
import 'package:untitled5/model/newsResponse.dart';
import 'package:untitled5/my_theme.dart';

import '../model/SourceResponse.dart';

class TapContainer extends StatelessWidget {
   Source source;
  TapContainer({required this.source,});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
      future: ApiManager.getNewsBySourceId(source.id??""),
        builder:(context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return  Center(
              child: CircularProgressIndicator(
                color: MyTheme.greenColor,
              ),
            );
          }
          else if(snapshot.hasError){
            return Column(
              children: [
                Text("Something went wrong"),
              ElevatedButton(
                onPressed: (){},
                child: Text("Try Again"),
              )
              ],
            );
          }
          if(snapshot.data!.status !="ok"){
            return Column(
              children: [
                Text(snapshot.data!.massage??""),
                ElevatedButton(
                  onPressed: (){},
                  child: Text("Try Again"),
                )
              ],
            );
          }
          var newList = snapshot.data?.articles??"";
          return



        },
    );
  }
}
