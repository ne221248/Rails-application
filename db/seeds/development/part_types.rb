types = ["CPU", "OS", "GPU", "ケース", "メモリ", "ストレージ", "マザーボード", "冷却機", "電源", "光学ドライブ"]

0.upto(9) do |idx|
    PartType.create(
        kind: types[idx]
    )
end
        