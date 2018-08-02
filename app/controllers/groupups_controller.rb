class GroupupsController < ApplicationController

   def create
      @event=Event.find(params[:id])

      Groupup.create(user: current_user, event: @event)

      return redirect_to :back
   end

   def destroy
      @event=Event.find(params[:id])

      Groupup.find_by(event:@event, user: current_user).delete

      return redirect_to :back
   end


end
