names = ["プランA", "プランB", "プランC", "プランD", "プランE", "プランF"]
descriptions = ["Aの説明", "Bの説明","Cの説明","Dの説明","Eの説明","Fの説明"]
usertypes = ["エントリー", "ミドル", "ハイエンド"]
prices = [290000, 410000, 550000, 290000, 410000, 560000]
sales = [false, true]

0.upto(5) do |idx|
    Plan.create(
        name: names[idx],
        description: descriptions[idx],
        usertype: usertypes[idx%3],
        price: prices[idx],
        sale: true,
        cpu: 0,
        gpu: 0,
        os: 0,
        motherboard: 0,
        ram: 0,
        storage: 0,
        power: 0,
        box: 0,
        cool: 0,
        drive: 0
    )
end
