import 'package:flutter/material.dart';
import '../viewModel/movies_list_view_model.dart';
import '../widget/movies_list.dart';
import 'package:provider/provider.dart';

// We come here from Main file
// Stateful Widget
class MovieListPage extends StatefulWidget {
  //Creating State
  @override
  _MovieListPageState createState() => _MovieListPageState();
}
// State of MovieListPage
class _MovieListPageState extends State<MovieListPage> {
  // TextField controller
  final TextEditingController _controller = TextEditingController();
  // State Intialization
  @override
  void initState() {
    super.initState();
    // Intialization of provider
    // MovieListViewModel
    Provider.of<MovieListViewModel>(context, listen: false).fetchMovies("movie");
//you can use anything you like or not use anything here. I call it just to have a content on the screen rather than having a blank screen
  }
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<MovieListViewModel>(context);
    return Scaffold(
        appBar: AppBar(
            title: Text("Movies MVVM Example")
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: TextField(
                  controller: _controller,
                  onSubmitted: (value) {
                    if(value.isNotEmpty) {
                      vm.fetchMovies(value);
                      _controller.clear();
                    }
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none
                  ),
                ),
              ),
              Expanded(
                  child: MovieList(movies: vm.movies))//we will create this further down
            ])
        )
    );
  }
}