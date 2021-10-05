import 'package:flutter/material.dart';
import 'package:practica2/src/database/database_user.dart';
import 'package:practica2/src/models/user_model.dart';
import 'package:practica2/src/screens/edit_user_screen.dart';
import 'package:practica2/src/utils/color_settings.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  late DatabaseUser _databaseUser;
  @override
  void initState() {
    _databaseUser = DatabaseUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DASHBOARD'),
        backgroundColor: ColorSettings.colorPrimary,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            FutureBuilder(
              future: _databaseUser.getUser(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<userModel>> snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Ocurrio un error en la peticion"),
                  );
                } else {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return _User(snapshot.data!);
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }
              },
            ),
            ListTile(
              title: Text('Opcion 1'),
              subtitle: Text('Descripcion corta'),
              leading: Icon(Icons.monetization_on_outlined),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/opc1');
              },
            ),
            ListTile(
              title: Text('Intenciones'),
              subtitle: Text('Intenciones implicitas'),
              leading: Icon(Icons.phone_android),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/intenciones');
              },
            ),
            ListTile(
              title: Text('Notas'),
              subtitle: Text('CRUD notas'),
              leading: Icon(Icons.note),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/notas');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _User(List<userModel> users) {
    userModel user = users[0];
    String nombre =
        user.nombre! + ' ' + user.apellidoP! + ' ' + user.apellidoM!;
    //String? imagen = user.avatar!;
    return UserAccountsDrawerHeader(
      accountName: Row(
        children: [
          Text(nombre),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => editUserScreen(
                              user: user,
                            )));
              },
              icon: Icon(Icons.edit)),
        ],
      ),
      accountEmail: Text(user.email!),
      currentAccountPicture: CircleAvatar(
        child: user.avatar == null
            ? Image.network(
                'https://e7.pngegg.com/pngimages/799/460/png-clipart-computer-icons-avatar-user-profile-icon-design-avatar-heroes-monochrome.png')
            : Image.asset(user.avatar!),
        backgroundImage: NetworkImage(
            'https://e7.pngegg.com/pngimages/799/460/png-clipart-computer-icons-avatar-user-profile-icon-design-avatar-heroes-monochrome.png'),
      ),
      decoration: BoxDecoration(color: ColorSettings.colorPrimary),
    );
  }
}
