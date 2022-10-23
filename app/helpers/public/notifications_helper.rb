module Public::NotificationsHelper

  def notification_form(notification)
    @visiter = notification.visiter
    @photo_comment = nil
    your_photo_image = link_to 'あなたの投稿',
    userphotos_user_path(notification.visited_id), style: "font-weight: bold; color: #008075;", onMouseOver: "this.style.color='#cc7eb1'", onMouseOut: "this.style.color='#008075'"

    @visiter_photo_comment = notification.photo_comment_id
    @visiter_album_photo_comment = notification.album_photo_comment_id

    case notification.action
      when "favorite" then
        tag.a(notification.visiter.name, href:users_user_path(@visiter),
        style:"font-weight: bold; color: #008075;", onMouseOver: "this.style.color='#cc7eb1'", onMouseOut: "this.style.color='#008075'")+"が"+tag.a('あなたの投稿',
        href: photo_image_path(notification.photo_image_id),
        style:"font-weight: bold; color: #008075;", onMouseOver: "this.style.color='#cc7eb1'", onMouseOut: "this.style.color='#008075'")+"にいいねしました"
      when "photo_comment" then
        @photo_comment = PhotoComment.find_by(id: @visiter_photo_comment)&.comment
          tag.a(@visiter.name, href: user_path(@visiter),
          style:"font-weight: bold; color: #008075;", onMouseOver: "this.style.color='#cc7eb1'", onMouseOut: "this.style.color='#008075'")+"が"+tag.a('あなたの投稿',
          href: photo_image_path(notification.photo_image_id),
          style:"font-weight: bold; color: #008075;", onMouseOver: "this.style.color='#cc7eb1'", onMouseOut: "this.style.color='#008075'")+"にコメントしました"
      when "album_photo_comment" then
        @album_photo_comment = AlbumPhotoComment.find_by(id: @visiter_album_photo_comment)&.comment
          tag.a(@visiter.name, href: user_path(@visiter),
          style:"font-weight: bold; color: #008075;", onMouseOver: "this.style.color='#cc7eb1'", onMouseOut: "this.style.color='#008075'")+"が"+tag.a('あなたの投稿',
          href: album_photo_image_path(notification.album_photo_image_id),
          style:"font-weight: bold; color: #008075;", onMouseOver: "this.style.color='#cc7eb1'", onMouseOut: "this.style.color='#008075'")+"にコメントしました"
      when "good" then
        @photo_comment = PhotoComment.find_by(id: @visiter_photo_comment)&.comment
          tag.a(@visiter.name, href: user_path(@visiter),
          style:"font-weight: bold; color: #008075;", onMouseOver: "this.style.color='#cc7eb1'", onMouseOut: "this.style.color='#008075'")+"が"+tag.a('あなたのコメント',
          href: photo_image_path(notification.photo_image_id),
          style:"font-weight: bold; color: #008075;", onMouseOver: "this.style.color='#cc7eb1'", onMouseOut: "this.style.color='#008075'")+"にgoodしました"
      when "album_photo_good" then
      @album_photo_comment = AlbumPhotoComment.find_by(id: @visiter_album_photo_comment)&.comment
        tag.a(@visiter.name, href: user_path(@visiter),
        style:"font-weight: bold; color: #008075;", onMouseOver: "this.style.color='#cc7eb1'", onMouseOut: "this.style.color='#008075'")+"が"+tag.a('あなたのコメント',
        href: album_photo_image_path(notification.album_photo_image_id),
        style:"font-weight: bold; color: #008075;", onMouseOver: "this.style.color='#cc7eb1'", onMouseOut: "this.style.color='#008075'")+"にgoodしました"

    end
  end

  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end



end
