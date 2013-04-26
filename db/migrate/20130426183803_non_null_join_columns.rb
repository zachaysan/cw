class NonNullJoinColumns < ActiveRecord::Migration
  def up
    change_column_null :consumers, :producer_id, false
    change_column_null :webhooks, :consumer_id, false
  end

  def down
    change_column_null :consumers, :producer_id, true
    change_column_null :webhooks, :consumer_id, true
  end
end
