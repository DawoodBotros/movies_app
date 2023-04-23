import 'package:flutter/material.dart';
import 'package:movies/base.dart';
import 'package:movies/moduels/browse/browse_screen/browse_view_model.dart';
import 'package:movies/moduels/browse/browse_widget.dart';
import 'package:movies/shared/network/remote/api_manager.dart';

import '../../../model/Geners.dart';

class BrowseScreen extends StatefulWidget {
  @override
  _BrowseScreenState createState() => _BrowseScreenState();
}

class _BrowseScreenState extends BaseView<BrowseScreen, BrowseViewModel>
    implements BrowseNavigator {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Browse Category",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder<GenersResponse>(
              future: viewModel.getGeners(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'error => ${snapshot.error}',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  );
                }
                var browse = snapshot.data?.genres! ?? [];
                return Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(17),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 3 / 2,
                    ),
                    itemBuilder: (context, index) {
                      return BrowseWidget(browse[index]);
                    },
                    itemCount: browse.length,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  BrowseViewModel initViewModel() {
    return BrowseViewModel();
  }
}
