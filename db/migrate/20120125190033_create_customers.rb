class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email_main
      t.string :phone
      t.text :address
      t.string :user_cpanel
      t.string :password_cpanel
      t.string :email_twitter
      t.string :password_twitter
      t.string :user_facebook
      t.string :password_facebook
      t.string :server
      t.string :language

      t.timestamps
    end
  end
end
