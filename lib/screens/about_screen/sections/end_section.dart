import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/screens/shared_components/frostedglass_container.dart';
import 'package:seo_renderer/seo_renderer.dart';

class EndSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return ConstrainedBox(
      constraints: BoxConstraints.expand(height: 500),
      child: FrostedGlassContainer(
        borderRadius: isLandscape?BorderRadius.circular(20.0):BorderRadius.circular(0.0),
        child: Center(
          child: FractionallySizedBox(
            heightFactor: 8/10,
            widthFactor: 9/10,
            child: Flex(
              direction: isLandscape? Axis.horizontal:Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      'Ready to \nexplore?',
                      maxLines: 2,
                      style: TextStyle(fontSize: 70),
                    ),
                    SizedBox(height: 10,),
                    TextRenderer(
                      child: Text(
                        'Contact us now. and get a price quote \nwith detailed cost overview for free',
                        style: TextStyle(color: Colors.white54, fontSize: 25),
                      ),
                    )
                  ],
                ),
                Spacer(),
                Center(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(5.0),
                      ),
                    ),
                    onPressed: ()=> context.router.navigateNamed('contact'),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: TextRenderer(
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
