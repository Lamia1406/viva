import 'package:flutter/material.dart';
import 'package:viva_app/Pages/home.dart';
import 'sign up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:viva_app/Pages/404.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final keys = GlobalKey<FormState>();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  Login(context) async {
    if (keys.currentState!.validate()) {
      keys.currentState!.save();
      try {
        final userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
            email: email.text.trim(),
            password: password.text.trim());
        final userX = userCredential.user;

        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Login successful')));
        return userCredential;
      }
      on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("this email does not exist")));
        }
        else if (e.code == 'wrong-password') {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("You've entered a wrong password")));
        }
      }
      catch (e) {
        print(e);
      }
    }
    else {
      print('not valid');
    }
  }

  ResetPassword(){
    User userX= FirebaseAuth.instance.currentUser!;
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDBE7F5),
      body: SafeArea(
        child: Container(
          child: Form(
            key: keys,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 1,
                itemBuilder: (BuildContext context, int x) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/login.png'),
                      ),

                      Text('Login',
                          style: TextStyle(
                              fontSize: 35,
                              fontFamily: 'MontaguSlab',
                              color: Color(0xFF3D3DDA),
                              fontWeight: FontWeight.w600)),
                      SizedBox(height: 10,),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 15),
                        child: Text(
                          'Email',
                          style: TextStyle(
                            fontFamily: 'MontaguSlab',
                            fontWeight: FontWeight.w300,
                            fontSize: 20,
                            color: Color(0xFF120D3A),
                          ),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 50,
                        child: TextFormField(
                          controller: email,
                          validator: (controller) {
                            if (controller!.isEmpty) {
                              return 'Please fill this field';
                            }
                            else if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@univ-constantine2.dz")
                                .hasMatch(controller.toString())) {
                              return 'invalid email, University email only!';
                            }
                            else {
                              return null;
                            }
                          },
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 18),
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.email, size: 17,),
                            border: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Color(0xFF120D3A), width: 2),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 15),
                        child: Text(
                          'Password',
                          style: TextStyle(
                            fontFamily: 'MontaguSlab',
                            fontWeight: FontWeight.w300,
                            fontSize: 20,
                            color: Color(0xFF120D3A),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 50,
                        child: TextFormField(
                          controller: password,
                          validator: (controller) {
                            if (controller!.isEmpty) {
                              return 'Please fill this field';
                            }
                            else {
                              return null;
                            }
                          },
                          obscureText: true,
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 18),
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.password),
                            border: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Color(0xFF120D3A), width: 2),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),

                      Container(
                        alignment: Alignment.bottomRight,
                        margin: EdgeInsets.only(right: 15),
                        child: TextButton(
                            onPressed:() async{
                              final response= await resetPasswordDialog(context,email);
                            }, child: Text(
                          'Forgot password?',
                          style: TextStyle(
                            fontFamily: 'MontaguSlab',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xFF120D3A),
                          ),
                        )),
                      ),

                      Container(
                        width: 200,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: GestureDetector(
                          onTap: () async {
                            UserCredential user = await Login(context);
                            if (user != null) {
                              Navigator.of(context).pushReplacementNamed('home');
                            }
                            else {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>notFound()));
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Login Failed')));
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 17, bottom: 17, left: 65, right: 65),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xFF3D3DDA),
                                  Color(0xFF120D3A),
                                ],
                              ),
                            ),
                            child: Text('Login',
                              style:
                              TextStyle(fontSize: 20,
                                  fontFamily: 'MontaguSlab',
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account? ", style: TextStyle(
                              fontFamily: 'MontaguSlab',
                              fontWeight: FontWeight.w200,
                              fontSize: 14,
                              color: Color(0xFF120D3A),
                            ),),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushReplacementNamed('sign up');
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontFamily: 'MontaguSlab',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 14,
                                  color: Color(0xFF120D3A),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
            ),
          ),
        ),
      ),
    );
  }
}
enum response {confirm,deny}
Future<response?> resetPasswordDialog(BuildContext context,TextEditingController email) async{
  return showDialog(context: context,
      builder: (BuildContext context){
        return AlertDialog(
            titlePadding: EdgeInsets.only(left:10,right:10,top: 25),
            insetPadding: EdgeInsets.all(25),
            shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            actionsAlignment:MainAxisAlignment.center,
            title: ListTile(
              title: Text('Forgot Your Password?',textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'MontaguSlab',
                ),),
              subtitle: Text("it's okay we got you!",textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF120D3A),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'MontaguSlab',
                  )),
            ),
            actions: [
              Column(
                children: [
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Color(0xFFFFC727),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          )
                      ),
                      onPressed: (){
                        FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('We sent you an email to reset your password! Now login with your new password')));
                        Navigator.of(context).pop(response.confirm);
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical:10,horizontal:15 ),
                          child: Text('Receive Email',
                            style: TextStyle(
                                fontFamily: 'MontaguSlab',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color(0xFF120D3A)
                            ),))),
                  SizedBox(height: 10,),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: Color(0xFFFFC727),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          )
                      ),
                      onPressed: (){
                        Navigator.of(context).pop(response.deny);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical:10,horizontal:15 ),
                        child: Text('Cancel', style: TextStyle(
                            fontFamily: 'MontaguSlab',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xFFFFC727)
                        ),),
                      )),
                  SizedBox(height: 10,),
                ],
              )
            ],
            contentPadding: EdgeInsets.only(right: 20,left: 20,top: 10,bottom: 10),
            content:Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('We can send you an Email to reset your password',textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF3D3DDA),
                      fontWeight: FontWeight.w500,
                      fontFamily: 'MontaguSlab',
                    )),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                  controller: email,
                )
              ],
            )
        );
      });


}