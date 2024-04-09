import 'package:flutter/material.dart';
import 'package:book_store/app/data/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BookCard extends StatelessWidget {
  final Book book;
  final VoidCallback onTap;
  final VoidCallback onDelete;
  final VoidCallback onUpdate;

  const BookCard({
    Key? key,
    required this.book,
    required this.onTap,
    required this.onDelete,
    required this.onUpdate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 3,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: CachedNetworkImage(
                    imageUrl: book.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    book.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    book.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: _buildPopupMenuButton(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPopupMenuButton(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'delete',
          child: ListTile(
            leading: Icon(Icons.delete),
            title: Text('Delete'),
          ),
        ),
        PopupMenuItem(
          value: 'update',
          child: ListTile(
            leading: Icon(Icons.edit),
            title: Text('Update'),
          ),
        ),
      ],
      onSelected: (value) {
        if (value == 'delete') {
          onDelete();
        } else if (value == 'update') {
          onUpdate();
        }
      },
    );
  }
}
