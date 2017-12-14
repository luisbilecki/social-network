namespace :dev do
  desc "Setup development"
  task setup: :environment do

    puts "Running setup development task ..."

    puts "Dropping DB... #{%x(rake db:drop)}"

    puts "Creating DB... #{%x(rake db:create)}"
    puts %x(rake db:migrate)
    puts %x(rake db:seed)

    puts "Task completed successfully"

  end
end
