class Board {
  final String name;
  final String status;
  final dynamic boardFolderId;
  final List<dynamic> items;
  final List<dynamic> tags;
  final List<dynamic> updates;
  final dynamic owner;
  Board(
      {this.name,
      this.status,
      this.boardFolderId,
      this.items,
      this.owner,
      this.tags,
      this.updates});
}
