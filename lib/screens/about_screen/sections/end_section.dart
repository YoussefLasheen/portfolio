import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/assets/constants.dart';
import 'package:portfolio/screens/shared_components/frostedglass_container.dart';

class EndSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return ConstrainedBox(
      constraints: BoxConstraints.expand(height: 500),
      child: Padding(
        padding: isLandscape? EdgeInsets.symmetric(horizontal: 100):EdgeInsets.symmetric(horizontal: 10),
        child: FrostedGlassContainer(
          child: Padding(
            padding: isLandscape? EdgeInsets.symmetric(vertical: 50, horizontal: 100):EdgeInsets.symmetric(vertical: 50, horizontal: 25),
            child: Flex(
              direction: isLandscape? Axis.horizontal:Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        'Ready to explore',
                        maxLines: 1,
                        style: TextStyle(fontSize: 70),
                      ),
                      SizedBox(height: 10,),
                      Text('Contact us now. and get a price quote with detailed cost overview for free', style: TextStyle(color: Colors.white54),)
                    ],
                  ),
                ),
                Flexible(
                  child: Center(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                        ),
                      ),
                      onPressed: null,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          'Book for free',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20),
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
