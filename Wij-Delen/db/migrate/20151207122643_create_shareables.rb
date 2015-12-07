class CreateShareables < ActiveRecord::Migration
  def change
    create_table :shareables do |t|
      t.string :title
      t.text :text
      t.binary :image

      t.timestamps null: false
    end
  end
end
