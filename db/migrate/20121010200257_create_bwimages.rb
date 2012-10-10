class CreateBwimages < ActiveRecord::Migration
  def change
    create_table :bwimages do |t|
      t.string :name
      t.string :avatar

      t.timestamps
    end
  end
end
