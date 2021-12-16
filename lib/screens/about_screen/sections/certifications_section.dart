import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CertificationsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(height: 600),
      child: Column(
        children: [
          Text(
            'Certfications',
            style: TextStyle(fontSize: 50),
          ),
          SizedBox(height: 50,),
          CarouselSlider.builder(
              itemCount: 15,
              options: CarouselOptions(
                height: 400,
                aspectRatio: 16 / 9,
                viewportFraction: 0.5,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                enlargeStrategy: CenterPageEnlargeStrategy.scale,
                scrollPhysics: AlwaysScrollableScrollPhysics(),
              ),
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                bool isCenter = itemIndex == pageViewIndex;
                return Container(
                  child: Placeholder(
                    color: isCenter ? Colors.amber : Colors.white,
                  ),
                );
              })
        ],
      ),
    );
  }
}
