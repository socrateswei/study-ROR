json.followers @users do |user|
  json.id user.id
  json.name user.nickname
end
