class AddConfirmableToDevise < ActiveRecord::Migration
  def self.up
    add_column :therapists, :confirmation_token, :string
    add_column :therapists, :confirmed_at, :datetime
    add_column :therapists, :confirmation_sent_at, :datetime
    add_column :therapists, :unconfirmed_email, :string

    add_index :therapists, :confirmation_token, :unique => true
  end

  def self.down
    remove_index :therapists, :confirmation_token
    
    remove_column :therapists, :unconfirmed_email
    remove_column :therapists, :confirmation_sent_at
    remove_column :therapists, :confirmed_at
    remove_column :therapists, :confirmation_token
  end
end
