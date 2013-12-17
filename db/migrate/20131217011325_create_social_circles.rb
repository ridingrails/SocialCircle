class CreateSocialCircles < ActiveRecord::Migration
  def change
    create_table :social_circles do |t|
      t.string :name

      t.timestamps
    end
  end
end
