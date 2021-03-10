class CreateEcus < ActiveRecord::Migration[5.2]
  def change
    create_table :ecus do |t|
      t.string :name
      t.string :partnumber
      t.string :bootloader
      t.string :sw_version
      t.string :hw_version
      t.references :bench, foreign_key: true
    end
    #add_index :ecus, :bench_id
  end

end
