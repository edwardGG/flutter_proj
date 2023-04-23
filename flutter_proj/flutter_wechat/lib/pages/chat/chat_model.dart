class ChatModel {
  final String name;
  final String message;
  final String imageUrl;

  ChatModel({
    required this.name,
    required this.message,
    required this.imageUrl
  });

  factory ChatModel.fromJson(Map json){
    return ChatModel(
      name: json['name'],
      message: json['message'],
      imageUrl: json['imageUrl'],
    );
  }
}