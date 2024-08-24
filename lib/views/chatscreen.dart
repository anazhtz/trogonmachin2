import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart'; // Add this import for AnimatedBottomNavigationBar
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ChatScreen(),
  ));
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int _selectedIndex = 0;

  final iconList = <IconData>[
    Icons.keyboard,
    Icons.arrow_forward_ios,
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 216, 230, 241),
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black38, width: .5),
              ),
              child: const Icon(Icons.close, color: Colors.black),
            ),
            const SizedBox(width: 15),
            Image.network(
              'https://s3-alpha-sig.figma.com/img/89eb/2c9a/d0f8b070422ad1e9e907c29c8a7726e6?Expires=1725235200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=RspP1cLUejcXGsd-gV9sOeuzxRWdmT8HGNghaGFaurqwmw91m4035UhEmx26dUyE4DqqtnQgNqewif9LoaiW5qERqY8fJWQI8ocSXnYXkgbph-LCvKTrBebwEBCH5h2icYuNyLRQqcd8IcKCT8yVlQbV1yBxv1tDn6fSXWDOBzxagAp~jYvJsvj-n4OWwvHNvEemxBb7HwRjrkEMvV9fgbizdnZmm0-dpDSpgjPiqQ1E5SZJiPFcVxhvic8x8~0GceQ5DlBYvGstaSDz-9t0efyhc8IiDpIlUe67D4tKmloO8-xIfwzJgP-OkkUHHv9fNZQcj3QWZoafThYl-qtS6g__',
              width: 90,
              height: 80,
            ),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "John Doe",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Online",
                  style: TextStyle(fontSize: 14, color: Colors.purple),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              children: [
                _buildReceiverBubble(
                  message:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took.",
                  context: context,
                ),
                _buildSenderBubble(
                  message: "Lorem Ipsum is \nsimply dummy ",
                  context: context,
                ),
                _buildReceiverBubble(
                  message: "Lorem Ipsum Is \nSimply Dummy Text",
                  context: context,
                ),
                _buildSenderBubble(
                  message: "Lorem Ipsum Is \nSimply Dummy",
                  context: context,
                ),
                 _buildReceiverBubble(
                  message: "Lorem Ipsum Is \nSimply Dummy Text",
                  context: context,
                ),
                _buildSenderBubble(
                  message: "Lorem Ipsum Is \nSimply Dummy",
                  context: context,
                ),
                 _buildReceiverBubble(
                  message: "Lorem Ipsum Is \nSimply Dummy Text",
                  context: context,
                ),
                _buildSenderBubble(
                  message: "Lorem Ipsum Is \nSimply Dummy",
                  context: context,
                ),
                 _buildReceiverBubble(
                  message: "Lorem Ipsum Is \nSimply Dummy Text",
                  context: context,
                ),
                _buildSenderBubble(
                  message: "Lorem Ipsum Is \nSimply Dummy",
                  context: context,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.purple,
        child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
            color: Colors.purple
            ),
            child: Image.network(
                "https://s3-alpha-sig.figma.com/img/89eb/2c9a/d0f8b070422ad1e9e907c29c8a7726e6?Expires=1725235200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=RspP1cLUejcXGsd-gV9sOeuzxRWdmT8HGNghaGFaurqwmw91m4035UhEmx26dUyE4DqqtnQgNqewif9LoaiW5qERqY8fJWQI8ocSXnYXkgbph-LCvKTrBebwEBCH5h2icYuNyLRQqcd8IcKCT8yVlQbV1yBxv1tDn6fSXWDOBzxagAp~jYvJsvj-n4OWwvHNvEemxBb7HwRjrkEMvV9fgbizdnZmm0-dpDSpgjPiqQ1E5SZJiPFcVxhvic8x8~0GceQ5DlBYvGstaSDz-9t0efyhc8IiDpIlUe67D4tKmloO8-xIfwzJgP-OkkUHHv9fNZQcj3QWZoafThYl-qtS6g__")),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30.0)),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: AnimatedBottomNavigationBar(
            icons: iconList,
            activeIndex: _selectedIndex,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.verySmoothEdge,
            onTap: _onItemTapped,
            backgroundColor: Colors.white,
            activeColor: const Color(0xFF673AB7),
            inactiveColor: Colors.grey,
            splashColor: const Color(0xFF7E57C2),
          ),
        ),
      ),
    );
  }

  Widget _buildReceiverBubble(
      {required String message, required BuildContext context}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
                'https://s3-alpha-sig.figma.com/img/89eb/2c9a/d0f8b070422ad1e9e907c29c8a7726e6?Expires=1725235200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=RspP1cLUejcXGsd-gV9sOeuzxRWdmT8HGNghaGFaurqwmw91m4035UhEmx26dUyE4DqqtnQgNqewif9LoaiW5qERqY8fJWQI8ocSXnYXkgbph-LCvKTrBebwEBCH5h2icYuNyLRQqcd8IcKCT8yVlQbV1yBxv1tDn6fSXWDOBzxagAp~jYvJsvj-n4OWwvHNvEemxBb7HwRjrkEMvV9fgbizdnZmm0-dpDSpgjPiqQ1E5SZJiPFcVxhvic8x8~0GceQ5DlBYvGstaSDz-9t0efyhc8IiDpIlUe67D4tKmloO8-xIfwzJgP-OkkUHHv9fNZQcj3QWZoafThYl-qtS6g__'),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.only(bottom: 10, right: 50),
              constraints: BoxConstraints(
                  maxWidth:
                      MediaQuery.of(context).size.width * 0.7), 
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 8, 37, 82),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSenderBubble(
      {required String message, required BuildContext context}) {
    return Align(
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 8),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.only(bottom: 10, left: 50),
              constraints: BoxConstraints(
                  maxWidth:
                      MediaQuery.of(context).size.width * 0.7), 
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Text(
                message,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(width: 10,),
          const CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
                'https://s3-alpha-sig.figma.com/img/2f28/2c70/9ccb46343db587f3483d09c6cf98f077?Expires=1725235200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=lK-7YqC3JXFiDqN3y-pAV-ZytUHx0XXESfiOSb5iXIFYKlhemqFo6LmKZOckfxyLx5XDU7H58zQJirR9ocmrt~2HXrA1bi8j6WlHEbSCSa5alBWuORUEfwKv56u~Jk9-7cUadqTRGCWD7PBQyGtcf45iDsf5KL4WblHOLeFkueKEnHzeXB3RgD9DPcdF3I6nCXwJYiCQtxHSo5v76IM0Sos8C1rqJ9pFyqlNo-d31Y8IGA87tOqvhDnwh9MJ4Bv49BrtT6izjXtYF0x0R2Tc7akTZ4Kv8d14iD0WRtW9qOO1jxCNdNPK3s4SJgO4SpLCHv7To5AP7h7LnC0M0-IFfA__'),
          ),
        ],
      ),
    );
  }
}
