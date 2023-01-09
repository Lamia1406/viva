import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class ProjectPage extends StatefulWidget {
  var i = 0;
  ProjectPage({required this.i});
  @override
  State<ProjectPage> createState() => _ProjectPageState(i);
}

class _ProjectPageState extends State<ProjectPage> {
  var i= 0;
  _ProjectPageState(this.i);
  @override
  Widget build(BuildContext context) {
    CollectionReference projectref=FirebaseFirestore.instance.collection('projects');
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xff120D3A),
          toolbarHeight: 71,
          title: Text('Project Details',style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontFamily: 'MontaguSlab',
              fontWeight: FontWeight.w200
          ),),
        ),
        body:FutureBuilder(
          future: projectref.get(),
            builder: (context,snapshot){
              if(snapshot.hasData){
                return  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top:20),
                    child: Stack(
                        children:<Widget>[
                          Container(
                              height: double.infinity,
                              width: double.infinity,
                              alignment: Alignment.center,
                              child:Image(image:
                              AssetImage('ProjectBackground.png'),
                                fit: BoxFit.cover,
                              )
                          ),
                          Container(
                            alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children:[
                                  ProjectInfo(text:'Project Name:',text2: '${snapshot.data!.docs[i]['project name']}'),
                                  const SizedBox(height: 20),
                                  ProjectInfo(text:'Year:',text2: '${snapshot.data!.docs[i]['year']}'),
                                  const SizedBox(height: 20),
                                  ProjectInfo(text:"First Student's Name:",text2: '${snapshot.data!.docs[i]['students'][0]}'),
                                  const SizedBox(height: 20),
                                  ProjectInfo(text:"Second Student's Name:",text2: '${snapshot.data!.docs[i]['students'][1]}'),
                                  const SizedBox(height: 20),
                                 ProjectInfo(text:"Third Student's Name:",text2: '${snapshot.data!.docs[i]['students'][2]}'),
                                  const SizedBox(height: 20),
                                 ProjectInfo(text:"Supervisor's Name:",text2: '${snapshot.data!.docs[i]['superviser']}'),
                                  const SizedBox(height: 20),
                                  ProjectInfo(text:"President's Name:",text2: '${snapshot.data!.docs[i]['president']}'),
                                  const SizedBox(height:20),
                                 ProjectInfo(text:"Examinator's Name:",text2: '${snapshot.data!.docs[i]['examinator']}'),
                                  const SizedBox(height: 20),
                                  ProjectInfo(text:"Supervisor's Mark:",text2: '${snapshot.data!.docs[i]["superviser's mark"]}'),
                                  const SizedBox(height: 20),
                                 ProjectInfo(text:"President's Mark:",text2: '${snapshot.data!.docs[i]["president's mark"]}'),
                                  const SizedBox(height:20),
                                  ProjectInfo(text:"Examinator's Mark:",text2: '${snapshot.data!.docs[i]["examinator's mark"]}'),
                                  const SizedBox(height:20),
                                  ProjectInfo(text:"Final Mark:",text2: '${snapshot.data!.docs[i]["final mark"]}'),
                                ],
                              )
                          ),
                        ]));
              }
              else {
                return Text('Loading');
              }
            },
        ) );
  }

  Widget ProjectInfo({required text,required text2}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'MontaguSlab',
              fontWeight: FontWeight.w400
          ),
        )
        ,Text(text2,style: TextStyle(
            color: Color(0xFF6F2DBD),
            fontSize: 13,
            fontFamily: 'MontaguSlab',
            fontWeight: FontWeight.w200
        ))
      ],
    );
  }
}
