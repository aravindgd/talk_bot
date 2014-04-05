= TalkBot

## Talk Bot Rails Engine

```
# To copy migrations from engine
# cause engine uses its own sessions table
# to store caller, reciever number and duration for the call

rake talk_bot:install:migrations

# then run the migration

rake db:migrate
```

As said engine has its own sessions table to store `caller_number`,`reciever_number` and duration
We expect you to have one or two centralized table with `name`, `number` of the caller or reciever in table of your choice
All you have to do is extend the session table by creating it in your own app

```
mkdir app/models/talk_bot
cd app/models/talk_bot

# then create a file called session.rb
# and paste the following 

class TalkBot:: Session < ActiveRecord::Base
  belongs_to :caller, class_name: "Performer"
  belongs_to :reciever, class_name: "Client"
end
```
Instead of `Performer` and `Client` use your tables' model name

When creating a order or call_schedule just send the caller (one who calls) number and his id to session table also the number and id of reciever along with duration

```
example: if you have a Order controller to create order after saving the order
create an entry in session table as follows

TalkBot::Session.create(caller_id: @order.performer_id, caller_number: @order.performer.number, reciever_id: @order.client_id, reciever_number: @order.client.number, duration: @order.duration, order_id: @order.id)
```
Now if you visit `/talk_bot` the sessions will be listed. Just click call to make a call.

This project rocks and uses MIT-LICENSE.
