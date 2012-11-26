class ChangesReferenceFromUserToResearchGroup < ActiveRecord::Migration
  def up
    rename_column(:programs, :user_id, :research_group_id)
  end

  def down
    rename_column(:programs, :research_group_id, :user_id)
  end
end
