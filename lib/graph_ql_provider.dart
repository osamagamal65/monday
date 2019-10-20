String mondayBoards = """
query {
  boards(ids: 353654313) {
    name
    state
    board_kind
    subscribers {
      id
    }
    columns {
      title
      type
    }
    groups {
      id
      title
      color
      position
    }
    board_folder_id
    items {
      name
      state
      group {
        id
        title
        color
      }
      creator_id
      creator {
        id
        email
        name
        title
        url
        photo_original
        photo_thumb
        phone
        mobile_phone
      }
      board {
        id
        name
      }
      id
    }
    tags {
      id
      name
      color
    }
    updates {
      id
    }
    owner {
      id
      email
      name
      title
      url
      photo_original
      photo_thumb
      phone
      mobile_phone
    }
  }
}
""";
