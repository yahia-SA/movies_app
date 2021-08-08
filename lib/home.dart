import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'data.dart';
import 'Second.dart';
import 'third.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Movies myMovies = new Movies();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.all(20),
        color: Color(0xff0b151f),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Now Playing',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(color: Colors.cyanAccent),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SecondScreen()));
                  },
                  child: const Text(
                    'View All',
                    style: TextStyle(color: Colors.cyanAccent),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 250,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => third(index)));
                      },
                      child: ListItem(index));
                },
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 15,
                    height: 15,
                  );
                },
                itemCount: myMovies.Data.length,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(color: Colors.cyanAccent),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SecondScreen()));
                  },
                  child: const Text(
                    'View All',
                    style: TextStyle(color: Colors.cyanAccent),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 200,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => third(index)));
                      },
                      child: Popular(index));
                },
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsetsDirectional.only(start: 15.0));
                },
                itemCount: myMovies.Data.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ListItem extends StatelessWidget {
  Movies myMovies = new Movies();
  final int index;
  ListItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 130,
            height: 150,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: Image.network(
              myMovies.Data[index].link,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 130,
            child: Text(
              myMovies.Data[index].name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RatingBar.builder(
                initialRating: myMovies.Data[index].rating,
                itemSize: 10,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.cyan,
                ),
                onRatingUpdate: (rating) {},
              ),
              Text(
                '2.6k reviews',
                style: TextStyle(color: Colors.grey, fontSize: 10),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Icon(
                Icons.access_alarm,
                color: Colors.grey,
                size: 15,
              ),
              SizedBox(
                width: 15,
              ),
              Text('2h 14m',
                  style: TextStyle(color: Colors.grey, fontSize: 10)),
            ],
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class Popular extends StatelessWidget {
  Movies myMovies = new Movies();
  final int index;
  Popular(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 130,
            height: 150,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: Image.network(
              myMovies.Data[index].link,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 130,
            child: Text(
              myMovies.Data[index].name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
