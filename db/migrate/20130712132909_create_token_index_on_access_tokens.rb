class CreateTokenIndexOnAccessTokens < ActiveRecord::Migration
  def up
    # Since we are using rails generate for the token,
    # we are actually guaranteed uniqueness, which is 
    # neat.
    add_index(:access_tokens, :token, { name: "access_tokens_token_index", uniq: true, length: 16 })
  end

  def down
    remove_index(:access_tokens, name: "access_tokens_token_index")
  end
end
