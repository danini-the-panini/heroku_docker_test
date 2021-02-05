class CreateThings < ActiveRecord::Migration[6.1]
  def change
    create_table :things do |t|
      t.string :foo
      t.string :bar

      t.timestamps
    end
  end
end
