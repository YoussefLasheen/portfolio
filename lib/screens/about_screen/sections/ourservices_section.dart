import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/assets/constants.dart';
import 'package:portfolio/screens/shared_components/frostedglass_container.dart';

class OurservicesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return ConstrainedBox(
      constraints: isLandscape? BoxConstraints.expand(height: 500): BoxConstraints.expand(height: 700),
      child: Flex(
        direction: isLandscape ? Axis.horizontal : Axis.vertical,
        verticalDirection:
            isLandscape ? VerticalDirection.down : VerticalDirection.up,
        children: [
          Expanded(child: OurservicesCard()),
          SizedBox(width: 50, height: 50,),
          Expanded(
            child: Padding(
              padding: isLandscape? EdgeInsets.only(right: 150, ): EdgeInsets.zero,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    'Our Services',
                    maxLines: 1,
                    style: TextStyle(fontSize: 50),
                  ),
                  SizedBox(height: 50,),
                  AutoSizeText(
                    'Nullam nisl lectus, dignissim at nibh eget, egestas pulvinar diam. Suspendisse rhoncus lectus eget nibh malesuada, eget venenatis turpis fermentum. Suspendisse potenti. Proin imperdiet condimentum lobortis. Nam a massa non diam tincidunt sagittis sed maximus nulla. Fusce mattis nisl id lacus pharetra lobortis. ',
                    style: TextStyle(
                        color: Colors.white70, height: 2, wordSpacing: 1.5,),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class OurservicesCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return FrostedGlassContainer(
      child: Padding(
        padding: isLandscape? EdgeInsets.symmetric(horizontal: 70): EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildTile('Mobile App Development', '4 projects', ()=>context.router.navigateNamed('projects?tag=Mobile'),
                AssetImage('assets/icons/mobile-development.png')),
            _buildSeparator(),
            _buildTile('Web Development', '4 projects', ()=>context.router.navigateNamed('projects?tag=Web'),
                AssetImage('assets/icons/web-development.png')),
            _buildSeparator(),
            _buildTile('UI/UX Design', '4 projects', ()=>context.router.navigateNamed('projects'),
                AssetImage('assets/icons/ui-design.png')),
          ],
        ),
      ),
    );
  }

  Widget _buildTile(
      String text, String subText, Function link, ImageProvider image) {
    return Row(
      children: [
        Image(
          image: image,
          height: 60,
          width: 60,
        ),
        SizedBox(
          width: 40,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text),
            Text(
              subText,
              style: TextStyle(fontSize: 12, color: Colors.white30),
            )
          ],
        ),
        Spacer(),
        IconButton(onPressed: link, icon: Icon(Icons.navigate_next_rounded))
      ],
    );
  }

  Widget _buildSeparator() {
    return Divider(
      height: 1,
      indent: 50,
      endIndent: 50,
      color: Colors.white12,
    );
  }
}
