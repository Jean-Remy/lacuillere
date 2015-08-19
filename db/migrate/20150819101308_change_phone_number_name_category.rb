class ChangePhoneNumberNameCategory < ActiveRecord::Migration
  def change
    rename_column :restaurants, :telephone, :phone_number
  end
end
