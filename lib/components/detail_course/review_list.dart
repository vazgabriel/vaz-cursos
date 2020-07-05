import 'package:flutter/material.dart';
import 'package:vaz_cursos/components/cached_image.dart';

import 'package:vaz_cursos/models/course_rate.dart';

class DetailCourseReviewList extends StatelessWidget {
  DetailCourseReviewList({Key key, this.rates}) : super(key: key);

  final List<CourseRate> rates;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: SizedBox(
              width: double.infinity,
              child: FlatButton(
                child: Text('Avaliações'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListReviews(
                        rates: rates,
                      ),
                    ),
                  );
                },
                textColor: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListReviews extends StatelessWidget {
  const ListReviews({Key key, this.rates}) : super(key: key);

  final List<CourseRate> rates;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avaliações'),
      ),
      body: ListView.builder(
        itemCount: rates.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 5.0,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    '${rates[index].ratedBy.name} (${rates[index].rate})',
                  ),
                  leading: rates[index].ratedBy.profileImage != null
                      ? CachedImage(
                          imageUrl: rates[index].ratedBy.profileImage,
                          circle: true,
                        )
                      : const CircleAvatar(child: Icon(Icons.person)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(rates[index].description),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
