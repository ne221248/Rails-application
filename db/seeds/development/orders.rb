names = ["朝田創太", "菅野創太", "関根賢太郎", "立入雅史"] #変えてね
statuses = ["予約済み", "予約済み", "制作中", "発送済み"]
amounts = [200000, 300000, 150000, 180000]

0.upto(3) do |idx|
    member = Member.find_by(name: names[idx])
    Order.create(
        member: member,
        status: statuses[idx],
        amount: amounts[idx]
    )
end