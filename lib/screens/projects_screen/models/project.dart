class ProjectMetadata {
  const ProjectMetadata({this.id,  this.title, this.shortDescription, this.backgroundImageSource,this.tags,});
  final String? id;
  final String? title;
  final String? shortDescription;
  final String? backgroundImageSource;
  final List? tags;

  ProjectMetadata.fromJson(Map<String, Object?> json)
    : this(
        id: json['id']! as String,
        title: json['title']! as String,
        shortDescription: json['shortDescription']! as String,
        backgroundImageSource: json['backgroundImageSource']! as String,
        tags: json['tags']! as List,
      );
}

class ProjectDescription{
ProjectDescription( {this.accessOptions,this.infoSnippet,this.projectMetadata,});
  final Map? infoSnippet;
  final ProjectMetadata? projectMetadata;
  final List? accessOptions;

  
}