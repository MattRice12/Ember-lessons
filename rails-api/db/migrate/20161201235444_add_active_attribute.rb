class AddActiveAttribute < ActiveRecord::Migration[5.0]
  def change
    add_column :monsters, :active, :boolean, default: false
  end
end
