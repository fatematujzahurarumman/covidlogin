import 'package:Covid19/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();
  Future<bool>  loginUser(String phone, BuildContext context) async{
    FirebaseAuth _auth= FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async{
          AuthResult result = await _auth.signInWithCredential(credential);

          FirebaseUser user= result.user;

          if (user != null){
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => HomePage() //HomePage(user: User) to take user to homepage
            ));
          }//this callback gets called when verification is done auto maticlly
          else{
            print("error");
          }
        },
        verificationFailed: (AuthException exception){
          print(exception);
        },
        codeSent: (String verificationId, [int forceResendingToken]){
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context){
                return AlertDialog(
                    title: Text('Enter the Code'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children:<Widget> [
                        TextField(
                          controller: _codeController,
                        )
                      ],
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child:Text('confirm'),
                        textColor: Colors.white,
                        color: Colors.blue,
                        onPressed: () async{
                          final code = _codeController.text.trim();
                          AuthCredential credential = PhoneAuthProvider.getCredential(verificationId: verificationId, smsCode: code);
                          AuthResult result = await _auth.signInWithCredential(credential);

                          FirebaseUser user = result.user;
                          if (user != null){
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => HomePage() //HomePage(user: User) to take user to homepage
                            ));
                          } //this callback gets called when verification is done auto maticlly
                          else{
                            print("error");
                          }
                        },

                      )
                    ]
                );
              }
          );
        },
        codeAutoRetrievalTimeout: null);
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text('Covid19 Around Us'),
        ),
        body: Container(
          padding: EdgeInsets.all(32),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Login',
                  style: TextStyle(fontSize: 32.0, color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16.0,),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'enter your NID:'
                  ),
                ),
                SizedBox(height: 16.0,),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'enter your phone number:'
                  ),
                  controller: _phoneController,
                ),
                SizedBox(height: 16.0,),
                Container(
                  width: double.infinity,
                  child: FlatButton(
                    child: Text('LogIn'),
                    textColor: Colors.white,
                    padding: EdgeInsets.all(20),
                    onPressed: (){
                      final phone = _phoneController.text.trim();

                      loginUser(phone, context);
                    },
                    color:Colors.blue,
                  ),
                )
              ],
            ),
          ),
        )
    );

  }

}