class AddPhoneToTicket < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :phone, :string
  end
end
