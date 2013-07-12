class CreateMessageIndexOnError < ActiveRecord::Migration
  def up
    add_index(:errors, :message, { name: "errors_message_index", uniq: true, length: 16 })
  end

  def down
    remove_index(:errors, name: "errors_message_index")
  end
end
