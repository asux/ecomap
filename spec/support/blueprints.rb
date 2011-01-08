require 'machinist/active_record'

# Add your blueprints here.
#
# e.g.
#   Post.blueprint do
#     title { "Post #{sn}" }
#     body  { "Lorem ipsum..." }
#   end

User.blueprint do
  email { Faker::Internet.email }
  password { 'secret' }
  password_confirmation { password }
  full_name { "#{Faker::Name.first_name} #{Faker::Name.last_name}" }
  info { Faker::Lorem.paragraph }
  role { User::ROLES.first }
end
