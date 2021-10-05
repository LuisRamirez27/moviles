import 'package:flutter/material.dart';
import 'package:practica2/src/screens/dashboard_screen.dart';
import 'package:practica2/src/utils/color_settings.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var isLoading = false;
  TextEditingController txtEmailCon = TextEditingController();
  TextEditingController txtPwdCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextFormField txtEmail = TextFormField(
      controller: txtEmailCon,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Introduce el email',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      ),
    );

    TextFormField txtpwd = TextFormField(
      controller: txtPwdCon,
      keyboardType: TextInputType.visiblePassword,
      maxLength: 10,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Introduce el password',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      ),
    );

    ElevatedButton btnLogin = ElevatedButton(
      style: ElevatedButton.styleFrom(primary: ColorSettings.colorButton),
      onPressed: () {
        print(txtEmailCon.text);
        isLoading = true;
        setState(() {});
        Future.delayed(Duration(seconds: 2), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DashBoardScreen()));
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.login),
          Text('Validar usuario'),
        ],
      ),
    );
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/fondo.jpeg'), fit: BoxFit.fill),
          ),
        ),
        //LayoutBuilder(
        //builder: (BuildContext context, BoxConstraints constraint) {
        //return SingleChildScrollView(
        //child:
        Card(
          margin: EdgeInsets.only(left: 15, right: 15, bottom: 20),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                txtEmail,
                SizedBox(
                  height: 10,
                ),
                txtpwd,
                btnLogin,
              ],
            ),
          ),
        ),
        //);
        //}),
        Positioned(
          child: Image.asset(
            'assets/itc.png',
            width: 150,
          ),
          top: 100,
        ),
        Positioned(
          child: isLoading == true ? CircularProgressIndicator() : Container(),
          top: 290,
        ),
      ],
    );
  }
}
