# seedデータ
0.upto(0) do |idx|
  Admin.create(
    name: "管理者",
    password: "game", 
    password_confirmation: "game"
  )
end
