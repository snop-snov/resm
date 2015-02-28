res_count = Integer(ENV['RES_COUNT']) rescue nil
raise "Set correct resources count (Example: RES_COUNT=10)" unless res_count.present? && res_count > 0

res_ids = []

1.upto(res_count) do |n|
  res_ids << Resource.find_or_create_by(name: "r#{n}").id
end

Resource.where('id NOT IN (:ids)', ids: res_ids).delete_all
