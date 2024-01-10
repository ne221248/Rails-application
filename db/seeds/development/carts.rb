names = ["朝田創太", "菅野創太", "関根賢太郎", "立入雅史"]

0.upto(3) do |idx|
    member = Member.find_by(name: names[idx])
    Cart.create(member: member)
end