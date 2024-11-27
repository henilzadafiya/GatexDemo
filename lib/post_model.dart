class postModel {
  List<Posts>? posts;
  int? total;
  int? skip;
  int? limit;

  postModel({this.posts, this.total, this.skip, this.limit});

  postModel.fromJson(Map<String, dynamic> json) {
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  @override
  String toString() {
    return 'postModel{posts: $posts, total: $total, skip: $skip, limit: $limit}';
  }
}

class Posts {
  int? id;
  String? title;

  @override
  String toString() {
    return 'Posts{id: $id, title: $title, body: $body, tags: $tags, reactions: $reactions, views: $views, userId: $userId}';
  }

  String? body;
  List<String>? tags;
  Reactions? reactions;
  int? views;
  int? userId;

  Posts(
      {this.id,
        this.title,
        this.body,
        this.tags,
        this.reactions,
        this.views,
        this.userId});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    tags = json['tags'].cast<String>();
    reactions = json['reactions'] != null
        ? new Reactions.fromJson(json['reactions'])
        : null;
    views = json['views'];
    userId = json['userId'];
  }

}

class Reactions {
  int? likes;

  @override
  String toString() {
    return 'Reactions{likes: $likes, dislikes: $dislikes}';
  }

  int? dislikes;

  Reactions({this.likes, this.dislikes});

  Reactions.fromJson(Map<String, dynamic> json) {
    likes = json['likes'];
    dislikes = json['dislikes'];
  }
}
