import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/services/api.dart';

class CertificatesSection extends StatelessWidget {
  const CertificatesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return FutureBuilder<DocumentSnapshot>(
      future: Api('Data').getDocumentById('certificates data'),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          List<Certificate> myModels = (data['data'] as List)
              .map((i) => Certificate.fromJson(i))
              .toList();

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
              itemCount: myModels.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                return AspectRatio(
                    aspectRatio: 12 / 9,
                    child: CertificateCard(
                      certificate: myModels[itemIndex],
                    ));
              },
            ),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

class CertificateCard extends StatelessWidget {
  final Certificate certificate;

  CertificateCard({
    Key? key,
    required this.certificate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(height: 400),
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {
              context.pushTransparentRoute(CertificateDialog(
                certificate: certificate,
              ));
            },
            child: Stack(
              children: [
                SizedBox.expand(
                  child: Container(
                    color: Colors.white,
                    child: Image.network(certificate.imageUrl,
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
                          certificate.title,
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
    );
  }
}

class CertificateDialog extends StatelessWidget {
  final Certificate certificate;
  const CertificateDialog({Key? key, required this.certificate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          DismissiblePage(
            direction: DismissiblePageDismissDirection.multi,
            isFullScreen: false,
            startingOpacity: 0.5,
            onDismissed: () {
              Navigator.of(context).pop();
            },
            child: Center(
              child: Image.network(certificate.imageUrl),
            ),
          ),
          IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(Icons.close))
        ],
      ),
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
          shortDescription: json['desc']! as String,
          imageUrl: json['imageUrl']! as String,
          certificationLink: json['confUrl'] as String,
        );
}
