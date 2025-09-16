import 'package:flutter/material.dart';
import 'package:owala_app/data/onboarding_data.dart';
import 'package:owala_app/utils/consts.dart';
import 'package:owala_app/views/onboarding/components/boarding_content.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // currentpage mendefinisikan index makanya angka nya 0 
  int currentPage = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  // maksud dari kode ini adalah untuk memberitau 
                  //setiap kali ada perubahan di satu objek/halaman 
                  //yang ditrigger oleh adanya interaksi oleh pengguna
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: onBoardingData.length,
                itemBuilder: (context, index) => OnboardingContent(
                  text: onBoardingData[index].text, 
                  image: onBoardingData[index].image,
                  ),
              ),
            ),
            Expanded(
              // ini buat yang tikti2 kalo ganti layar
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onBoardingData.length,
                  (index) => _dostIndicator(index: index)
                )
              )
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal:15, vertical: 50 ),
                child: SizedBox(
                  width: double.infinity,
                  // double infinity dia ngasih lebar otomatis sesuai lebar layar
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor
                    ),
                    onPressed: () {
                    if (currentPage == onBoardingData.length -1) {
                      Navigator.pushNamed(context, '/login');
                    } else {
                      _pageController.animateToPage(
                        currentPage + 1, 
                        duration: animationDuration,
                        curve: Curves.ease
                      );
                    }
                    },
                    child: Text(
                      // currentpage = 3-1 ? 2 
                      currentPage == onBoardingData.length -1 ? "Get Started" : "Next",
                      style: TextStyle(color: Colors.white),
                      // currentpage itu otomatis ke index yang sedang aktif (layar yang lagi aktif)
                    ),
                  ),
                ),
              )
          ],
        )
        ),
    );
  }

  AnimatedContainer _dostIndicator({required int index}) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: currentPage == index ? primaryColor : secondaryColor,
      ),
      // arti dari ? = kalo 
      width: currentPage == index ? 20 : 7,
      height: 5,
      duration: animationDuration,
    );
  }
}