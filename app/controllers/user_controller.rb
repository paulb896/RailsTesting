class UserController < ApplicationController
  def index
  end
  def schedule
    @user = User.find(:first, :conditions => [ "username = ?", params[:username] ])
    if @user.nil?
      redirect_to root
    end

    @schedule = @user.schedule
    puts @schedule
    @stuff = "Hello there"
    @other_stuff = "There is a bunch of other stuff here!!"
  end
end
