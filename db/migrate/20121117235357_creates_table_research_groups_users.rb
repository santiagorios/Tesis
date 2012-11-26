class CreatesTableResearchGroupsUsers < ActiveRecord::Migration
  def up
    create_table :users_research_groups, :id => false do |t|
      t.references :user
      t.references :research_group
    end
  end

  def down
    drop_table :users_research_groups
  end
end
