import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/navigation/widgets/sidebar.dart';
import 'package:portfolio/routes/router.gr.dart';

class Root extends StatelessWidget {
  // Set(viewportFraction: 0.9999). It's a Dirty little trick to preload the next and previous pages
  final PageController controller =
      PageController(initialPage: 0, viewportFraction: 0.9999);
  @override
  Widget build(BuildContext context) {
    //WidgetsBinding.instance.addPostFrameCallback((_) => limitOrientation(context));
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return AutoTabsRouter(
      routes: [AboutRouter(), ProjectsRouter(), ContactRouter()],
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Material(
          color: Colors.grey[900],
          child: Flex(
            direction: isLandscape ? Axis.horizontal : Axis.vertical,
            children: <Widget>[
              Sidebar(
                currentIndex: tabsRouter.activeIndex,
                onTap: (index) {
                  tabsRouter.setActiveIndex(index);
                },
              ),
              Expanded(
                child: FadeTransition(
                  opacity: animation,
                  // the passed child is techinaclly our animated selected-tab page
                  child: child,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

// This function checks if the user's screen height is smaller than required to the app
// to be shown horizontaly and will launch a full screen dialog to tell the user to flip his device to vertical mode
limitOrientation(BuildContext context) {
  MediaQuery.of(context).size.shortestSide < 600 &&
          MediaQuery.of(context).orientation == Orientation.landscape
      ? !Navigator.of(context).canPop()
          ? showGeneralDialog(
              context: context,
              barrierDismissible: false,
              barrierLabel: "Dialog",
              transitionDuration: Duration(milliseconds: 400),
              pageBuilder: (_, __, ___) {
                return SizedBox.expand(
                  child: Material(
                    color: Color(0xFF303030),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Spacer(),
                          Expanded(
                              flex: 6,
                              child: Image.asset(
                                  'assets/images/rotate-to-portrait-icon.png')),
                          Spacer(),
                          Expanded(
                            child: FittedBox(
                              child: Text(
                                "Please Rotate your Screen\n for better experience",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Spacer()
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          // ignore: unnecessary_statements
          : null
      : Navigator.of(context).maybePop();
}
