import 'package:flutter/material.dart';
import 'package:practica2/src/models/popular_movies_model.dart';
import 'package:practica2/src/network/api_popular.dart';
import 'package:practica2/src/views/card_pupular.dart';

class PopularScreen extends StatefulWidget {
  PopularScreen({Key? key}) : super(key: key);

  @override
  _PopularScreenState createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  ApiPopular? apiPopular;
  @override
  void initState() {
    super.initState();
    apiPopular = ApiPopular();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Peliculas mas populares"),
      ),
      body: FutureBuilder(
        future: apiPopular!.getAllPopular(),
        builder: (BuildContext context,
            AsyncSnapshot<List<PopularMoviesModel>?> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Ocurrio un error en la peticion"),
            );
          } else {
            if (snapshot.connectionState == ConnectionState.done) {
              return _listPopularMovies(snapshot.data);
            } else {
              return CircularProgressIndicator();
            }
          }
        },
      ),
    );
  }

  Widget _listPopularMovies(List<PopularMoviesModel>? movies) {
    return ListView.separated(
        itemBuilder: (context, index) {
          PopularMoviesModel popular = movies![index];
          //representa un widget personalizado que crearemos en otro archivo
          return CardPopularView(popular: popular);
        },
        separatorBuilder: (_, __) => Divider(
              height: 10,
            ),
        itemCount: movies!.length);
  }
}
