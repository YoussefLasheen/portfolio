class Project {
  const Project({
    this.id,
    this.title,
    this.shortDescription,
    this.backgroundImageSource,
    this.tags,
    this.accessOptions,
    this.order,
    this.role,
    this.date,
    this.longDescription,
    this.client,
    this.credits,
  });
  final String? id;
  final String? title;
  final String? shortDescription;
  final String? backgroundImageSource;
  final List? tags;
  final Map? accessOptions;
  final int? order;
  final String? role;
  final String? date;
  final String? longDescription;
  final String? client;
  final String? credits;

  Project.fromJson(Map<String, Object?> json, String id)
      : this(
          id: id,
          title: json['title']! as String,
          shortDescription: json['shortDescription']! as String,
          backgroundImageSource: json['backgroundImageSource']! as String,
          tags: json['tags']! as List,
          accessOptions: json['access']! as Map,
          order: json['order']! as int,
          role: json['role']! as String,
          date: json['date']! as String,
          longDescription: json['longDescription']! as String,
          client: json['client']! as String,
          credits: json['credits']! as String,
        );
}
