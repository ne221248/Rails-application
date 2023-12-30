names = ["仮のプラン", "プランです"]
descriptions = ["この説明は仮です。Ruby on Railsの勉強の集大成。計画的に行こう", "かきくけこ"]
usertypes = ["エントリー", "ミドル", "ハイエンド"]
prices = [290000, 100000]
sales = [false, true]

0.upto(1) do |idx|
    Plan.create(
        name: names[idx],
        description: descriptions[idx],
        usertype: usertypes[idx],
        price: prices[idx],
        sale: true
    )
end