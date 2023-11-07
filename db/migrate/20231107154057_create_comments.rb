class CreateComments < ActiveRecord::Migration[7.0]
  def change
    drop_table :comments
    create_table :comments do |t|
      t.text :content
      t.string :name
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
