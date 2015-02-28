FactoryGirl.define do
  factory :resource, aliases: [:deallocated_resource] do
    name
  end

  factory :allocated_resource, parent: :resource do
    user_id { create(:user).id }
  end
end
