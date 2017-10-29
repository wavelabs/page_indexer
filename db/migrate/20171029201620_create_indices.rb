class CreateIndices < ActiveRecord::Migration[5.1]
  def change
    create_table :indices do |t|
      t.belongs_to :page, foreign_key: true
      t.string :tag
      t.text :link
      t.text :content

      t.timestamps
    end
  end
end
