class AddContactsToCarwashes < ActiveRecord::Migration
  def change
    add_column :carwashes, :contacts, :string
  end
end
