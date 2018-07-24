class UsersController < ApplicationController

   def index
   end

   def new
   end

   def create
      @location=Location.existsOrCreate(params[:location][:city], params[:location][:state])

      @user=User.new(user_params)
      @user.location=@location

      if @user.save && @location.valid?

         flash[:notice]=["Registered Successfully"]

         session[:user_id]=@user.id

         return redirect_to '/events'

      end

      errors=@user.errors.full_messages+@location.errors.full_messages

      flash[:errors]=errors

      return redirect_to :back
   end

   private
      def user_params
         params.require(:user).permit(:name, :email, :password).merge(location: @location)
      end

end
