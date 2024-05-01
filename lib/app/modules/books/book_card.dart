import 'package:book_store/app/modules/cu_book/views/cu_book_view.dart';
import 'package:book_store/app/routes/app_pages.dart';
import 'package:book_store/app/shared/widgets/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:book_store/app/data/book_model.dart';
import 'package:get/get.dart';

class BookCard extends StatelessWidget {
   final VoidCallback onUpdate3;
  final Book book;
  final VoidCallback onTap;
  final VoidCallback onDelete;
  final VoidCallback onUpdate;
  final VoidCallback onUpdate2;


  const BookCard({
    Key? key,
    required this.book,
    required this.onTap,
    required this.onDelete,
    required this.onUpdate,
    required this.onUpdate2,
    required this.onUpdate3,
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
                  child: SplitNetworkImage(
                    // Replace CachedNetworkImage with SplitNetworkImage
                    imageUrl: book.imageUrl,
                    width: double.infinity, // Adjust width as needed
                    height: double.infinity, // Adjust height as needed
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
        PopupMenuItem(
          value: 'update2',
          child: ListTile(
            leading: Icon(Icons.edit),
            title: Text('Upadate2'),
          ),
        ),
         PopupMenuItem(
          value: 'update3',
          child: ListTile(
            leading: Icon(Icons.edit),
            title: Text('Update 3'),
          ),
         ),
      ],
      onSelected: (value) {
        if (value == 'delete') {
          onDelete();
        } else if (value == 'update') {
          onUpdate();
        } else if (value == 'update2') {
          onUpdate2();
        }
        else if (value == 'update3') {
          onUpdate3(); 
        }
      },
    );
  }
}
