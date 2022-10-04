class AddSelfIntroToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :self_intro, :varchar
  end
end
