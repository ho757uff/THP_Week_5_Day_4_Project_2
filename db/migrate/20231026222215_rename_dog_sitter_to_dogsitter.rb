class RenameDogSitterToDogsitter < ActiveRecord::Migration[6.0] # or your specific Rails version
  def change
    rename_table :dog_sitters, :dogsitters
  end
end