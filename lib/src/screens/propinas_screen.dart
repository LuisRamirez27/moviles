import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PropinasScreen extends StatefulWidget {
  PropinasScreen({Key? key}) : super(key: key);

  @override
  _PropinasScreenState createState() => _PropinasScreenState();
}

class _PropinasScreenState extends State<PropinasScreen> {
  TextEditingController _txtConsumo = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calculadora de propinas'),
        ),
        body: ListView(
          padding: EdgeInsets.only(
            top: 20.0,
            right: 10,
          ),
          children: [
            TextField(
              controller: _txtConsumo,
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
                signed: false,
              ),
              decoration: InputDecoration(
                  icon: Icon(Icons.attach_money),
                  hintText: "Monto a pagar",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
            ),
            ElevatedButton(
              onPressed: () {
                try {
                  var monto = double.parse(_txtConsumo.text);
                  var propina = monto * 0.15;
                  var total = monto + propina;
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Total a pagar"),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: [
                              Text('Propina: ${propina}'),
                              Text("Total mas propina: ${total}")
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("OK"))
                        ],
                      );
                    },
                  );
                } catch (e) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Error!!!"),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: [
                              Text(
                                  'El dato que esta intentandoi ingresar no es un numero'),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("OK"))
                        ],
                      );
                    },
                  );
                }
              },
              child: Text(
                "Total a pagar",
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ));
  }
}
