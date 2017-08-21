class IdeasController < ApplicationController

  def index
     @ideas=Idea.all.sort{|a,b|b.likes.count<=>a.likes.count}


  end

  def create
      @user = current_user
      @idea = Idea.new(content: params[:content], user: @user)
      unless @idea.save
         flash[:errors]=@idea.errors.full_messages
      end
      return redirect_to :back
   end

   def destroy
      @idea=Idea.find(params[:id])
      if @idea.user==current_user
         @idea.destroy
      end
      return redirect_to :back
   end

   def show
      @ideas=Idea.find(params[:id])
   end

   private
     	def idea_params
     		params.require(:post).permit(:content, :user_id)
     	end

end
