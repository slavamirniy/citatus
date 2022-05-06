class CreateQuoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :quoutes do |t|
      t.text :content
      t.string :author
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :quoutes, [:user_id, :created_at]
  end
end
