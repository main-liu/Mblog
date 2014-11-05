class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :slug
      t.text :content
      t.text :html_content
      t.text :html_content_summary
      t.string :seo_kwd
      t.string :seo_desc
      t.integer :category_id
      t.integer :view_count
      t.integer :status

      t.timestamps
    end
  end
end
