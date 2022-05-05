class AddRespondToAssociate < ActiveRecord::Migration[7.0]
  def change
    add_column :associates, :respond, :string
  end
end
