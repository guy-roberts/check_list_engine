# Check List Engine

This Rails Engine provides a way to store designs of check list or audits, to change those designs and to store instances
of these check lists in action.  The components of a check list can be text, photos, signatures, choices, address, yes / no, dates and titles.

The idea is that somebody designs a checklist with these components and then delegates the job of actually completing them to another person who usually has
less experience of performing the task.


## Examples

For example, the task of inspecting a rental house to see what maintainance work needs to be done might be represented as a check list
containing

* a title
* an address
* a text description of the state of the property
* a photograph showing work that needs to be done
* a photograph after work is completed
* a text description of what was done
* signature from the tenant
* a date 

Another example could be the task of locking up a cafe at night

* a title
* a Yes / No field "Have all the chairs been put on the tables ?"
* a Yes / No field "Has the floor in front of the counter been washed down ?"
* a Yes / No field "Have the friers been emptied and cleaned ?"
* a Yes / No field "Have you checked that the freezer's temperature is below 15 degrees ?"
* a photo of the counter
* a signature


This repository only contains the server side part of the project, the front ends will be written in other
Javascript projects, Angular and Ionic.

This engine code does not contain any authentication code.



## Usage

Data is served in json-api format, so you'll need a component on the client side
to translate it into useful stuff.

## Installation
Add the engine in your gemfile and then bundle

```ruby
gem 'check_list_engine', :git => 'git@github.com:guy-roberts/check_list_engine.git' # Token based authentication for Rails JSON APIs
```

There is no need to copy the migrations, leave them in the engine. Instead just

```ruby
rake db:migrate
```

and they will be found from the engine.



## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
