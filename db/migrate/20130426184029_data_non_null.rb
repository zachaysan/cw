class DataNonNull < ActiveRecord::Migration
  def up
    change_column_null :webhooks, :data, false
  end

  def down
    change_column_null :webhooks, :data, true
  end
end
