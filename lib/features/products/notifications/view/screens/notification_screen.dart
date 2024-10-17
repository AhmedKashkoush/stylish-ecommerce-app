import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NotificationsTab extends StatelessWidget {
  const NotificationsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var notificationsBox = Hive.box('notifications');
    print("pppppppppppppppppppppppppp");
    print(notificationsBox.length);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        centerTitle: true,
        backgroundColor: Colors.redAccent, // Use a suitable accent color
      ),
      body: ValueListenableBuilder(
        valueListenable: notificationsBox.listenable(),
        builder: (context, Box box, widget) {
          if (box.isEmpty) {
            return Center(
              child: Padding(
                padding:  EdgeInsets.all(16.0.r),
                child: Text(
                  'No notifications received yet.',
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          return Padding(
            padding:  EdgeInsets.symmetric(horizontal:10.w, vertical:8.h),
            child: ListView.builder(
              itemCount: box.length,

              itemBuilder: (context, index) {
                var notification = box.getAt(index);

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      contentPadding:  EdgeInsets.symmetric(vertical:12.h, horizontal:16.w),
                      leading: const Icon(
                        Icons.notifications,
                        color: Colors.redAccent, // Accent color to match the theme
                        size: 40,
                      ),
                      title: Text(
                        notification['title'],
                        style:  TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height:5.h),
                          Text(
                            notification['body'],
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(height:5.h),
                          Text(
                            _formatTimestamp(notification['timestamp']),
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      trailing: Icon(
                        Icons.chevron_right,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  // Helper function to format the timestamp for better readability
  String _formatTimestamp(String timestamp) {
    final DateTime parsedTimestamp = DateTime.parse(timestamp);
    return '${parsedTimestamp.day}/${parsedTimestamp.month}/${parsedTimestamp.year} ${parsedTimestamp.hour}:${parsedTimestamp.minute}';
  }
}
