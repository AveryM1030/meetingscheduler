class CreateParticipants < ActiveRecord::Migration[7.0]
  def change
    create_table :participants do |t|
      t.string :fullname
      t.string :email

      t.timestamps
    end
  end
end
