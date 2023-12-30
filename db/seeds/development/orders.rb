names = ["朝田創太", "菅野 創太", "関根 賢太郎", "立入 雅史"]
statuses = ["予約", "予約", "制作中", "発送済み"]
amounts = [200000, 300000, 150000, 180000]

0.upto(3) do |idx|
    member = Member.find_by(name: names[idx])
    Order.create(
        member: member,
        status: statuses[idx],
        amount: amounts[idx]
    )
end