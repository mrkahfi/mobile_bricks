// ignore_for_file: public_member_api_docs, sort_constructors_first

/// Object that the UI needs.
class Item {
  final int? id;
  final String? title;
  final String? description;
  final String? thumbnail;
  final String? profileImg;

  const Item({
    this.id,
    this.title,
    this.description,
    this.thumbnail,
    this.profileImg,
  });

  Item copyWith({
    int? id,
    String? title,
    String? description,
    String? thumbnail,
    String? profileImg,
  }) {
    return Item(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      thumbnail: thumbnail ?? this.thumbnail,
      profileImg: profileImg ?? this.profileImg,
    );
  }

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.thumbnail == thumbnail &&
        other.profileImg == profileImg;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        thumbnail.hashCode ^
        profileImg.hashCode;
  }
}
