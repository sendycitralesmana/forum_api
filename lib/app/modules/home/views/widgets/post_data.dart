import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostData extends StatelessWidget {
  const PostData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Name',
            style: GoogleFonts.poppins(),
          ),
          Text(
            'Email@gmail.com',
            style: GoogleFonts.poppins(
              fontSize: 12
            ),
          ),
          SizedBox(height: 10,),
          Text(
            'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum'
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {}, 
                icon: Icon(Icons.thumb_up),
              ),
              IconButton(
                onPressed: () {}, 
                icon: Icon(Icons.message),
              ),
            ],
          ),
        ],
      ),
    );
  }
}