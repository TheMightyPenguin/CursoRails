class CreateJoinTableCarsPeople < ActiveRecord::Migration
  def change
    create_join_table :cars, :people do |t|
      # t.index [:car_id, :person_id]
      # t.index [:person_id, :car_id]
    end
  end
end
