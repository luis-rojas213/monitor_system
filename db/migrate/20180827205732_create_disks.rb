class CreateDisks < ActiveRecord::Migration[5.2]
  def change
    create_table :disks do |t|
      t.bigint :total
      t.bigint :used
      t.bigint :free
      t.bigint :percentage

      t.timestamps
    end
  end
end
