#Chapter 10:


* When constructing a form using form_for(@user), Rails uses POST if @user.new_record? is true and PATCH if it is false.

* `create!` is like `create` except it raises exceptions if invalid paramaters, instead of just returning false!

* creating a boolean value in a model creates a `.name?` method

$ rails test
$ git push heroku
$ heroku pg:reset DATABASE
$ heroku run rails db:migrate
$ heroku run rails db:seed
$ heroku restart
