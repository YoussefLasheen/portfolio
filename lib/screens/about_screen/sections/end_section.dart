import 'package:flutter/material.dart';
import 'package:portfolio/assets/constants.dart';
import 'package:portfolio/screens/shared_components/frostedglass_container.dart';

class EndSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(height: 500),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: FrostedGlassContainer(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 100),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ready to explore',
                        style: TextStyle(fontSize: 70),
                      ),
                      SizedBox(height: 10,),
                      Text('af afsfja asfa s f af afsfja asfa sff af afsfja asfa sff af afsfja asfa sff af afsfja asfa sff af afsfja asfa sf af afsfja asfa sf af afsfja asfa sf', style: TextStyle(color: Colors.white54),)
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
