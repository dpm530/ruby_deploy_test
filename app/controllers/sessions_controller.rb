class SessionsController < ApplicationController

   def create
      @user=User.find_by_email(params[:email])

      if @user
         if @user.try(:authenticate, params[:password])
            session[:user_id]=@user.id

            return redirect_to ideas_path
         end
         flash[:errors]=["Password is Invalid."]

      end

      flash[:errors]=['Email Account is Invalid.']

      return redirect_to :back
   end


end
