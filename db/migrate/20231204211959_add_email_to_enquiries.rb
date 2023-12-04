class AddEmailToEnquiries < ActiveRecord::Migration[6.1]
  def change
    add_column :enquiries, :email, :string
  end
end
