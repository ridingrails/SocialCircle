class CreateSocialCircleMemberships < ActiveRecord::Migration
  def change
    create_table :social_circle_memberships do |t|
      t.integer :circle_id
      t.integer :user_id

      t.timestamps
    end
  end
end
