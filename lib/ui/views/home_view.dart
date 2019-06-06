import 'package:flutter/material.dart';
import 'package:weather_app/core/viewmodel/home_view_model.dart';

import 'base_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  static const _PANEL_HEADER_HEIGHT = 50.0, _MIDDLE_PILL_HEIGHT = 180.0;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
      value: 0.0,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  bool get _isPanelVisible {
    final AnimationStatus status = _controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  Animation<RelativeRect> _getPanelAnimation(BoxConstraints constraints) {
    final double height = constraints.biggest.height;
    final double top = height - _PANEL_HEADER_HEIGHT;
    final double bottom = -_PANEL_HEADER_HEIGHT;
    return new RelativeRectTween(
      begin: new RelativeRect.fromLTRB(0.0, top, 0.0, bottom),
      end: new RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
    ).animate(new CurvedAnimation(parent: _controller, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      builder: (context, model, child) {
        return Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image.asset(
                'assets/w1.png',
                fit: BoxFit.cover,
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            _controller.fling(
                                velocity: _isPanelVisible ? -1.0 : 1.0);
                          },
                          icon: new AnimatedIcon(
                            icon: AnimatedIcons.menu_close,
                            progress: _controller.view,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: LayoutBuilder(builder: _buildStack)),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStack(BuildContext context, BoxConstraints constraints) {
    final Animation<RelativeRect> animation = _getPanelAnimation(constraints);
    return new Container(
      child: Stack(
        children: <Widget>[
          LayoutBuilder(
            builder: (context, constraints) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, bottom: 5.0, top: 15.0),
                          child: Text("Today 4 June 19",
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, bottom: 15.0),
                          child: Text("Current Location",
                              style: TextStyle(
                                fontSize: 16.0,
                              )),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Row(
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Text("DAY"),
                                      Text("NIGHT"),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Icon(Icons.keyboard_arrow_up),
                                      Icon(Icons.keyboard_arrow_down),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text("42"),
                                      Text("52"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.cloud_queue,
                                      size: 60.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 10),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text("40",
                                              style: TextStyle(
                                                fontSize: 60.0,
                                                fontWeight: FontWeight.bold,
                                              )),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: Text("\u00b0C",
                                                style: TextStyle(
                                                  fontSize: 35.0,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Text("Sunny With Periodic\nClouds",
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              height: _MIDDLE_PILL_HEIGHT / 2,
                            ),
                            Material(
                              borderRadius: const BorderRadius.only(
                                topLeft: const Radius.circular(16.0),
                                topRight: const Radius.circular(16.0),
                              ),
                              color: Colors.white,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    height: _MIDDLE_PILL_HEIGHT / 2,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 20.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            Icon(Icons.wb_sunny),
                                            Text("Sunrise"),
                                            Text("05:04"),
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Icon(Icons.wb_sunny),
                                            Text("Sunrise"),
                                            Text("05:04"),
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Icon(Icons.wb_sunny),
                                            Text("Sunrise"),
                                            Text("05:04"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: _PANEL_HEADER_HEIGHT,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: _MIDDLE_PILL_HEIGHT * 0.1),
                              child: Stack(
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topLeft:
                                                const Radius.circular(10.0),
                                            topRight:
                                                const Radius.circular(10.0),
                                          ),
                                          color: Color(0xfff0ffd6),
                                        ),
                                        height: _MIDDLE_PILL_HEIGHT * 0.8 * 0.7,
                                        width: _MIDDLE_PILL_HEIGHT / 2,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft:
                                                const Radius.circular(10.0),
                                            bottomRight:
                                                const Radius.circular(10.0),
                                          ),
                                          color: Color(0xffffd800),
                                        ),
                                        height: _MIDDLE_PILL_HEIGHT * 0.8 * 0.3,
                                        width: _MIDDLE_PILL_HEIGHT / 2,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: _MIDDLE_PILL_HEIGHT * 0.8,
                                    decoration: BoxDecoration(
                                        //color: Color(0xFFf0FFD6),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    width: _MIDDLE_PILL_HEIGHT / 2,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Container(
                                          child: Center(
                                              child: Icon(
                                            Icons.wb_sunny,
                                            size: _MIDDLE_PILL_HEIGHT *
                                                0.8 *
                                                0.25,
                                          )),
                                          height:
                                              _MIDDLE_PILL_HEIGHT * 0.8 * 0.4,
                                        ),
                                        Container(
                                          height:
                                              _MIDDLE_PILL_HEIGHT * 0.8 * 0.3,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Icon(Icons.attach_file),
                                              Text("42\u0060C"),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height:
                                              _MIDDLE_PILL_HEIGHT * 0.8 * 0.3,
                                          child: Center(child: Text("12:30")),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
          ),
          PositionedTransition(
            rect: animation,
            child: new Material(
              borderRadius: const BorderRadius.only(
                  topLeft: const Radius.circular(16.0),
                  topRight: const Radius.circular(16.0)),
              elevation: 12.0,
              child: new Column(
                children: <Widget>[
                  Container(
                    height: _PANEL_HEADER_HEIGHT,
                    child: Stack(
                      children: <Widget>[
                        Center(child: new Text("...")),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            FloatingActionButton(
                              child: Icon(_isPanelVisible
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_up),
                              mini: true,
                              onPressed: () {
                                _controller.fling(
                                    velocity: _isPanelVisible ? -1.0 : 1.0);
                              },
                              backgroundColor: Color(0xFFFFD800),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        Center(child: Text("Today Junbe 4 19")),
                        Center(child: Text("Current Location")),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.cloud_queue,
                                size: 60.0,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("40",
                                        style: TextStyle(
                                          fontSize: 60.0,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text("\u00b0C",
                                          style: TextStyle(
                                            fontSize: 35.0,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Center(child: Text("Sunny With Periodic Clouds")),
                        Center(child: Text("Day 42 Night 28")),
                        Container(
                          width: 200.0,
                          height: 100.0,
                          child: ListView.builder(
                            itemBuilder: (context, index) => Container(
                                  width: 80.0,
                                  height: 100.0,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Icon(Icons.wb_sunny),
                                          Text("32C"),
                                        ],
                                      ),
                                      Text("9-10 AM"),
                                    ],
                                  ),
                                ),
                            itemCount: 10,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                        Text("Details"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
