class ChangeOpeningHourClosingHour < ActiveRecord::Migration
  def change
    change_column :restaurants, :opening_hour, :time
    change_column :restaurants, :closing_hour, :time
  end
end
