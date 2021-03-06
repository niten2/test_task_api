class CreatePost < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string   :title, index: true
      t.string   :body, index: true
      t.integer  :author, index: true
      t.datetime :published_at, index: true

      t.timestamps null: false
    end
  end
end
