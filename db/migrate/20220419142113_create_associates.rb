class CreateAssociates < ActiveRecord::Migration[7.0]
  def change
    create_table :associates do |t|
      t.references :meeting, null: false, foreign_key: true
      t.references :participant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
