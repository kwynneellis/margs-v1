class AddReferralToEnquiries < ActiveRecord::Migration[7.0]
  def change
    add_column :enquiries, :referral, :string
  end
end
