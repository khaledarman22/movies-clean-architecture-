import 'package:flutter/material.dart';
import 'package:moves/core/utils/media_query_constance.dart';
import 'package:moves/movies/presentation/widgets/now_palying_movies_widget.dart';
import 'package:moves/movies/presentation/widgets/populer_movies_view.dart';
import 'package:moves/movies/presentation/widgets/populer_movies_widget.dart';
import 'package:moves/movies/presentation/widgets/top_rated_movies_view.dart';
import 'package:moves/movies/presentation/widgets/top_rated_movies_widget.dart';

class GetNowPlayingMovies extends StatelessWidget {
  const GetNowPlayingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              nowPlayingMovies(
                  width: MediaQueryValues(context).safeBlockHorizontal,
                  height: MediaQueryValues(context).safeBlockVertical),
              SizedBox(
                height: MediaQueryValues(context).safeBlockVertical * .04,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => viewAllPopular(),
                        ));
                  },
                  child: Card(
                    color: Colors.transparent,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Popular',
                            style: TextStyle(color: Colors.white),
                          ),
                          Row(
                            children: [
                              Text(
                                'See More',
                                style: TextStyle(
                                    fontSize: MediaQueryValues(context)
                                            .safeBlockVertical *
                                        .013,
                                    color: Colors.white),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                              )
                            ],
                          )
                        ]),
                  ),
                ),
              ),
              populerMovies(
                  width: MediaQueryValues(context).safeBlockHorizontal,
                  height: MediaQueryValues(context).safeBlockVertical),
              SizedBox(
                height: MediaQueryValues(context).safeBlockVertical * .04,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => viewAllTopRated(),
                        ));
                  },
                  child: Card(
                    color: Colors.transparent,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Top Rated',
                            style: TextStyle(color: Colors.white),
                          ),
                          Row(
                            children: [
                              Text(
                                'See More',
                                style: TextStyle(
                                    fontSize: MediaQueryValues(context)
                                            .safeBlockVertical *
                                        .013,
                                    color: Colors.white),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                              )
                            ],
                          )
                        ]),
                  ),
                ),
              ),
              topRatedMovies(
                  width: MediaQueryValues(context).safeBlockHorizontal,
                  height: MediaQueryValues(context).safeBlockVertical)
            ],
          ),
        ),
      ),
    );
  }
}
