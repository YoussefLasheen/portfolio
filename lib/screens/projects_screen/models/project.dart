class Project {
  const Project({
    this.id,
    this.title,
    this.shortDescription,
    this.backgroundImageSource,
    this.tags,
    this.accessOptions,
    this.infoSnippet,
    this.order,

  });
  final String? id;
  final String? title;
  final String? shortDescription;
  final String? backgroundImageSource;
  final List? tags;
  final Map? infoSnippet;
  final Map? accessOptions;
  final int? order;

  Project.fromJson(Map<String, Object?> json, String id)
      : this(
          id: id,
          title: json['title']! as String,
          shortDescription: json['shortDescription']! as String,
          backgroundImageSource: json['backgroundImageSource']! as String,
          tags: json['tags']! as List,
          infoSnippet: json['info']! as Map,
          accessOptions: json['access']! as Map,
          order: json['order']! as int,
        );
}
