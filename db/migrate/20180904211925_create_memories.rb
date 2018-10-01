class CreateMemories < ActiveRecord::Migration[5.2]
  def change
    create_table :memories do |t|
      t.integer :memory
      t.bigint :total
      t.bigint :used
      t.bigint :free

      t.timestamps
    end
  end
end
