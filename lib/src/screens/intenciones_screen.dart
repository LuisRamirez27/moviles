import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:practica2/src/utils/color_settings.dart';
import 'package:url_launcher/url_launcher.dart';

class IntencionesScreen extends StatefulWidget {
  IntencionesScreen({
    Key? key,
  }) : super(key: key);

  @override
  _IntencionesScreenState createState() => _IntencionesScreenState();
}

class _IntencionesScreenState extends State<IntencionesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Intenciones Implicitas'),
          backgroundColor: ColorSettings.colorPrimary,
        ),
        body: ListView(
          children: [
            Card(
                elevation: 8.0,
                child: ListTile(
                  title: Text('Abrir pagina web'),
                  tileColor: Colors.greenAccent,
                  subtitle: Row(
                    children: [
                      Icon(Icons.touch_app_rounded),
                      Text('https://www.google.com'),
                    ],
                  ),
                  leading: Container(
                    height: 40.0,
                    padding: EdgeInsets.only(right: 10.0),
                    child: Icon(Icons.language, color: Colors.black),
                    decoration: BoxDecoration(
                        border: Border(right: BorderSide(width: 1.0))),
                  ),
                  trailing: Icon(Icons.chevron_right),
                  onTap: _abrirWeb,
                )),
            Card(
              elevation: 8.0,
              child: ListTile(
                title: Text('Llamada telefonica'),
                tileColor: Colors.greenAccent,
                subtitle: Row(
                  children: [
                    Icon(Icons.touch_app_rounded),
                    Text('Cel: 4613018645'),
                  ],
                ),
                leading: Container(
                  height: 40.0,
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(Icons.phone_android, color: Colors.black),
                  decoration: BoxDecoration(
                      border: Border(right: BorderSide(width: 1.0))),
                ),
                trailing: Icon(Icons.chevron_right),
                onTap: _llamadaTelefonica,
              ),
            ),
            Card(
              elevation: 8.0,
              child: ListTile(
                title: Text('Enviar SMS'),
                tileColor: Colors.greenAccent,
                subtitle: Row(
                  children: [
                    Icon(Icons.touch_app_rounded),
                    Text('Cel: 4613018645'),
                  ],
                ),
                leading: Container(
                  height: 40.0,
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(Icons.sms_sharp, color: Colors.black),
                  decoration: BoxDecoration(
                      border: Border(right: BorderSide(width: 1.0))),
                ),
                trailing: Icon(Icons.chevron_right),
                onTap: _enviarEmail,
              ),
            ),
            Card(
              elevation: 8.0,
              child: ListTile(
                title: Text('Enviar emial'),
                tileColor: Colors.greenAccent,
                subtitle: Row(
                  children: [
                    Icon(Icons.touch_app_rounded),
                    Text('To: ramirez@gmail.com'),
                  ],
                ),
                leading: Container(
                  height: 40.0,
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(Icons.email_outlined, color: Colors.black),
                  decoration: BoxDecoration(
                      border: Border(right: BorderSide(width: 1.0))),
                ),
                trailing: Icon(Icons.chevron_right),
              ),
            ),
            Card(
              elevation: 8.0,
              child: ListTile(
                onTap: _tomarFoto,
                title: Text('Tomar foto'),
                tileColor: Colors.greenAccent,
                subtitle: Row(
                  children: [
                    Icon(Icons.touch_app_rounded),
                    Text('Sonrie :)'),
                  ],
                ),
                leading: Container(
                  height: 40.0,
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(Icons.camera_alt_outlined, color: Colors.black),
                  decoration: BoxDecoration(
                      border: Border(right: BorderSide(width: 1.0))),
                ),
                trailing: Icon(Icons.chevron_right),
              ),
            ),
          ],
        ));
  }

  _abrirWeb() async {
    const url = 'https://sii.itcelaya.edu.mx/';
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  _llamadaTelefonica() async {
    const url = 'tel:4513018645';
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  _enviarEmail() {}
  _enviarSMS() {}
  Future _tomarFoto() async {
    File imagen;
    final picker = ImagePicker();
    var pickedFile = await picker.getImage(source: ImageSource.gallery);
    imagen = File(pickedFile!.path);
  }
}
