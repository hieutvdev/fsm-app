String formatPublishTime(DateTime publishAt) {
  final now = DateTime.now();
  final difference = now.difference(publishAt);
  if (difference.inDays > 0) {
    return '${difference.inDays} ngày trước';
  } else if (difference.inHours > 0) {
    return '${difference.inHours} giờ ago';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes} phút ago';
  } else {
    return 'Bây giờ';
  }
}
