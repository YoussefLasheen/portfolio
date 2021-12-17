import 'package:flutter/material.dart';

class OurservicesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(height: 500),
      child: Row(
        children: [
          Expanded(child: OurservicesCard()),
          SizedBox(width: 50,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 150, ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Our Services',
                    style: TextStyle(fontSize: 50),
                  ),
                  SizedBox(height: 50,),
                  Text(
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
    return Container(
      decoration: BoxDecoration(
          color: Colors.deepPurple, borderRadius: BorderRadius.circular(40)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildTile('Mobile App Development', '4 projects', ()=>context.router.navigateNamed('projects?tag=Mobile'),
                AssetImage('assets/icons/mobile-development.png')),
            _buildSeparator(),
            _buildTile('Wwb Development', '4 projects', ()=>context.router.navigateNamed('projects?tag=Web'),
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
          height: 70,
          width: 70,
        ),
        SizedBox(
          width: 50,
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
        IconButton(onPressed: null, icon: Icon(Icons.navigate_next_rounded))
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
