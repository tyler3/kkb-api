class DeviseTokenAuthModifyUsers < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      dir.up do
        add_column :users, :provider, :string,  null: false, default: "code"
        add_column :users, :uid, :string, null: false, default: ""
        add_column :users, :tokens, :text
        execute <<-SQL
          update users set uid = code;
        SQL
        add_index :users, [:uid, :provider], unique: true
      end
      dir.down do
        remove_index :users, [:uid, :provider]
        remove_column :users, :provider
        remove_column :users, :uid
      end
    end
  end
end
