import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moves/core/network/api_constance.dart';
import 'package:moves/core/utils/enums/request_ste.dart';
import 'package:moves/movies/presentation/controllers/cubit/move_cubit_cubit.dart';
import 'package:moves/movies/presentation/controllers/states/move_cubit_state.dart';
import 'package:moves/movies/presentation/widgets/open_movie.dart';

BlocBuilder populerMovies({required double width, required double height}) =>
    BlocBuilder<MoveCubit, MovieState>(builder: (context, state) {
      switch (state.popularState) {
        case RequestState.loading:
          return SizedBox(
            width: width,
            height: height * .2,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );

        case RequestState.error:
          return Center(
            child: Text(state.popularMessage),
          );

        case RequestState.loaded:
          return SizedBox(
              width: width,
              height: height * .24,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: state.popularMovies.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OpenViewMovies(
                                movies: state.popularMovies[index],
                                listMovies: state.popularMovies),
                          ));
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      width: width * .35,
                      height: height * .3,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(ApiConstance.urlImage(
                                  state.popularMovies[index].backdropPath))),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  );
                },
              ));
      }
    });
