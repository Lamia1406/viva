
import 'drawer.dart';
import 'package:flutter/material.dart';
import 'package:viva_app/Pages/ProjectPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class ProjectsPage extends StatelessWidget {
    CollectionReference projectref=FirebaseFirestore.instance.collection('projects');
      
@override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          drawer: Sidebar(),
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Color(0xff120D3A),
            toolbarHeight: 71,
            title: Text('All Projects',style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontFamily: 'MontaguSlab',
                fontWeight: FontWeight.w200
            ),),
          ),
          body:Container(
            height:double.infinity,
            width:double.infinity,
            color: Color(0xFF0B298DC),
            child:FutureBuilder(
              future:projectref.get() ,
              builder: (context,snapshot){
                if(snapshot.hasData){
                    return  ListView.builder(
                      controller: ScrollController(keepScrollOffset: false),
                      itemCount:snapshot.data!.docs.length,
                      itemBuilder: (context,i){
                        return ProjectName(context,'${snapshot.data!.docs[i]['project name']}',i);
                      },
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                    );
                }
                else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),));
  }
  Widget ProjectName(context,String ProjectName,i){
    return Card(
        color:Color(0xffB298DC),
        elevation: 0.0,
        margin: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
            side: BorderSide(
                color: Color(0xff120D3A) ),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: TextButton(
            child: Row(
              mainAxisAlignment:MainAxisAlignment.spaceEvenly,
              children: [
                Image(image:AssetImage('projectIcon.png')),
                SizedBox(width: 10,),
                Text(
                  ProjectName,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white
                  ),
                ),
                SizedBox(width: 10,),
                Image(image:AssetImage('3dotsVertical.png'))
              ],
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProjectPage(i:i)));
            },),
        )
    );}}





