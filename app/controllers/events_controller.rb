class EventsController < ApplicationController


   def index
      @groupups=Event.all
   end

   def new
   end

   def create
      @location=Location.existsOrCreate(params[:event][:city], params[:event][:state])

      @event=Event.new(event_params)


      if @event.save && @location.valid?
         flash[:notice]=["New Event Created."]

         return redirect_to events_path
      end

      errors=@event.errors.full_messages+@location.errors.full_messages

      flash[:errors]=errors

      return redirect_to :back

   end

   def show
      @event=Event.find(params[:id])
   end

   def edit
      @event=Event.find(params[:id])
   end

   def update
      @location=Location.existsOrCreate(params[:location][:city], params[:location][:state])

      @event=Event.find(params[:id])

      if @location.valid?
         if @event.update(event_params)
            flash[:notice]=["Updated Event"]

            return redirect_to events_path
         end
      end

      errors=@user.errors.full_messages + @location.errors.full_messages

      flash[:errors]=errors
      return redirect_to :back

   end

   def destroy
      @event=Event.find(params[:id])

      @event.delete

      return redirect_to events_path
   end

   private
      def event_params
         params.require(:event).permit(:name, :date, :time, :description).merge(user: current_user).merge(location: @location)
      end


end
