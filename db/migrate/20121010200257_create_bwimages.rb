class CreateBwimages < ActiveRecord::Migration
  def change
    create_table :bwimages do |t|
      t.string :title
      t.string :photo
      t.string :camera
      t.date   :date
      t.string :author
      t.string :filename
      t.string :status
      t.string :url

      t.timestamps
    end
  end
end
