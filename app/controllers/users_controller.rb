class UsersController < ApplicationController

   def create
      @user=User.new(user_params)

      if @user.save

         flash[:notice]=["Registered Successfully"]

         session[:user_id]=@user.id

         return redirect_to '/ideas'
      end

      flash[:errors]=@user.errors.full_messages

      return redirect_to :back
   end

   def destroy
      user=User.find(params[:id])
      session.clear

      return redirect_to root_path

   end

   def show
      @user=User.find(params[:id])
      @ideas=Idea.where(user:@user)
      @ideas_liked=@user.ideas_liked
   end


   private
      def user_params
         params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
      end

end
