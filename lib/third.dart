import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'data.dart';

// ignore: camel_case_types
class third extends StatelessWidget {
  final int index;
  third(this.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            fullinfo(index),
          ],
        ));
  }
}

// ignore: must_be_immutable
// ignore: camel_case_types
// ignore: must_be_immutable
class fullinfo extends StatelessWidget {
  Movies myMovies = new Movies();
  final int index;
  fullinfo(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff0b151f),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              child: Image.network(
                myMovies.Data[index].link,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                color: Color(0xff0b151f),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      myMovies.Data[index].name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        RatingBar.builder(
                            initialRating: myMovies.Data[index].rating,
                            minRating: 0,
                            itemSize: 30.0,
                            direction: Axis.horizontal,
                            //textDirection: ,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: .5),
                            itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.cyan,
                                ),
                            onRatingUpdate: (value) {}),
                        Text(
                          '2.3 K Views',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.access_alarm,
                          color: Colors.white70,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '2h 14m',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(Icons.calendar_today, color: Colors.white70),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '2019/2/1',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 100,
                          child: SingleChildScrollView(
                              child: Text(
                            myMovies.Data[index].about,
                            style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 2.0,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ))),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
