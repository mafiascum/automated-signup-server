json.array! @users do |user|
  json.id user.id
  json.role user.role
end
