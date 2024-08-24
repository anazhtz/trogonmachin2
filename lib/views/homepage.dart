import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trogonmachin2/widgets/circular_prograss_indicator.dart';
import 'package:trogonmachin2/widgets/customshape_appbar.dart';
import 'package:flip_card/flip_card.dart';

class FlashCardScreen extends StatefulWidget {
  const FlashCardScreen({super.key});

  @override
  _FlashCardScreenState createState() => _FlashCardScreenState();
}

class _FlashCardScreenState extends State<FlashCardScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(220),
        child: ClipPath(
          clipper: CustomShapeAppBar(),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 170, 58, 222), Color(0xFF9C1EC2)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  'https://s3-alpha-sig.figma.com/img/ce49/3b30/a5fb37ed85a16842257dc51a59510d3d?Expires=1725235200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Po~3jkWLNouJ~JZ9X3T~3ANpG0GoNZSDvWvBD18stQNyJkSHZ2V-87rgLY7nDt~2ZrWF0-Q0vM9Vls9ZcvQ2zTLU54PGp4VqSGiiAj38CFI8Tl5l1D0PbyfHN2JZjKB9~pHeTdyzVHayTUgc7FBZN039oBcE3vdCxjPR1yvdeGy-0Tid1PYqiOhIgUgG-BwrlkIbQkpDb8Yc6taDy3NMZmGfcPPG-k8A51ox5dSjskVhHul4WjXMwIUWZQlAtM0K6rcWUWE~iF1BzPBGh6V9Bd4EzDt9ko5HA5wCnkgB93Ab~nltt4VBNIWjwJbI~mhDy6L~E574QjEbISFl4~pRIA__',
                  fit: BoxFit.cover,
                  color: Colors.white10,
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 1),
                          ),
                          child: const Icon(Icons.arrow_back_ios,
                              color: Colors.white),
                        ),
                        Text(
                          'Flash Card',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 24),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: _buildTitleWithProgress(),
              ),
              const SizedBox(height: 20),
              _buildFlashCard(),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildOutlinedButton('Previous'),
                  _buildOutlinedButton('Next'),
                ],
              ),
            ],
          )),
    );
  }

  Widget _buildTitleWithProgress() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Everyday Phrases',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const CircularPercentIndicator(
          radius: 60.0,
          lineWidth: 12.0,
          percent: 5 / 15,
          center: Text("1/5"),
          progressColor: Colors.purple,
        ),
      ],
    );
  }

  Widget _buildFlashCard() {
    final flashCards = [
      {'title': 'Obvio', 'subtitle': 'ob.wi.o', 'meaning': 'Obviously'},
      {'title': 'Hello', 'subtitle': 'he.lo', 'meaning': 'A greeting'},
      {'title': 'World', 'subtitle': 'wo.rld', 'meaning': 'The earth'},
      {'title': 'World', 'subtitle': 'wo.rld', 'meaning': 'The earth'},
    ];

    return SizedBox(
      height: 300,
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemCount: flashCards.length,
        itemBuilder: (context, index) {
          final card = flashCards[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: FlipCard(
              direction: FlipDirection.HORIZONTAL, 
              front: _buildCardSide(card['title']!, card['subtitle']!),
              back: _buildCardSide(card['meaning']!, ''),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCardSide(String title, String subtitle) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            if (subtitle.isNotEmpty)
              Text(
                subtitle,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            const SizedBox(height: 20),
            const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30,
              child: Icon(Icons.arrow_forward_ios, color: Colors.purple),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOutlinedButton(String label) {
    return OutlinedButton(
      onPressed: () {
        if (label == 'Next') {
          if (_currentPage < 3) {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        } else if (label == 'Previous') {
          if (_currentPage > 0) {
            _pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        }
      },
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        side: const BorderSide(color: Colors.purple),
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 16,
          color: Colors.purple,
        ),
      ),
    );
  }
}
