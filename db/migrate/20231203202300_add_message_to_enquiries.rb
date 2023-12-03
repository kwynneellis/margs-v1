class AddMessageToEnquiries < ActiveRecord::Migration[6.1]
  def change
    add_column :enquiries, :message, :string
  end
end
