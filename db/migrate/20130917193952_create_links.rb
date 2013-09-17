class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.text :url
      t.integer :post_id, index: true

      t.timestamps
    end
  end
end
