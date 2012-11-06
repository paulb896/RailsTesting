class UserController < ApplicationController
  def index
    #puts "Index is here"
  end
  def schedule
    @user = User.first
    if @user.nil?
      redirect_to root
    end

    @schedule = @user.schedule
    @stuff = "Hello there"
    @other_stuff = "There is a bunch of other stuff here!!"
    @availability = "User has no availability"
  end
end
