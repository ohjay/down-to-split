Down to Split
===
Down to Split (D2S) is a Rails web application that helps people manage their finances. Users can track the purchases they make, compare expenses to a weekly budget, split costs with their friends, and find the lowest price for an item at nearby stores.

In progress.

Setup
---
### Installation
#### Ruby, Rails, and SQLite
You will need Ruby 2.2+, Ruby on Rails 4.2.0, and SQLite 3.

To install RVM and Ruby 2.2:
```
\curl -sSL https://get.rvm.io | bash -s stable --ruby=2.2.0
```

To install Rails 4.2.0:
```
gem install rails -v 4.2.0
```
More details can be found [here](http://rubyonrails.org/download/).

To install SQLite 3:
Follow the instructions [here](http://www.tutorialspoint.com/sqlite/sqlite_installation.htm).

#### D2S + Dependencies
Download the project files, `cd` into the directory, and install dependencies:
```
git clone https://github.com/ohjay/down-to-split.git
cd down-to-split
bundle install
```

### Database Initialization
Create and seed the database:
```ruby
rake db:migrate
rake db:seed
```

### Running the Application
Start the server:
```ruby
rails s
```
