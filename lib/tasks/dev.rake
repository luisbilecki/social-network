namespace :dev do
  desc "Setup development"
  task setup: :environment do

    puts "Running setup development task ..."

    puts "Dropping DB... #{%x(rake db:drop)}"

    puts "Creating DB... #{%x(rake db:create)}"
    puts %x(rake db:migrate)
    puts %x(rake db:seed)
    puts %x(rake dev:generate_users)
    puts %x(rake dev:generate_posts)

    puts "Task completed successfully!"

  end

  desc "Creating users"
  task generate_users: :environment do
    10.times do
      puts "Creating new user..."

      User.create!(name: Faker::Name.name,
                    email: Faker::Internet.email,
                    password: "123456",
                    password_confirmation: "123456")
    end

    puts "Users created successfully!"

  end

  desc "Creating posts"
  task generate_posts: :environment do
    User.all.each do |u|
      10.times do
        Post.create!(content: Faker::HowIMetYourMother.quote,
                     user: u)
      end
    end
  end

end
