types = ["CPU","GPU","OS","マザーボード","メモリ", "ストレージ", "電源","ケース", "冷却機",  "光学ドライブ"]

0.upto(9) do |idx|
    PartType.create(
        kind: types[idx]
    )
end
