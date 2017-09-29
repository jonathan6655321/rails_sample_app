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

#Chapter 11:

* in order to add paramaters to a url add a hash argument: edit_account_activation_url(@user.activation_token, email: @user.email)

# Chapter 12:

* user:references automatically creates a user_id column for  the microposts a belongs_to migration

THIS IS NOT ENOUGH: need to create a `has_many :microposts` to user model in order to be able to create microposts in this way: `    @micropost = @user.microposts.build(content: "Lorem ipsum")
`
