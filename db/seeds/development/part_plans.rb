#中間テーブル
plan_id = [1,2,3,4,5,6]
part_id = [1, 2, 1, 2]

#A
plan = Plan.find_by(id: 1)
cpu  = Part.find_by(id: 1) #1
gpu  = Part.find_by(id: 7) #2
os   = Part.find_by(id: 13) #3
mo   = Part.find_by(id: 16) #4
ram  = Part.find_by(id: 20) #5
st   = Part.find_by(id: 22) #6
po   = Part.find_by(id: 24) #7
box  = Part.find_by(id: 28) #8
cool = Part.find_by(id: 30) #9
dr   = Part.find_by(id: 34) #10

parts = [cpu,gpu,os,mo,ram,st,po,box,cool,dr]

0.upto(9) do |idx|
    PartPlan.create(
        plan: plan,
        part: parts[idx]
    )
end

#B
plan = Plan.find_by(id: 2)
cpu  = Part.find_by(id: 2)#1
gpu  = Part.find_by(id: 8)#2
os   = Part.find_by(id: 13)#3
mo   = Part.find_by(id: 15)#4
ram  = Part.find_by(id: 20)#5
st   = Part.find_by(id: 23)#6
po   = Part.find_by(id: 26)#7
box  = Part.find_by(id: 29)#8
cool = Part.find_by(id: 30)#9
dr   = Part.find_by(id: 34)#10

parts = [cpu,gpu,os,mo,ram,st,po,box,cool,dr]

0.upto(9) do |idx|
    PartPlan.create(
        plan: plan,
        part: parts[idx]    
    )
end


#C
plan = Plan.find_by(id: 3)
cpu  = Part.find_by(id: 3)#1
gpu  = Part.find_by(id: 9)#2
os   = Part.find_by(id: 13)#3
mo   = Part.find_by(id: 15)#4
ram  = Part.find_by(id: 21)#5
st   = Part.find_by(id: 23)#6
po   = Part.find_by(id: 27)#7
box  = Part.find_by(id: 29)#8
cool = Part.find_by(id: 31)#9
dr   = Part.find_by(id: 34)#10

parts = [cpu,gpu,os,mo,ram,st,po,box,cool,dr]

0.upto(9) do |idx|
    PartPlan.create(
        plan: plan,
        part: parts[idx]   
    )
end


#D
plan = Plan.find_by(id: 4)
cpu  = Part.find_by(id: 4)#1
gpu  = Part.find_by(id: 10)#2
os   = Part.find_by(id: 13)#3
mo   = Part.find_by(id: 18)#4
ram  = Part.find_by(id: 20)#5
st   = Part.find_by(id: 22)#6
po   = Part.find_by(id: 24)#7
box  = Part.find_by(id: 28)#8
cool = Part.find_by(id: 30)#9
dr   = Part.find_by(id: 34)#10

parts = [cpu,gpu,os,mo,ram,st,po,box,cool,dr]

0.upto(9) do |idx|
    PartPlan.create(
        plan: plan,
        part: parts[idx]
        
    )
end


#E
plan = Plan.find_by(id: 5)
cpu  = Part.find_by(id: 5)#1
gpu  = Part.find_by(id: 11)#2
os   = Part.find_by(id: 15)#3
mo   = Part.find_by(id: 17)#4
ram  = Part.find_by(id: 20)#5
st   = Part.find_by(id: 23)#6
po   = Part.find_by(id: 26)#7
box  = Part.find_by(id: 28)#8
cool = Part.find_by(id: 30)#9
dr   = Part.find_by(id: 34)#10

parts = [cpu,gpu,os,mo,ram,st,po,box,cool,dr]

0.upto(9) do |idx|
    PartPlan.create(
        plan: plan,
        part: parts[idx]
        
    )
end


#F
plan = Plan.find_by(id: 6)
cpu  = Part.find_by(id: 6)#1
gpu  = Part.find_by(id: 12)#2
os   = Part.find_by(id: 15)#3
mo   = Part.find_by(id: 17)#4
ram  = Part.find_by(id: 21)#5
st   = Part.find_by(id: 23)#6
po   = Part.find_by(id: 27)#7
box  = Part.find_by(id: 29)#8
cool = Part.find_by(id: 31)#9
dr   = Part.find_by(id: 34)#10

parts = [cpu,gpu,os,mo,ram,st,po,box,cool,dr]

0.upto(9) do |idx|
    PartPlan.create(
        plan: plan,
        part: parts[idx]
    )
end

