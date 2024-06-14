import 'package:flutter/material.dart';

void showMarkerPopup(BuildContext context, String title, int starRating,
    String address, String hours, String description, String imagePath) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // Generate star widgets with yellow color and white shadow
      List<Widget> stars = List.generate(
        starRating,
        (index) => Stack(
          children: [
            Text(
              '★',
              style: TextStyle(fontSize: 24, color: Colors.white, shadows: [
                Shadow(
                  blurRadius: 1,
                  color: Colors.black,
                  offset: Offset(1, 1),
                ),
              ]),
            ),
            Text(
              '★',
              style: TextStyle(fontSize: 24, color: Colors.yellow),
            ),
          ],
        ),
      );

      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(25), // Rounded corners for the dialog
        ),
        child: Container(
          decoration: BoxDecoration(
            color:
                Color.fromRGBO(211, 94, 10, 0.8), // RGBA color with 80% opacity
            borderRadius: BorderRadius.circular(25), // Matching border radius
          ),
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          imagePath,
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(width: 8),
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors
                                .white, // Text color to contrast with the background
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8), // Change to 8 for tighter spacing
                    Row(
                      children: stars,
                    ),
                    SizedBox(height: 16),
                    Text(
                      address,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors
                            .white, // Text color to contrast with the background
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      hours,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors
                            .white, // Text color to contrast with the background
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors
                            .white, // Text color to contrast with the background
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Add your navigation logic here
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(),
                      icon: Image.asset(
                        'assets/images/arah.png',
                        width: 24,
                        height: 24,
                      ),
                      label: Text('Arahkan Lokasi'),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
