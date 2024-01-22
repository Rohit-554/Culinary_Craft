import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fud/colors/Colors.dart';

import '../../models/meals/MealType.dart';

@RoutePage()
class MyRecipeDetail extends StatefulWidget {
  final AsyncSnapshot<MealType> snapshot;
  final int index;
  MyRecipeDetail({required this.snapshot, required this.index});

  @override
  _MyRecipeDetailState createState() => _MyRecipeDetailState();
}

class _MyRecipeDetailState extends State<MyRecipeDetail> with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  bool isExpanded = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    bool isExpanded = _scrollController.hasClients &&
        _scrollController.offset > (400 - kToolbarHeight);
    setState(() {
      this.isExpanded = isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.4,
            pinned: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite_outline_sharp),
              ),
            ],
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
            ),
            stretch: true,
            backgroundColor: bottomNavbarColor,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              centerTitle: false,
              expandedTitleScale: 1,
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    widget.snapshot.data!.meals![widget.index].strMealThumb!,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 100, // Adjust the height as needed
                      decoration: const BoxDecoration(
                        color: Colors.white, // Adjust the card background color
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      child: Center(
                        child: Text(
                          widget.snapshot.data!.meals![widget.index].strMeal!,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                        Container(
                          child: TabBar(
                            controller: _tabController,
                            indicatorColor: fabButton,
                            tabs: [
                              Tab(text: 'Ingredients'),
                              Tab(text: 'Instructions'),
                            ],
                            labelColor: fabButton, // Change the color for selected tab
                            unselectedLabelColor: Colors.grey, // Change the color for unselected tabs
                          ),
                        ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: TabBarView(
                          controller: _tabController,
                          children: const [
                            Center(
                              child:
                                Text(
                                  "Hello",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic
                                  ),
                                ),
                            ),
                            Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  Text("Saumya", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                                ],

                            )


                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
