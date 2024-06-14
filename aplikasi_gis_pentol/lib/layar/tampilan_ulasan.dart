import 'package:flutter/material.dart';

class ReviewScreen extends StatelessWidget {
  final List<Review> reviews = [
    Review(
      username: 'Budi Santoso',
      comment:
          'Aplikasi ini sangat membantu dalam aktivitas sehari-hari. Sangat direkomendasikan!',
      rating: 5,
      timeAgo: '2 menit yang lalu',
      avatarUrl: 'https://via.placeholder.com/150',
    ),
    Review(
      username: 'Siti Aminah',
      comment:
          'Aplikasi ini cukup bagus, tapi ada beberapa hal yang perlu diperbaiki.',
      rating: 4,
      timeAgo: '5 menit yang lalu',
      avatarUrl: 'https://via.placeholder.com/150',
    ),
    Review(
      username: 'Ahmad Fauzi',
      comment: 'Aplikasi ini sangat berguna dan mudah digunakan.',
      rating: 4,
      timeAgo: '10 menit yang lalu',
      avatarUrl: 'https://via.placeholder.com/150',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ulasan'),
      ),
      body: ListView.builder(
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          final review = reviews[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(review.avatarUrl),
            ),
            title: Text(review.username),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: List.generate(
                    5,
                    (index) => Icon(Icons.star,
                        color:
                            index < review.rating ? Colors.yellow : Colors.grey,
                        size: 16),
                  ),
                ),
                SizedBox(height: 4),
                Text(review.comment),
              ],
            ),
            isThreeLine: true,
          );
        },
      ),
    );
  }
}

class Review {
  final String username;
  final String comment;
  final int rating;
  final String timeAgo;
  final String avatarUrl;

  Review({
    required this.username,
    required this.comment,
    required this.rating,
    required this.timeAgo,
    required this.avatarUrl,
  });
}
