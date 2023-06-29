import 'package:flutter/material.dart';
import 'package:flutter_full_course/components/toolbar.dart';
import 'package:flutter_full_course/components/user_avatar.dart';

class UserPage extends StatefulWidget {
  UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: MyUserAppbar(
              offset: scrollController.hasClients ? scrollController.offset : 0,
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => Container(
                        padding: const EdgeInsets.all(16),
                        child: Text("This is test post"),
                      ),
                  childCount: 100))
        ],
      ),
    );
  }
}

class MyUserAppbar extends StatelessWidget {
  final double offset;
  var expanded = true;
  MyUserAppbar({super.key, required this.offset});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final progress = offset / width;
    expanded = progress < 0.04;
    print(expanded);
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: double.infinity,
      height: width - (expanded ? 0 : width - 260),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            right: 0,
            left: 0,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              padding: EdgeInsets.only(
                  top: expanded
                      ? 0
                      : MediaQuery.of(context).viewPadding.top + 24),
              alignment: expanded ? null : Alignment.center,
              width: expanded ? width : 180,
              height: expanded ? width : 180,
              child: Image.asset(
                'assets/temp/user1.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 24,
            right: 24,
            bottom: 24,
            child: AnimatedAlign(
              duration: Duration(milliseconds: 200),
              curve: Curves.fastOutSlowIn,
              alignment: expanded ? Alignment.centerLeft : Alignment.center,
              child: Column(
                children: [
                  Text(
                    'User name',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 23,
                    ),
                  ),
                  Text('Canada'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
