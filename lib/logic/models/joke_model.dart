// ignore_for_file: unnecessary_this, prefer_collection_literals, unnecessary_new

class Joke {
  bool? success;
  List<Body>? body;
  String? error;

  Joke({this.success, this.body});
  Joke.withError(String errorMessage) {
    error = errorMessage;
  }
  Joke.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['body'] != null) {
      body = <Body>[];
      json['body'].forEach((v) {
        body!.add(new Body.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.body != null) {
      data['body'] = this.body!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Body {
  String? sId;
  String? setup;
  String? punchline;
  String? type;
  List<int>? likes;
  Author? author;
  bool? approved;
  int? date;
  bool? nSFW;

  Body(
      {this.sId,
      this.setup,
      this.punchline,
      this.type,
      this.likes,
      this.author,
      this.approved,
      this.date,
      this.nSFW});

  Body.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    setup = json['setup'];
    punchline = json['punchline'];
    type = json['type'];
    likes = json['likes'].cast<int>();
    author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
    approved = json['approved'];
    date = json['date'];
    nSFW = json['NSFW'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['setup'] = this.setup;
    data['punchline'] = this.punchline;
    data['type'] = this.type;
    data['likes'] = this.likes;
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    data['approved'] = this.approved;
    data['date'] = this.date;
    data['NSFW'] = this.nSFW;
    return data;
  }
}

class Author {
  String? name;
  int? id;

  Author({this.name, this.id});

  Author.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}
