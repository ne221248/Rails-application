names = ["朝田創太", "菅野 創太", "関根 賢太郎", "立入 雅史"]

0.upto(3) do |idx|
    member = Member.find_by(name: names[idx])
    Cart.create(member: member)
end