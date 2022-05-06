class AddRespondToParticipants < ActiveRecord::Migration[7.0]
  def change
    add_column :participants, :respond, :string
  end
end
