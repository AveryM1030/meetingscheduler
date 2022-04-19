class CreateAppearances < ActiveRecord::Migration[7.0]
  def change
    create_table :appearances do |t|
      t.references :meeting, null: false, foreign_key: true
      t.references :host, null: false, foreign_key: true

      t.timestamps
    end
  end
end
