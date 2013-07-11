class AddErrorIdToAttempt < ActiveRecord::Migration
  def change
    # We allow nulls for the default case when there are no erros
    add_column :attempts, :error_id, :integer, :null => true
  end
end
