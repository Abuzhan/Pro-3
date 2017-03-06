class SetDefaultValueForStatusInOoffoerderservices < ActiveRecord::Migration
  def change
  	change_column_default :offorderservices, :status, :t
  end
end
