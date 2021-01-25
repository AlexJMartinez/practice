class AddPhotoIdToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :photo_id, :integer
  end
end
