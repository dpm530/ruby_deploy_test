class LikesController < ApplicationController

   def create
      @idea=Idea.find(params[:id])
      Like.create(user: current_user, idea: @idea) unless @idea.users.include?()

      return redirect_to :back
   end

   def destroy
      @idea=Idea.find(params[:id])
      @like=Like.find_by(user: current_user, idea: @idea)

      @like.destroy if @like

      return redirect_to :back
   end

end
