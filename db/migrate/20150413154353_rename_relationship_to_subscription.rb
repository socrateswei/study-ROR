class RenameRelationshipToSubscription < ActiveRecord::Migration
  def change
    rename_table :relationships, :subscriptions
  end
end
