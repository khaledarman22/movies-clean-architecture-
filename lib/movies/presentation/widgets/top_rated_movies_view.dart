import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moves/core/network/api_constance.dart';
import 'package:moves/core/utils/enums/request_ste.dart';
import 'package:moves/core/utils/media_query_constance.dart';
import 'package:moves/movies/presentation/controllers/cubit/move_cubit_cubit.dart';
import 'package:moves/movies/presentation/controllers/states/move_cubit_state.dart';
import 'package:moves/movies/presentation/widgets/open_movie.dart';

BlocBuilder viewAllTopRated() =>
    BlocBuilder<MoveCubit, MovieState>(builder: (context, state) {
      switch (state.topRatedState) {
        case RequestState.loading:
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        case RequestState.error:
          return Scaffold(
            body: Center(
              child: Text(state.topRatedMessage),
            ),
          );

        case RequestState.loaded:
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.black.withOpacity(.4),
              centerTitle: true,
              title: const Text('Popular Movies'),
            ),
            backgroundColor: Colors.grey[900],
            body: Stack(
              children: [
                ListView.builder(
                  itemCount: state.topRatedMovies.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OpenViewMovies(
                                  movies: state.topRatedMovies[index],
                                  listMovies: state.topRatedMovies),
                            ));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        width: MediaQueryValues(context).screenWidth,
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              width: 80,
                              height: 130,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(ApiConstance.urlImage(
                                          state.popularMovies[index]
                                              .backdropPath))),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  width: MediaQueryValues(context).screenWidth -
                                      120,
                                  child: Text(
                                    state.topRatedMovies[index].title,
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
                                              state.topRatedMovies[index]
                                                  .releaseDate,
                                              style: const TextStyle(
                                                  color: Colors.white),
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
                                      '${state.topRatedMovies[index].voteAverage}',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  width: MediaQueryValues(context).screenWidth -
                                      120,
                                  child: Text(
                                    maxLines: 2,
                                    softWrap: true,
                                    state.topRatedMovies[index].overview,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
      }
    });
