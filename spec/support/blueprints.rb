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

Sample.blueprint do
  type { Ecomap::HasSampleKinds::KINDS.sample.camelize + 'Sample'}
  object_name { "пр. Григоренко 15" }
  lng { 30.62920957803727 }
  lat { 50.40988188370294 }
  owner { User.first or User.make! }
  description { object_name }
end

EcoParameter.blueprint do
  type { Ecomap::HasSampleKinds::KINDS.sample.camelize + 'EcoPrameter'}
  name { Faker::Lorem::words.rand }
  description { Faker::Lorem::paragraph }
  unit { "unit#{sn}" }
end

EcoProperty.blueprint do
  sample { Sample.make!(:kind => Ecomap::HasSampleKinds::KINDS.first) }
  eco_parameter { EcoParameter.make!(:kind => Ecomap::HasSampleKinds::KINDS.first) }
  value { Kernel.rand * 100 }
end

WaterSample.blueprint do
  # Attributes here
end

SoilSample.blueprint do
  # Attributes here
end

WaterEcoParameter.blueprint do
  # Attributes here
end

SoilEcoParameter.blueprint do
  # Attributes here
end
