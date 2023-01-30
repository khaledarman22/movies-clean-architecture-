import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moves/core/network/api_constance.dart';
import 'package:moves/core/utils/enums/request_ste.dart';
import 'package:moves/movies/presentation/controllers/cubit/move_cubit_cubit.dart';
import 'package:moves/movies/presentation/controllers/states/move_cubit_state.dart';
import 'package:moves/movies/presentation/widgets/open_movie.dart';

BlocBuilder nowPlayingMovies({required double width, required double height}) =>
    BlocBuilder<MoveCubit, MovieState>(builder: (context, state) {
      switch (state.nowPlayingState) {
        case RequestState.loading:
          MoveCubit.get(context).getNowPlayingMovies();
          return SizedBox(
            width: width,
            height: height * .4,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );

        case RequestState.error:
          return Center(
            child: Text(state.nowPlayingMessage),
          );

        case RequestState.loaded:
          return CarouselSlider.builder(
            itemCount: state.nowPlayingMovies.length,
            options: CarouselOptions(
              autoPlay: true,
              height: height * .4,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {},
            ),
            itemBuilder: (context, index, realIndex) => InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OpenViewMovies(
                        listMovies: state.nowPlayingMovies,
                        movies: state.nowPlayingMovies[index],
                      ),
                    ));
              },
              child: Container(
                width: width,
                height: height * .4,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                      ),
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: -50,
                        blurRadius: 12.0,
                      )
                    ],
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          ApiConstance.urlImage(
                              state.nowPlayingMovies[index].backdropPath),
                        ))),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Positioned(
                        bottom: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: width * .015,
                              backgroundColor: Colors.red,
                            ),
                            Text(
                              'NOW PLAYING',
                              style: TextStyle(
                                  fontSize: width * .05, color: Colors.white),
                            ),
                          ],
                        )),
                    Positioned(
                      bottom: 20,
                      child: Text(
                        state.nowPlayingMovies[index].title,
                        style: TextStyle(
                            overflow: TextOverflow.clip,
                            fontSize: width * .05,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
      }
    });
