import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/assets/constants.dart';
import 'package:portfolio/screens/shared_components/frostedglass_container.dart';
import 'package:rive/rive.dart';

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
                    'We offer highly efficient app development for the web and mobile - or both. We can do maps, eCommerce, Live Streaming, or even just a simple data viewer.',
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
        padding: isLandscape? EdgeInsets.symmetric(horizontal: 90, vertical: 65): EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedTile(
                'Mobile Development',
                '4 projects',
                () => context.router.navigateNamed('projects?tag=Mobile'),
                'assets/animations/mobile-development.riv'),
            _buildSeparator(),
            AnimatedTile(
                'Web Development',
                '4 projects',
                () => context.router.navigateNamed('projects?tag=Web'),
                'assets/animations/web-development.riv'),
            _buildSeparator(),
            AnimatedTile(
                'UI/UX Design',
                '4 projects',
                () => context.router.navigateNamed('projects'),
                'assets/animations/ui-design.riv'),
          ],
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
            width: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.text),
              Text(
                widget.text,
                style: TextStyle(fontSize: 12, color: Colors.white30),
              )
            ],
          ),
          Spacer(),
        IconButton(onPressed: widget.link as void Function()?, icon: Icon(Icons.navigate_next_rounded))
        ],
      ),
    );
  }
}
