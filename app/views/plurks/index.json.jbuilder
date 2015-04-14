json.plurks @plurks do |plurk|
  json.plurk plurk
  if plurk.replies.present?
    json.replies plurk.replies
  end
end
