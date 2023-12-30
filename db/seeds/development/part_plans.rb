plan_id = [1, 1, 2, 2]
part_id = [1, 2, 1, 2]

0.upto(3) do |idx|
    plan = Plan.find_by(id: plan_id[idx])
    part = Part.find_by(id: part_id[idx])
    PartPlan.create(
        plan: plan,
        part: part
    )
end