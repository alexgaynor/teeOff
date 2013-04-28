class AddHomeCourseToUser < ActiveRecord::Migration
  def change
    add_column :users, :homeCourse, :string
  end
end
