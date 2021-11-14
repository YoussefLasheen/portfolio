class ProjectMetadata {
  const ProjectMetadata({this.id,  this.title, this.shortDescription, this.backgroundImageSource,this.tags,});
  final String id;
  final String title;
  final String shortDescription;
  final String backgroundImageSource;
  final List tags;
}

class ProjectDescription{
ProjectDescription({this.projectMetadata, this.text});
  final String text;
  final ProjectMetadata projectMetadata;

  
}