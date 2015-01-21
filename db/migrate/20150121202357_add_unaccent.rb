class AddUnaccent < ActiveRecord::Migration
  def change
    execute "create extension if not exists unaccent"
  end
end
