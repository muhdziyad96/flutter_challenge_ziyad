import 'package:flutter/material.dart';
import 'package:flutter_challenge_ziyad/constant/color.dart';
import 'package:flutter_challenge_ziyad/util/preference.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _controller = PageController();
  bool _isLastPage = false;
  bool _isFirstPage = true;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: (index) {
          setState((() {
            _isLastPage = index == 4;
            _isFirstPage = index == 0;
          }));
        },
        children: [
          body(
              'A treasure trove of games, suggesting a vast collection or repository',
              'At GameTrove, we`re dedicated to providing you with an unparalleled gaming experience. Whether you`re a casual player, a seasoned gamer, or somewhere in between, you`ll find something to love in our extensive collection of games.'),
          body('Discover Endless Entertainment',
              'Explore our vast library of games spanning multiple genres, platforms, and styles. From action-packed adventures to brain-teasing puzzles, from classic favorites to hidden gems waiting to be unearthed, there`s something here for everyone.'),
          body('Connect with Fellow Gamers',
              'Join our vibrant community of gamers from around the world. Share tips and strategies, discuss your favorite games, and connect with like-minded individuals who share your passion for gaming.'),
          body('Stay Up-to-Date',
              'Never miss out on the latest releases, updates, and gaming news. Our team works tirelessly to keep you informed about the newest titles, upcoming events, and exciting developments in the world of gaming.'),
          body('Get Started Today',
              'Sign up for your free account and start exploring GameTrove now! With new games added regularly and a wealth of features designed to enhance your gaming experience, there`s never been a better time to join the GameTrove community.'),
        ],
      ),
      bottomSheet: SizedBox(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _isFirstPage
                ? Padding(
                    padding: EdgeInsets.all(4.2.w),
                    child: TextButton(
                      onPressed: () {
                        _controller.animateToPage(4,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      },
                      child: const Text(
                        'Skip',
                        style: TextStyle(color: primaryColor),
                      ),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.all(4.2.w),
                    child: TextButton(
                      onPressed: () {
                        _controller.previousPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      },
                      child: const Text(
                        'Back',
                        style: TextStyle(color: primaryColor),
                      ),
                    ),
                  ),
            Center(
              child: SmoothPageIndicator(
                count: 5,
                controller: _controller,
                effect: const WormEffect(
                    spacing: 16,
                    radius: 10,
                    dotHeight: 10,
                    dotWidth: 10,
                    dotColor: greyLess,
                    activeDotColor: primaryColor),
                onDotClicked: (index) => _controller.animateToPage(
                  index,
                  duration: const Duration(microseconds: 500),
                  curve: Curves.easeIn,
                ),
              ),
            ),
            _isLastPage
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.3.w),
                    child: TextButton(
                      onPressed: () {
                        Preference.setBool(Preference.showOnboard, false);
                        Get.offNamed('/login');
                      },
                      child: const Text(
                        'Get Started',
                        style: TextStyle(color: primaryColor),
                      ),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.3.w),
                    child: TextButton(
                      onPressed: () {
                        _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      },
                      child: const Text(
                        'Next',
                        style: TextStyle(color: primaryColor),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget body(String text1, String text2) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.4.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text1,
                style: const TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 2.5.h),
              Text(
                text2,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
