class ClubsController < ApplicationController
  def show
  	@club = Club.find(params[:id])
    @unsorted_events = Event.where(club_id: @club.id)
    @events = @unsorted_events.sort { |a,b| a.event_time <=> b.event_time }
  end

  def admin
  	if params[:approved] == "false"
      @clubs = Club.find_all_by_approved(false)
    else
      @clubs = Club.all
    end
  end

  def index
  	@clubs = Club.all
    @sorted_clubs = @clubs.sort { |a,b| a.name.downcase <=> b.name.downcase }
  end

  def my_clubs
  end

  def like
    @club = Club.find params[:club_id]
    @club.users << current_user
    @club.save
    redirect_to @club
  end
end
