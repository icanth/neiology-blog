class AddAttachmentConverimageToArticles < ActiveRecord::Migration
  def self.up
    change_table :articles do |t|
      t.attachment :converimage
    end
  end

  def self.down
    remove_attachment :articles, :converimage
  end
end
