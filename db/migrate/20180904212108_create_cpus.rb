class CreateCpus < ActiveRecord::Migration[5.2]
  def change
    create_table :cpus do |t|
      t.bigint :total
      t.bigint :used
      t.bigint :percentage

      t.timestamps
    end
  end
end
