import 'package:flutter/material.dart';
import 'package:movies/model/Geners.dart';
import 'package:movies/moduels/browse/browse_screen/browse_list.dart';

class BrowseWidget extends StatelessWidget {
  Genres? genres;
 BrowseWidget(this.genres);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
       Navigator.pushNamed(context, BrowseList.routeName,arguments: genres);
      },
      child: Container(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            ClipRect(
              child: Image.asset("assets/images/image_cat.png"),
            ),
            Text(
             " ${genres!.name}",
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
