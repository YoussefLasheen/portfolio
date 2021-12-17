import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AboutusSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return ConstrainedBox(
      constraints: BoxConstraints.expand(height: 300),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  'About Us',
                  maxLines: 1,
                  style: TextStyle(fontSize: 70),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        width: 30,
                        height: 10,
                        color: Colors.deepPurple,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        'Nullam nisl lectus, dignissim at nibh eget, egestas pulvinar diam. Suspendisse rhoncus lectus eget nibh malesuada, eget venenatis turpis fermentum. Suspendisse potenti. Proin imperdiet condimentum lobortis. Nam a massa non diam tincidunt sagittis sed maximus nulla. Fusce mattis nisl id lacus pharetra lobortis. ',
                        style: TextStyle(
                          color: Colors.white70,
                          height: 1.5,
                          wordSpacing: 1.5
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          isLandscape
              ? Expanded(
                flex: 2 ,
                child: Row(
                    children: [
                      Spacer(
                        flex: 2,
                      ),
                      Expanded(
                        child: Image.asset(
                          'assets/images/P1Logo.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      Spacer()
                    ],
                  ),
              )
              : SizedBox.shrink()
        ],
      ),
    );
  }
}
