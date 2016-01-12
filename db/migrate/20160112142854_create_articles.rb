class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :page_refer
      t.string :title
      t.string :author
      t.string :translate
      t.string :site
      t.string :editor
      t.string :press
      t.string :print
      t.string :print_date
      t.string :kword
      t.string :book_size
      t.decimal :price
      t.text :remark
      t.integer :pages_num
      t.string :cateory
      t.string :journal
      t.integer :amount
      t.string :inner_flag
      t.text :text
      t.text :old_text
      t.string :bindery
      t.string :attr

      t.timestamps null: false
    end
  end
end
