import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CertificatesSection extends StatelessWidget {
  const CertificatesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: CarouselSlider.builder(
        options: CarouselOptions(
          enableInfiniteScroll: false,
          viewportFraction: isLandscape ? 0.3 : 0.7,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.scale,
          padEnds: true,
        ),
        itemCount: 5,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
          return AspectRatio(aspectRatio: 12 / 9, child: CertificateCard());
        },
      ),
    );
  }
}

class CertificateCard extends StatefulWidget {
  CertificateCard({Key? key}) : super(key: key);

  @override
  State<CertificateCard> createState() => _CertificateCardState();
}

class _CertificateCardState extends State<CertificateCard> {
  Certificate _certificate = Certificate(
      title: 'AI Programming with Python Nanodegree',
      shortDescription: 'Udacity',
      certificationLink: 'https://confirm.udacity.com/DL47ZLN9',
      imageUrl:
          'https://firebasestorage.googleapis.com/v0/b/yousseflasheen-portfolio.appspot.com/o/projects_assets%2Fthis_portfolio%2FCertificates%2FMachine%20Learning%20Engineer%20Nanodegree-1.jpg?alt=media&token=0e96db7e-b197-4c49-977c-67aa96265613');
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(height: 400),
        child: Hero(
          tag: 'ddd',
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CertificateDialog(),
                  ),
                );
              },
              child: Stack(
                children: [
                  SizedBox.expand(
                    child: Container(
                      color: Colors.white,
                      child: Image.network(_certificate.imageUrl,
                          fit: BoxFit.fitHeight),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.5),
                            Colors.transparent,
                          ],
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _certificate.title,
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CertificateDialog extends StatelessWidget {
  const CertificateDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'tag',
      child: Center(child: Container()),
    );
  }
}

class Certificate {
  const Certificate({
    required this.title,
    required this.shortDescription,
    required this.imageUrl,
    required this.certificationLink,
  });
  final String title;
  final String shortDescription;
  final String imageUrl;
  final String certificationLink;

  Certificate.fromJson(Map<String, Object?> json)
      : this(
          title: json['title']! as String,
          shortDescription: json['shortDescription']! as String,
          imageUrl: json['backgroundImageSource']! as String,
          certificationLink: json['tags'] as String,
        );
}
