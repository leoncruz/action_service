![](https://github.com/leoncruz/action_service/workflows/Rubocop/badge.svg)
![](https://github.com/leoncruz/action_service/workflows/Rubycritic/badge.svg)
![](https://github.com/leoncruz/action_service/workflows/Tests/badge.svg)

# ActionService
A simple rails plugin to create Service Objects

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'action_service'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install action_service
```

## Usage


#### Define a Service
```ruby
class UserRegistration < ActionService::Base
  attr_accessor :name, :email, :password

  actions :create_user, :send_welcome_email

  def create_user
    faliure errors: user.errors unless user.save
  end

  def send_welcome_email
    UserRegistrationMailer.welcome(to: email).deliver_later

    success user: user
  end

  def user
    @user ||= User.new(attribtues)
  end
end
```
1. Create a class that inherits from ActionService::Base

2. Define attr_accessors. They will be the parameters that the service will receive

* You can use **attributes** to access all attr_accessors as a hash

3. Define actions that the service will execute as a list of symbols. This actions are the methods name on service

4. Create methods

5. When a faliure occours, calls a **faliure** method passing a hash as argument

6. For success, calls a **success** method passing a hash as argument as well

#### Use the Service

```ruby
class UsersController < ApplicationController
  def create
    result = UserRegistration.call(**user_params)

    if result.success?
      render json: result.user, status: :created
    else
      render json: result.errors, status: :bad_request
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
```
1. Use the **call** class method to execute and pass parameters

2. You can use the hash argument passed for the **faliure** and **success** methods for getting information about your service

* The keys of hash become instance variables with your values

On service

```ruby
faliure errors: user.errors
```
Or
```ruby
faliure user_errors: user.errors
```

Getting the result
```ruby
result.errors
```
Or
```ruby
result.user_errors
```
The same happend to hash informed on **success** method


## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
