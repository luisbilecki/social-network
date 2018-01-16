FactoryBot.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    password {Faker::Internet.password}
    avatar {Rack::Test::UploadedFile.new(File.join(Rails.root,
     'spec', 'fixtures', 'testfiles', 'testimage.png'))}
  end
end
