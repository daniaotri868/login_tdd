class Houses {
  Houses({
    required this.id,
    required this.postId,
    required this.operationId,
    required this.userId,
    required this.price,
    required this.duration,
    required this.isAccepted,
    required this.user,
    required this.post,
    required this.operation,
  });

  final int? id;
  final int? postId;
  final int? operationId;
  final int? userId;
  final int? price;
  final dynamic duration;
  final int? isAccepted;
  final User? user;
  final Post? post;
  final Operation? operation;

  factory Houses.fromJson(Map<String, dynamic> json){
    return Houses(
      id: json["id"],
      postId: json["post_id"],
      operationId: json["operation_id"],
      userId: json["user_id"],
      price: json["price"],
      duration: json["duration"],
      isAccepted: json["is_accepted"],
      user: json["user"] == null ? null : User.fromJson(json["user"]),
      post: json["post"] == null ? null : Post.fromJson(json["post"]),
      operation: json["operation"] == null ? null : Operation.fromJson(json["operation"]),
    );
  }

}

class Operation {
  Operation({
    required this.id,
    required this.name,
    required this.description,
  });

  final int? id;
  final String? name;
  final String? description;

  factory Operation.fromJson(Map<String, dynamic> json){
    return Operation(
      id: json["id"],
      name: json["name"],
      description: json["description"],
    );
  }

}

class Post {
  Post({
    required this.id,
    required this.postDate,
    required this.postsable,
  });

  final int? id;
  final DateTime? postDate;
  final Postsable? postsable;

  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      id: json["id"],
      postDate: DateTime.tryParse(json["post_date"] ?? ""),
      postsable: json["postsable"] == null ? null : Postsable.fromJson(json["postsable"]),
    );
  }

}

class Postsable {
  Postsable({
    required this.id,
    required this.location,
    required this.floor,
    required this.space,
    required this.direction,
    required this.description,
    required this.roomNumber,
    required this.images,
    required this.name,
    required this.model,
    required this.color,
    required this.isNew,
    required this.year,
  });

  final int? id;
  final String? location;
  final String? floor;
  final String? space;
  final String? direction;
  final String? description;
  final int? roomNumber;
  final List<Image> images;
  final String? name;
  final String? model;
  final String? color;
  final int? isNew;
  final String? year;

  factory Postsable.fromJson(Map<String, dynamic> json){
    return Postsable(
      id: json["id"],
      location: json["location"],
      floor: json["floor"],
      space: json["space"],
      direction: json["direction"],
      description: json["description"],
      roomNumber: json["room_number"],
      images: json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
      name: json["name"],
      model: json["model"],
      color: json["color"],
      isNew: json["is_new"],
      year: json["year"],
    );
  }

}

class Image {
  Image({
    required this.id,
    required this.img,
    required this.description,
  });

  final int? id;
  final String? img;
  final dynamic description;

  factory Image.fromJson(Map<String, dynamic> json){
    return Image(
      id: json["id"],
      img: json["img"],
      description: json["description"],
    );
  }

}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.img,
  });

  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? img;

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      img: json["img"],
    );
  }

}
