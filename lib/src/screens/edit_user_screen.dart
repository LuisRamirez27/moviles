import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practica2/src/database/database_user.dart';
import 'package:practica2/src/models/user_model.dart';
import 'package:practica2/src/utils/color_settings.dart';

class editUserScreen extends StatefulWidget {
  userModel? user;
  editUserScreen({Key? key, this.user}) : super(key: key);

  @override
  _editUserScreenState createState() => _editUserScreenState();
}

class _editUserScreenState extends State<editUserScreen> {
  late DatabaseUser _databaseUser;
  File? imagen;
  final picker = ImagePicker();
  TextEditingController _nombrecontroller = TextEditingController();
  TextEditingController _apellidoPcontroller = TextEditingController();
  TextEditingController _apellidoMcontroller = TextEditingController();
  TextEditingController _telefonocontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();

  @override
  void initState() {
    _databaseUser = DatabaseUser();
    if (widget.user != null) {
      _nombrecontroller.text = widget.user!.nombre!;
      _apellidoPcontroller.text = widget.user!.apellidoP!;
      _apellidoMcontroller.text = widget.user!.apellidoM!;
      _telefonocontroller.text = widget.user!.telefono!;
      _emailcontroller.text = widget.user!.email!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorSettings.colorPrimary,
        title: Text("Editar informacion del perfil"),
      ),
      body: _formularioUser(),
    );
  }

  Widget _formularioUser() {
    return ListView(
      children: [
        ListTile(
          onTap: () {
            _opciones(context);
          },
          tileColor: Colors.green,
          title: Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.transparent,
                  child: imagen == null
                      ? Image.asset('assets/itc.png')
                      : Image.file(imagen!),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    onPressed: () {
                      _opciones(context);
                    },
                    icon: Icon(
                      Icons.photo_camera,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        TextField(
          controller: _nombrecontroller,
          decoration: InputDecoration(labelText: "Nombre del usuario"),
        ),
        SizedBox(),
        TextField(
          controller: _apellidoPcontroller,
          decoration: InputDecoration(labelText: "Apellido paterno"),
        ),
        SizedBox(),
        TextField(
          controller: _apellidoMcontroller,
          decoration: InputDecoration(labelText: "Apellido Materno"),
        ),
        SizedBox(),
        TextField(
          controller: _telefonocontroller,
          decoration: InputDecoration(labelText: "Telefono"),
          keyboardType: TextInputType.phone,
        ),
        SizedBox(),
        TextField(
          controller: _emailcontroller,
          decoration: InputDecoration(labelText: "Email"),
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(),
        ElevatedButton(
            onPressed: () {
              userModel usuario = userModel(
                  id: widget.user!.id,
                  nombre: _nombrecontroller.text,
                  apellidoP: _apellidoPcontroller.text,
                  apellidoM: _apellidoMcontroller.text,
                  telefono: _telefonocontroller.text,
                  email: _emailcontroller.text,
                  avatar: 'assets/itc.png');
              _databaseUser.update(usuario.toMap()).then((value) {
                if (value > 0) {
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("La solicitud no se ha completado"),
                    ),
                  );
                }
              });
            },
            child: Text("Guardar Informacion"))
      ],
    );
  }

  _opciones(contexto) {
    showDialog(
      context: contexto,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: [
            TextButton(
              child: const Text('Camara'),
              onPressed: () {
                _opcion(1);
              },
            ),
            TextButton(
              child: const Text('Galeria'),
              onPressed: () {
                _opcion(2);
              },
            ),
          ],
          title: Text("Seleccione una opcion"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                    "Por favor selecicone una opcion para la caprura de la imagen")
              ],
            ),
          ),
        );
      },
    );
  }

  Future _opcion(opc) async {
    var pickedFile;
    if (opc == 1) {
      pickedFile = await picker.getImage(source: ImageSource.camera);
    } else {
      pickedFile = await picker.getImage(source: ImageSource.gallery);
    }
    setState(() {
      if (pickedFile != null) {
        imagen = File(pickedFile!.path);
      } else {
        print('No seleccionaste ninguna imagen');
      }
    });
    Navigator.of(context).pop();
  }
}
