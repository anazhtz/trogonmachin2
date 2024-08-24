import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trogonmachin2/widgets/circular_prograss_indicator.dart';
import 'package:trogonmachin2/widgets/customshape_appbar.dart';

class FlashCardScreen extends StatelessWidget {
  const FlashCardScreen({super.key});

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
            _buildTitleWithProgress(),
            const SizedBox(height: 20),
            _buildFlashCard(),
            const Spacer(),
            _buildBottomNavigation(),
          ],
        ),
      ),
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
          radius: 40.0,
          lineWidth: 8.0,
          percent: 5 / 15,
          center: Text("5/15"),
          progressColor: Colors.purple,
        ),
      ],
    );
  }

  Widget _buildFlashCard() {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Obvio',
              style: GoogleFonts.poppins(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'ob.wi.o',
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

  Widget _buildBottomNavigation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildOutlinedButton('Previous'),
        _buildOutlinedButton('Next'),
      ],
    );
  }

  Widget _buildOutlinedButton(String label) {
    return OutlinedButton(
      onPressed: () {},
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



