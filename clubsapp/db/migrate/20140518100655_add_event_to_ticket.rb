class AddEventToTicket < ActiveRecord::Migration
  def change
    add_reference :tickets, :event, index: true
  end
end
