class AddTicketToEvent < ActiveRecord::Migration
  def change
    add_reference :events, :ticket, index: true
  end
end
