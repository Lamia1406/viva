import 'package:flutter/material.dart';
import 'editProfile.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Sidebar extends StatefulWidget {
  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    var userImg= 'assets/userimg.png';
    return Drawer(
          child: ListView(
            children: [
              Container(
                  color: Color(0xFF060A663CC),
                  height: 200,
                  padding: EdgeInsets.only(top: 60.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(radius: 40, backgroundImage:AssetImage(userImg),backgroundColor: Colors.transparent),
                      Text('User',
                        style: TextStyle(
                            color: Color(0xFF6F2DBD),
                            fontSize:20,
                            fontFamily: 'MontaguSlab',fontWeight: FontWeight.w400),
                      ),
                      Text(
                        '${FirebaseAuth.instance.currentUser!.email}',
                        style: TextStyle(
                            color: Color(0xFF6F2DBD),
                            fontFamily: 'Montaguslab',
                            fontWeight: FontWeight.w400,
                            fontSize:14),
                      ),
                    ],
                  )
              ),
              SizedBox(height: 16),
              ListTileWidget(context,Icons.account_box_outlined,'My Profile',(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile()));
              }),
              SizedBox(height: 16),
              ListTileWidget(context,Icons.home_outlined,'Home Page',(){
                Navigator.of(context).pushReplacementNamed('home');
              }),
              SizedBox(height: 16),
              ListTileWidget(context,Icons.list_outlined,'All Projects',(){
                Navigator.of(context).pushReplacementNamed('projects');
              }),
              SizedBox(height: 16),
              Divider(
                  color: Colors.grey[600]
              ),
              const SizedBox(height: 16),
              ListTileWidget(context,Icons.logout_outlined,'Log Out',()async{
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacementNamed('login');
              }),
              const SizedBox(height: 16),
              ListTileWidget(context,Icons.delete_forever_outlined,'Delete Account',()async{
                await FirebaseAuth.instance.currentUser!.delete();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Your account has been successfully deleted')));
                Navigator.of(context).pushReplacementNamed('login');


              }),
            ],
          ),
        );
      }

      }





ListTileWidget(BuildContext context,icon,text,action){
  return ListTile(
    leading: Icon(icon, color: Colors.black, size: 35),
    title: Text(text, style: TextStyle(color: Colors.black, fontSize:20)),
    onTap: action,
  );
}




