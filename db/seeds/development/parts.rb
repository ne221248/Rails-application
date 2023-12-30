#CPU, OS, GPU, ケース, メモリ, ストレージ, マザーボード, 冷却機, 電源, 光学ドライブ
types = ["CPU", "OS"] 
names = ["仮のパーツ", "パーツ"]
prices = [20000, 12000]
groups = ["intel", "AMD"]
inventories = [1, 3]

0.upto(1) do |idx|
    part_type = PartType.find_by(kind: types[idx])
    Part.create(
        part_type: part_type,
        name: names[idx],
        price: prices[idx],
        group: groups[idx],
        inventory: inventories[idx]
    )
end