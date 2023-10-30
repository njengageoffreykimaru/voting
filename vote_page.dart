import 'package:flutter/material.dart';

class VoteNow extends StatefulWidget {
  const VoteNow({Key? key}) : super(key: key);

  @override
  State<VoteNow> createState() => _VoteNowState();
}

class _VoteNowState extends State<VoteNow> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("voteNow"),
        ),
        body: Column(
          children: [
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.6),
              ),
              child: TabBar(
                indicator: ShapeDecoration(
                  shape: Border(
                    bottom: BorderSide(
                      color: Colors.red, // Color of the border
                      width: 4.0,            // Width of the border
                    ),
                  ),
                ),
                labelColor: Colors.red,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(
                    text: "ONGOING ELECTIONS",
                  ),
                  Tab(
                    text: "UPCOMING ELECTIONS",
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Center(
                    child: Text("ONGOING ELECTIONS"),
                  ),
                  Center(
                    child: Text("UPCOMING ELECTIONS"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
