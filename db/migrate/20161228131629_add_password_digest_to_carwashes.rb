class AddPasswordDigestToCarwashes < ActiveRecord::Migration
  def change
    add_column :carwashes, :password_digest, :string
  end
end
