import 'package:flutter/material.dart';
import 'package:untitled5/api/api_manager.dart';
import 'package:untitled5/category/tap_continar.dart';
import 'package:untitled5/model/SourceResponse.dart';

class CategoryDeatils extends StatelessWidget {
  static const String routeName="category";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App",
            style: Theme
                .of(context)
                .textTheme
                .titleLarge),


      ),
      body: FutureBuilder<SourceResponse?>(
        future: ApiManager.getSources(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            );
          }
          else if(snapshot.hasError){
            return Column(
              children: [
                Text("something went wrong"),
                ElevatedButton(onPressed: (){}, child: Text("Try Agin"))
              ],
            );
          }
          if(snapshot.data?.status !="ok"){
            return Column(
              children: [
                Text(snapshot.data?.massage??""),
                ElevatedButton(onPressed: (){}, child: Text("Try Agin"))
              ],
            );
          }
          var sourceList = snapshot.data?.sources??[];
         return TapContainer(sourceList: sourceList,);
        },


      ),


    );

  }
}
