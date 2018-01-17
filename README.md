# Social Network App

A simple social network app developed using Ruby on Rails 5.


--------------

## Requirements

This application requires:

* Ruby 2.4
* Rails 5.1.4
* PostgreSQL

--------------
## How to run

1.Clone this repository using the command:

```
git clone https://github.com/luisbilecki/social-network.git
```

2.Change to app directory:

```
cd desafio-programacao-1b
```

3.Install the dependencies:

```
bundle
```

or

```
bundle install
```

4.Create the database:

```
rails db:drop db:create
```

5.Run the db:migrate command:

```
rails db:migrate
```

6.Start the server/app:

```
rails s -b 0.0.0.0 -p 3000
```

7.Open the following URL in your browser:

```
http://localhost:3000
```

To run RSpec tests:

```
rspec spec/
```

## Things to do

* Improve the CSS coding
* Add a profile cover photo
* Add calendar events
* Set i18n for entire app
* Add live chat functionality
* Improve the image (profile photo) uploading
