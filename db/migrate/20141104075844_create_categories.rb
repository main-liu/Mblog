class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :blog_count

      t.timestamps
    end
  end
end
