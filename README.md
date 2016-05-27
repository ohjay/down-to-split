![alt text](app/assets/images/logo.png)

`Owen Jow, Sagang Wee, Kavi Mehta`

Down to Split is a web application that helps people manage their finances. Users can track the purchases they make, compare expenses to a weekly budget, split costs with their friends, and find the lowest price for an item at nearby stores.


Setup (for new devs!)
---
### Installation (for OS X)
#### Ruby, Rails, and SQLite
You will need Ruby 2.2+, Ruby on Rails 4.2.0, and SQLite 3.

To install RVM and Ruby 2.2:
```
\curl -sSL https://get.rvm.io | bash -s stable --ruby=2.2.4
```

To install Rails 4.2.0:
```
gem install rails -v 4.2.0
```

To install SQLite 3:
Follow the instructions [here](http://www.tutorialspoint.com/sqlite/sqlite_installation.htm).

#### Files and Dependencies
Download the project files. Then `cd` into the newly created `down-to-split` directory:
```
git clone https://github.com/ohjay/down-to-split.git
cd down-to-split
```

Install dependencies:
```ruby
gem install bundler
bundle install
```

### Database Initialization
If you don't have it already, you'll need to install Postgres (yes, the actual application!). Download the appropriate package [here](https://www.postgresql.org/), then follow the steps below in order to create and seed the database:
```ruby
rake db:create
rake db:migrate
rake db:seed
```

### Running the Application
Make sure that Postgres is running on port 5432. Usually, this is as simple as launching the Postgres app that you installed [in the previous section](#database-initialization). On OS X, you should see a little elephant pop up in the status bar if the launch is successful.

Once that's done, you'll want to start the server:
```ruby
rails s # uses the default Rails port (3000)
```

At this point, you should be able to open the website by visiting [localhost:3000](http://127.0.0.1:3000/) in your browser. Congratulations!


License
---
The project is distributed under the terms of the [Apache License](LICENSE).

> Copyright 2016 Sagang Wee, Kavi Mehta, Owen Jow
>
> Licensed under the Apache License, Version 2.0 (the "License");
> you may not use this file except in compliance with the License.
> You may obtain a copy of the License at
> 
> http://www.apache.org/licenses/LICENSE-2.0
> 
> Unless required by applicable law or agreed to in writing, software
> distributed under the License is distributed on an "AS IS" BASIS,
> WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
> See the License for the specific language governing permissions and
> limitations under the License.
