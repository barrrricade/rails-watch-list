class AddMovieReferencesToBookmarks < ActiveRecord::Migration[6.0]
  def change
    remove_reference :bookmarks, :movie
    add_reference :bookmarks, :movie, foreign_key: true

  end
end
