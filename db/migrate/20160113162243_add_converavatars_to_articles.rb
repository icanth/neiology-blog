class AddConveravatarsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :converavatars, :text
  end
end
