import 'package:flutter/material.dart';
import 'view/movies_screen.dart';
import 'viewModel/movies_list_view_model.dart';
import 'package:provider/provider.dart';
// main function
void main() => runApp(MyApp());
// MyApp()
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Returning Material App
    return MaterialApp(
        title: "Movies MVVM Example",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.green),
        // Change Notifier provider is used
        home:

        ChangeNotifierProvider(

          create: (context) => MovieListViewModel(),
          // MovieList Page
          child: MovieListPage(),
        )
    );
  }
}