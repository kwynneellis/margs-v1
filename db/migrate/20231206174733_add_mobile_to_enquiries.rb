class AddMobileToEnquiries < ActiveRecord::Migration[6.1]
  def change
    add_column :enquiries, :mobile, :string
  end
end
