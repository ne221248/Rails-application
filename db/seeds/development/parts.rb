#CPU, OS, GPU, ケース, メモリ, ストレージ, マザーボード, 冷却機, 電源, 光学ドライブ

types = ["CPU", "GPU","OS", "マザーボード", "メモリ", "ストレージ", "電源", "ケース", "冷却機", "光学ドライブ"] 

cpu = ["'intel i5'", "'intel i7'", "'intel i9'", "'Ryzen 5'", "'Ryzen 7'", "'Ryzen 9'"]
cprices = [30000, 50000, 70000]
groups = ["intel", "AMD"]

0.upto(5) do |idx|
  part_type = PartType.find_by(kind: "CPU")
  Part.create(
    part_type: part_type,
    name: cpu[idx],
    price: cprices[idx % 3],
    group: idx < 3 ? groups[0] : groups[1],
    inventory: 10
  )
end

gpu = ["rtx4070", "rtx4080", "rtx4090", "RX7700", "RX7800", "RX7900"]
gprices = [100000, 200000, 300000]

0.upto(5) do |idx|
  part_type = PartType.find_by(kind: "GPU")
  Part.create(
    part_type: part_type,
    name: gpu[idx],
    price: gprices[idx % 3],
    group: idx < 3 ? groups[0] : groups[1],
    inventory: 10
  )
end

os = ["11 home", "11 pro"]
oprices = [10000, 20000]

0.upto(1) do |idx|
  part_type = PartType.find_by(kind: "OS")
  Part.create(
    part_type: part_type,
    name: os[idx],
    price: oprices[idx],
    inventory: 10
  )
end

motherboard = ["Z790", "Z760", "B650", "B550"]
mprices = [60000, 40000]

1.upto(4) do |idx|
  part_type = PartType.find_by(kind: "マザーボード")
  Part.create(
    part_type: part_type,
    name: motherboard[idx-1],
    price: mprices[idx % 2],
    group: idx < 3 ? groups[0] : groups[1],
    inventory: 10
  )
end

ram = ["8GB", "16GB", "32GB"]
rprices = [10000, 20000, 40000]

0.upto(2) do |idx|
  part_type = PartType.find_by(kind: "メモリ")
  Part.create(
    part_type: part_type,
    name: ram[idx],
    price: rprices[idx],
    inventory: 10
  )
end

storage = ["500GB", "1TB"]
sprices = [10000, 20000]

0.upto(1) do |idx|
  part_type = PartType.find_by(kind: "ストレージ")
  Part.create(
    part_type: part_type,
    name: storage[idx],
    price: sprices[idx],
    inventory: 10
  )
end

power = ["750W", "850W", "950W", "1000W"]
pprices = [10000, 20000]

1.upto(4) do |idx|
  part_type = PartType.find_by(kind: "電源")
  Part.create(
    part_type: part_type,
    name: power[idx-1],
    price: pprices[idx % 2],
    inventory: 10
  )
end

box = ["A", "B"]
bprices = [10000, 20000]

0.upto(1) do |idx|
  part_type = PartType.find_by(kind: "ケース")
  Part.create(
    part_type: part_type,
    name: box[idx],
    price: bprices[idx],
    inventory: 10
  )
end

cool = ["空冷", "水冷"]
coprices = [10000, 20000]

0.upto(1) do |idx|
  part_type = PartType.find_by(kind: "冷却機")
  Part.create(
    part_type: part_type,
    name: cool[idx],
    price: coprices[idx],
    inventory: 10
  )
end

drive = ["非搭載", "DVD", "Blu-ray"]
dprices = [0, 10000, 20000]

0.upto(2) do |idx|
  part_type = PartType.find_by(kind: "光学ドライブ")
  Part.create(
    part_type: part_type,
    name: drive[idx],
    price: dprices[idx],
    inventory: 10
  )
end
