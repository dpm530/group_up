class CommentsController < ApplicationController

   def create
      @event=Event.find(params[:id])
      @comments=Comment.new(comment_params)

      if @comments.save
         flash[:notice]=["New Comment Created."]

         return redirect_to :back
      end

      errors=@comments.errors.full_messages
      flash[:errors]=errors

      return redirect_to :back
   end

   private
      def comment_params
         params.require(:comment).permit(:content).merge(user: current_user).merge(event: @event)
      end


end
