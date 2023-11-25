import 'package:flutflix2/search.dart';
import 'package:flutflix2/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutflix2/utils/text.dart';
import 'package:flutflix2/widgets/toprated.dart';
import 'package:flutflix2/widgets/trending.dart';
import 'package:flutflix2/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:flutflix2/search.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.green),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String apikey = '67af5e631dcbb4d0981b06996fcd47bc';
  final String readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2N2FmNWU2MzFkY2JiNGQwOTgxYjA2OTk2ZmNkNDdiYyIsInN1YiI6IjYwNzQ1OTA0ZjkyNTMyMDAyOTFmZDczYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.C_Bkz_T8OybTGo3HfYsESNjN46LBYdw3LHdF-1TzYYs';
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];

  @override
  void initState() {
    super.initState();
    loadmovies();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPouplar();
    print((trendingresult));
    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });
  }
  var pages=[Home(),search()];
   int myIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title:Text ( 'Flutter Movie App ❤️'),
          backgroundColor: Colors.transparent,
        ),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
         backgroundColor: Colors.blue,
         type: BottomNavigationBarType.fixed,

          onTap: (index){
        setState(() {
           myIndex=index;
           });

          },

          currentIndex:myIndex,

          items: const[
          BottomNavigationBarItem(icon: Icon(Icons.home),
          label: 'Home',
            backgroundColor: Colors.cyan,

          ),
          BottomNavigationBarItem(icon: Icon(Icons.search),
              label: 'Search',
            backgroundColor: Colors.cyanAccent,
          ),
        ],),
        body: ListView(
          children: [
            TV(tv: tv, ),
            TrendingMovies(
              trending: trendingmovies,
            ),
            TopRatedMovies(
              toprated: topratedmovies,
            ),
            Center(
              child: pages[myIndex],
            )
          ],
        ),

    );
  }
}