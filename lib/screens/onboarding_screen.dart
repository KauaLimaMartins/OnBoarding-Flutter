import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final int _totalPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                _currentPage = page;
                setState(() {});
              },
              children: <Widget>[
                _buildPageContent(
                  image: 'assets/images/onboarding1.png',
                  title:
                      'Browse the menu and order directly from the application',
                  isShowImageOnTop: false,
                  color: Color(0xFFFF7252),
                ),
                _buildPageContent(
                  image: 'assets/images/onboarding2.png',
                  title:
                      'Your order will be immediately collected and sent by our courier',
                  isShowImageOnTop: true,
                  color: Color(0xFFFFA131),
                ),
                _buildPageContent(
                  image: 'assets/images/onboarding3.png',
                  title: 'Pick up delivery at your door and enjoy groceries',
                  isShowImageOnTop: false,
                  color: Color(0xFF3C60FF),
                ),
              ],
            ),
            Positioned(
              bottom: 20,
              left: MediaQuery.of(context).size.width * .05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * .9,
                    child: Row(
                      children: <Widget>[
                        for (int i = 0; i < _totalPages; i++)
                          i == _currentPage
                              ? _buildPageIndicator(true)
                              : _buildPageIndicator(false),
                        Spacer(),
                        if (_currentPage != 2)
                          InkWell(
                            onTap: () {
                              _pageController.animateToPage(2,
                                  duration: Duration(milliseconds: 400),
                                  curve: Curves.linear);
                              setState(() {});
                            },
                            child: Container(
                              height: 60,
                              alignment: Alignment.center,
                              child: Text(
                                'Skip',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        if (_currentPage == 2)
                          InkWell(
                            onTap: () {
                              _pageController.animateToPage(0,
                                  duration: Duration(milliseconds: 400),
                                  curve: Curves.linear);
                              setState(() {});
                            },
                            child: Container(
                              height: 60,
                              alignment: Alignment.center,
                              child: Text(
                                'Start',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageContent({
    @required String image,
    @required String title,
    @required Color color,
    @required bool isShowImageOnTop,
  }) {
    return Container(
      decoration: BoxDecoration(color: color),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (!isShowImageOnTop)
            Column(
              children: <Widget>[
                Center(
                  child: Image.asset(image),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      height: 1.6,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          if (isShowImageOnTop)
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      height: 1.6,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Center(
                  child: Image.asset(image),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator(bool isCurrentPage) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 35),
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: isCurrentPage ? 18 : 10,
      width: isCurrentPage ? 18 : 10,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.white : Colors.white54,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
