import 'package:flutter/material.dart';
import 'package:movieapp/src/models/movie_model.dart';
import 'package:movieapp/src/providers/peliculas_providers.dart';

class DataSearch extends SearchDelegate {
  String seleccion = '';
  final moviesProvider = new MoviesProvider();

  final movies = [
    'X men',
    'Aquaman',
    'Ironman',
    'Shazam',
    'Batman',
    'Capitan America',
  ];
  final recentMovies = [
    'Spiderman',
    'Thejoker',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // acciones para limpiar nuestro AppBar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // icono a la izquierda de AppBar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // crea los resultados que vamos a mostrar
    return Center(
      child: Text(seleccion),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // son las sugerencias al ir escribiendo

    if (query.isEmpty) {
      return Container();
    }

    return FutureBuilder(
      future: moviesProvider.buscarPelicula(query),
      builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
        if (snapshot.hasData) {
          final movies = snapshot.data;
          return ListView(
              children: movies.map((movie) {
            return ListTile(
                leading: FadeInImage(
                  image: NetworkImage(movie.getPosterImg()),
                  placeholder: AssetImage('assets/no-image.jpg'),
                  width: 50.0,
                  fit: BoxFit.cover,
                ),
                title: Text(movie.title),
                subtitle: Text(movie.originalTitle),
                onTap: () {
                  close(context, null);
                  movie.uniqueId = '';
                  Navigator.pushNamed(context, 'detalle', arguments: movie);
                });
          }).toList());
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

//  final listaSugerida = (query.isEmpty)
//         ? recentMovies
//         : movies
//             .where((p) => p.toLowerCase().startsWith(query.toLowerCase()))
//             .toList();

//     return ListView.builder(
//       itemCount: listaSugerida.length,
//       itemBuilder: (context, i) {
//         return ListTile(
//           leading: Icon(Icons.movie),
//           title: Text(listaSugerida[i]),
//           onTap: () {
//             seleccion = listaSugerida[i];
//             showResults(context);
//           },
//         );
//       },
//     );
