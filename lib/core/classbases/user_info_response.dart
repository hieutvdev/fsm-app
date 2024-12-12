class UserInfoResponse {
  final String id;
  final String userName;
  final String fullName;
  final String avatarUrl;
  final String birthDay;

  UserInfoResponse({
    required this.id,
    required this.userName,
    required this.fullName,
    required this.avatarUrl,
    required this.birthDay,
  });

  factory UserInfoResponse.fromJson(Map<String, dynamic> json) {
    return UserInfoResponse(
      id: json['id'],
      userName: json['userName'],
      fullName: json['fullName'],
      avatarUrl: json['avatarUrl'],
      birthDay: json['birthDay'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'fullName': fullName,
      'avatarUrl': avatarUrl,
      'birthDay': birthDay,
    };
  }
}
