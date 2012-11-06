class UserController < ApplicationController
  def index
    #puts "Index is here"
  end
  def schedule
    @user = User.where("user_name = '#{params[:username]}'")
    if @user.nil?
      redirect_to root
    @schedule = @user.schedule
    @stuff = "Hello there"
    @other_stuff = "There is a bunch of other stuff here!!"
    @availability = "User has no availability"
  end
end
