import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CertificatesSection extends StatelessWidget {
  const CertificatesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        enableInfiniteScroll: false,
        autoPlay: true,
        height: 300,
        aspectRatio: 1,
        viewportFraction: 0.3,
        initialPage: 1,
      ),
      itemCount: 5,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            child: UnconstrainedBox(
              child: CertificateCard()
            ),
          ),
        );
      },
    );
  }
}


class CertificateCard extends StatefulWidget {
  CertificateCard({Key? key}) : super(key: key);

  @override
  State<CertificateCard> createState() => _CertificateCardState();
}

class _CertificateCardState extends State<CertificateCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
       onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
              opaque: false, pageBuilder: (_, __, ___) => const OrderDialog()),
        );
      },
      child: Container(
        height: 100,
        width: 200,
        color: Colors.white,
      ),
    );
  }
}

class OrderDialog extends StatelessWidget {
  const OrderDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    return Hero(
      tag: 'tag',
      child: Center(
        child: Container()
      ),
    );
  }
}