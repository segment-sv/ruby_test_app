# Welcome Weary Traveler, Follow these instructions to build an app to test your ruby calls!

First we need to create a segment Ruby source.

In your Segment workspace (app.segment.com and login) simply go to your Connections page (connections button on the left-hand nav) 

click 'Add Source'

In the sources catalogue, select, you guessed it 'Ruby'

Give the source a name and Add it, and you should see a write-key. We'll save that for later.

Now we want to install a rails app on our computer. This isn't going to work on Windows, so if you're using windows, stop here.

We're going to follow the instructions here to set up our Ruby app: https://medium.com/swlh/how-to-create-your-first-ruby-on-rails-application-in-no-time-a46ebde8f467

Go ahead and open a Terminal, either the generic mac terminal or I use iTerm2 and browse to the file directory where you want your ruby project to live. I use:

/Users/sheldon.vaughn/Documents/

But you can use whatever one you'd like.

Go ahead and run the first command to create your ruby app:

rails new your-app-name

I named mine 'ruby-test-app' so I ran the command:

rails new ruby-test-app

A bunch of new files are going to install and you will likely need to enter your password at least once. Everything should install successfully but if it doesn't, type the error into google and do what google says (within reason) or ping me directly.

Now in your terminal, cd into the folder you just created, if you aren't terminal savvy just type

cd your-app-name 

and this will change to the directory of the app you just created. Now you can simply launch a ruby app by typing

rails server

And browse to http://localhost:3000/ and you should see a picture of a bunch of excited people saying 'YAY you're on rails' 

Go ahead and kill the server in the terminal by running

Command + c

Boom, you've built a ruby app. Now it's time to add in some sweet sweet segment code. 

The first thing we want to do is install the segment package, ruby packages are known as 'gems' so run this command:

sudo gem install analytics-ruby

You will need to enter your password.

Next we are going to add the Segment code to our app by browsing to a file located here: config/initializers/analytics_ruby.rb

So from the directory of your project, type

cd config/initializers

and then we need to create a file called analytics_ruby.rb

So into the terminal enter

touch analytics_ruby.rb 

This will create the file, now we need to paste our code into it, as follows:

You can open the file to edit by running

vi analytics_ruby.rb 

This will open a unix text editor in which you need to enter a lowercase

i

to insert text, then paste the segment code:

require 'segment/analytics'

Analytics = Segment::Analytics.new({
    write_key: '<write_key>',
    on_error: Proc.new { |status, msg| print msg }
})

Analytics.identify(
    user_id: 'test-user-id-1',
    traits: {
        email: 'bob.dole@mail.com',
        first_name: 'Bob',
        last_name: 'Dole'
    }
)

Analytics.track(
    user_id: 'test-user-id-1',
    event: 'Item Purchased',
    properties: { revenue: 39.95, shipping: '2-day'})

puts 'done'


-------------------------------------------------

Make sure to enter your write key from the Segment UI on the fourth line where it says '<write_key>'. 

Now you need to save this file by pressing these keys:

esc - this will stop text from being inserted

: - This will tell the terminal you're going to enter some commands


wq! - This tells the terminal you want to write, quit, and save the file 

and now you should be back out of the terminal.

Next you want to cd ../.. to go back to your file directory and this time we're going to edit a file called Gemfiles

So again run 

vi gemfiles

press 'i' to insert

and paste this line into the very bottom of the file

gem "analytics-ruby", "~> 2.2"

and run the same ESC, :, wq!

Now in the terminal type

rails server 

to start your server again and in your debugger you should see the magic happening of any event you have saved in your analytics_ruby.rb file firing into the debugger and all your downstream destinations!








