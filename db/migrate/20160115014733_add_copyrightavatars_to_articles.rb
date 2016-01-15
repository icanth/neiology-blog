class AddCopyrightavatarsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :copyrightavatars, :text
  end
end
