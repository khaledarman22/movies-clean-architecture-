import 'package:flutter/material.dart';
import 'package:moves/core/network/api_constance.dart';
import 'package:moves/core/utils/media_query_constance.dart';
import 'package:moves/movies/domain/entites/move.dart';

class OpenViewMovies extends StatelessWidget {
  final Movie movies;
  final List<Movie> listMovies;

  const OpenViewMovies({
    super.key,
    required this.movies,
    required this.listMovies,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQueryValues(context).screenWidth;
    double height = MediaQueryValues(context).screenHeight;
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SizedBox(
        width: width,
        height: height,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: height * .3,
              width: width,
              child: Image.network(
                ApiConstance.urlImage(movies.backdropPath),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: width,
              child: Text(
                movies.title,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
                  color: Colors.red[500],
                  child: SizedBox(
                      height: 20,
                      child: Center(
                        child: Text(
                          movies.releaseDate,
                          style: const TextStyle(color: Colors.white),
                        ),
                      )),
                ),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.star,
                  color: Colors.amber[300],
                ),
                Text(
                  '${movies.voteAverage}',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: width,
              child: Text(
                maxLines: 5,
                softWrap: true,
                movies.overview,
                style: const TextStyle(
                    color: Colors.white, overflow: TextOverflow.ellipsis),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              width: width,
              child: const Text(
                'MORE LIKE THIS ',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            Container(
              width: width,
              height: height * 1.2,
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: listMovies.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OpenViewMovies(
                                movies: listMovies[index],
                                listMovies: listMovies),
                          )),
                      child: Card(
                          color: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(ApiConstance.urlImage(
                                        listMovies[index].backdropPath))),
                                borderRadius: BorderRadius.circular(10)),
                          )),
                    );
                  }),
            )
          ]),
        ),
      ),
    );
  }
}
