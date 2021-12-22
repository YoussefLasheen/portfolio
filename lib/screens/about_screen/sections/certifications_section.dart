import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/screens/shared_components/frostedglass_container.dart';

class CertificationsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List certificates = [
      'AAM6ESPH.jpg',
      'AHDRJH.jpg',
      'bue-en-advanced.jpg',
      'bue-ml.jpg',
      'DL47ZLN9.jpg',
      'RES3DTGRZAX8.jpg',
      'RPF3SFJZ.jpg',
      'SHSK4XHKZQXR.jpg',
      'TL9TYRUPNT48.jpg',
      'U3NNR5USXDMA.jpg',
      '4D4MTEP.jpg',
    ];
    return ConstrainedBox(
      constraints: BoxConstraints.expand(height: 600),
      child: Column(
        children: [
          Text(
            'Certfications',
            style: TextStyle(fontSize: 50),
          ),
          SizedBox(
            height: 50,
          ),
          CarouselSlider.builder(
              itemCount: certificates.length,
              options: CarouselOptions(
                height: 400,
                viewportFraction: 0.4,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                enlargeStrategy: CenterPageEnlargeStrategy.scale,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                scrollPhysics: AlwaysScrollableScrollPhysics(),
              ),
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                bool isCenter = itemIndex == pageViewIndex;
                return Certificate(
                  certificateImageSrc: certificates[itemIndex],
                );
              })
        ],
      ),
    );
  }
}

class Certificate extends StatelessWidget {
  final String? certificateImageSrc;

  const Certificate({Key? key, this.certificateImageSrc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 400,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0,
            right: 0,
            width: 350,
            height: 250,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(color: Colors.grey,),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            height: 350,
              width: 350,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  'images/certifications/' + certificateImageSrc!,
                  fit: BoxFit.contain,
                )),
          )
        ],
      ),
    );
  }
}
