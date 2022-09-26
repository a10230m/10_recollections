module Public::NotificationsHelper

  def notification_form(notification)
    @visiter = notification.visiter
    @photo_comment = nil
    your_photo_image = link_to 'あなたの投稿', userphotos_user_path(notification.visited_id), style:"font-weight: bold;"
    @visiter_photo_comment = notification.photo_comment_id
   #notification.actionがかlikeかcommentか
    case notification.action
      when "favorite" then
      tag.a(notification.visiter.name, href:users_user_path(@visiter), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href: photo_image_path(notification.photo_image_id), style:"font-weight: bold;")+"にいいねしました"
      when "photo_comment" then
      @photo_comment = PhotoComment.find_by(id: @visiter_photo_comment)&.comment
      tag.a(@visiter.name, href: user_path(@visiter), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href: photo_image_path(notification.photo_image_id), style:"font-weight: bold;")+"にコメントしました"
    end
  end

  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end



end
