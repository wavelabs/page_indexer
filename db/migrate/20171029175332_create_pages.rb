class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.text :url
      t.text :content

      t.timestamps
    end
  end
end
