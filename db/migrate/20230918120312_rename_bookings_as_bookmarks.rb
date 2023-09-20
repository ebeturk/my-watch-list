class RenameBookingsAsBookmarks < ActiveRecord::Migration[7.0]
  def change
    rename_table :bookings, :bookmarks
  end
end
