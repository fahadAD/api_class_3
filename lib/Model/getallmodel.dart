class GetAllModel {
  GetAllModel({
      this.id, 
      this.parentId, 
      this.order, 
      this.color, 
      this.name, 
      this.commentCount, 
      this.isShared, 
      this.isFavorite, 
      this.isInboxProject, 
      this.isTeamInbox, 
      this.url, 
      this.viewStyle,});

  GetAllModel.fromJson(dynamic json) {
    id = json['id'];
    parentId = json['parent_id'];
    order = json['order'];
    color = json['color'];
    name = json['name'];
    commentCount = json['comment_count'];
    isShared = json['is_shared'];
    isFavorite = json['is_favorite'];
    isInboxProject = json['is_inbox_project'];
    isTeamInbox = json['is_team_inbox'];
    url = json['url'];
    viewStyle = json['view_style'];
  }
  String? id;
  dynamic parentId;
  num? order;
  String? color;
  String? name;
  num? commentCount;
  bool? isShared;
  bool? isFavorite;
  bool? isInboxProject;
  bool? isTeamInbox;
  String? url;
  String? viewStyle;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['parent_id'] = parentId;
    map['order'] = order;
    map['color'] = color;
    map['name'] = name;
    map['comment_count'] = commentCount;
    map['is_shared'] = isShared;
    map['is_favorite'] = isFavorite;
    map['is_inbox_project'] = isInboxProject;
    map['is_team_inbox'] = isTeamInbox;
    map['url'] = url;
    map['view_style'] = viewStyle;
    return map;
  }

}