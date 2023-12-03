class ChangeDatetimeToDateInEnquiry < ActiveRecord::Migration[6.1]
  def change
    change_column(:enquiries, :check_in, :date)
    change_column(:enquiries, :check_out, :date)
  end
end
