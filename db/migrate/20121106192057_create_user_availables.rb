class CreateUserAvailables < ActiveRecord::Migration
  def change
    create_table :user_availables do |t|
      t.integer :user_id
      t.datetime :start_time
      t.datetime :end_time
      t.string :status

      t.timestamps
    end
  end
end
