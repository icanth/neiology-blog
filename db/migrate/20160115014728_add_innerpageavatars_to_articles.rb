class AddInnerpageavatarsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :innerpageavatars, :text
  end
end
