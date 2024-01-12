names = ["プランA", "プランB","プランC","プランD","プランE","プランF",]
descriptions = ["Aの説明", "Bの説明","Cの説明","Dの説明","Eの説明","Fの説明"]
usertypes = ["エントリー", "ミドル", "ハイエンド"]
prices = [100000, 200000,300000]
sales = [false, true]

0.upto(5) do |idx|
    Plan.create(
        name: names[idx],
        description: descriptions[idx],
        usertype: usertypes[idx%3],
        price: prices[idx%3],
        sale: true
    )
end
