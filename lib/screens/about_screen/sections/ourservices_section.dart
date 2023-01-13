import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/assets/constants.dart';
import 'package:portfolio/screens/shared_components/frostedglass_container.dart';
import 'package:rive/rive.dart';

class OurservicesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return ConstrainedBox(
      constraints: isLandscape? BoxConstraints.expand(height: 500): BoxConstraints.expand(height: 900),
      child: Flex(
        direction: isLandscape ? Axis.horizontal : Axis.vertical,
        verticalDirection:
            isLandscape ? VerticalDirection.down : VerticalDirection.up,
        children: [
          Expanded(flex: isLandscape? 4: 6,child: OurservicesCard()),
          Spacer(),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  'Our Services',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(height: 25,),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                        child: Container(
                          width: 30,
                          height: 10,
                          color: mainColor,
                        ),
                      ),
                      Expanded(
                        child: AutoSizeText(
                          'We use cutting-edge technologies and the latest development tools to ensure that our solutions are reliable, secure, and scalable. Our goal is to provide our clients with high-quality, cost-effective software solutions that help them achieve their business objectives. Whether you need a custom web application or a mobile app, we have the expertise and resources to deliver the perfect solution for your business. ',
                          style: TextStyle(
                            color: Colors.white60,
                            height: 1.5,
                            fontSize: 24,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          isLandscape?Spacer():SizedBox.shrink(),
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
      borderRadius: isLandscape?BorderRadius.circular(20.0):BorderRadius.circular(0.0),
      child: Center(
        child: FractionallySizedBox(
          heightFactor: 7/10,
          widthFactor: isLandscape?7/10:8/10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: AnimatedTile(
                    'Mobile Development',
                    'This includes both native applications, and web-based applications, which are accessed through a browser. ',
                    () => context.go('/projects?tag=Mobile'),
                    'assets/animations/mobile-development.riv'),
              ),
              _buildSeparator(),
              Expanded(
                child: AnimatedTile(
                    'Web Development',
                    'Building, and maintaining websites.',
                    () => context.go('/projects?tag=Web'),
                    'assets/animations/web-development.riv'),
              ),
              _buildSeparator(),
              Expanded(
                child: AnimatedTile(
                    'UI/UX Design',
                    'Designing user interfaces for software applications. We focus on creating an intuitive, user-friendly experience. ',
                    () => context.go('/projects?tag=UI/UX'),
                    'assets/animations/ui-design.riv'),
              ),
            ],
          ),
        ),
      ),
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
class AnimatedTile extends StatefulWidget {
  final String text;
  final String subText;
  final Function link;
  final String animationPath;

    AnimatedTile( this.text, this.subText, this.link, this.animationPath,);
  
    @override
    State<AnimatedTile> createState() => _AnimatedTileState();
  }
  
class _AnimatedTileState extends State<AnimatedTile> {
  SMIInput<bool>? _hoveringInput;
  Artboard? _artboard;

  @override
  void initState() {
    super.initState();
    rootBundle.load(widget.animationPath).then(
      (data) {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;
        var controller = StateMachineController.fromArtboard(
          artboard,
          'State Machine 1',
        );
        if (controller != null) {
          artboard.addController(controller);
          _hoveringInput = controller.findInput('hovering');
        }
        setState(() => _artboard = artboard);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.link as void Function()?,
      onHover: (val)=>_hoveringInput?.value = val,
      child: Row(
        children: [
          SizedBox.square(
            dimension: 60,
            child: _artboard == null
                ? SizedBox()
                : Rive(
                    artboard: _artboard!,
                    fit: BoxFit.fitHeight,
                  ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.text),
                Text(
                  widget.subText,
                  style: TextStyle(fontSize: 12, color: Colors.white30),
                )
              ],
            ),
          ),
        IconButton(onPressed: widget.link as void Function()?, icon: Icon(Icons.navigate_next_rounded))
        ],
      ),
    );
  }
}
