class AddPrintedavatarsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :printedavatars, :text
  end
end
