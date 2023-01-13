import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/navigation/widgets/sidebar.dart';

class Root extends StatelessWidget {
  final Widget child;

  const Root({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) => limitOrientation(context));
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Material(
          color: Colors.grey[900],
          child: Flex(
            direction: isLandscape ? Axis.horizontal : Axis.vertical,
            children: <Widget>[
              Sidebar(
                currentIndex: _calculateSelectedIndex(context),
                onTap: (index) => _onItemTapped(index, context)
              ),
              Expanded(
                child: child,
              )
            ],
          ),
        );
  }
  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith('/about')) {
      return 0;
    }
    if (location.startsWith('/projects')) {
      return 1;
    }
    if (location.startsWith('/contact')) {
      return 2;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/about');
        break;
      case 1:
        GoRouter.of(context).go('/projects');
        break;
      case 2:
        GoRouter.of(context).go('/contact');
        break;
    }
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
                                  'assets/images/rotate-to-portrait-icon.webp')),
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
