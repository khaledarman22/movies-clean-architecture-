import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moves/core/services/services_locator.dart';
import 'package:moves/movies/presentation/controllers/cubit/move_cubit_cubit.dart';
import 'package:moves/movies/presentation/screens/movies_home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Bloc.observer = MyBlocObserver();
  await ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => MoveCubit(sl(), sl(), sl())
          ..getNowPlayingMovies()
          ..getPopularMovies()
          ..getTopRatedMovies(),
        lazy: false,
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const GetNowPlayingMovies()));
  }
}



/*BlocProvider(
        create: (BuildContext context) => MoviesBloc(sl(), sl(), sl())
          ..add(GetNowPlayingMoviesEvent())
          ..add(GetPopularMoviesEvent())
          ..add(GetTopRatedMoviesEvent()), */