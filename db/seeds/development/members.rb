names = ["朝田創太", "菅野 創太", "関根 賢太郎", "立入 雅史"]
mails = ["ne221248@senshu-u,jp", "example1@senshu-u.jp", "example2@senshu-u.jp", "example3@senshu-u.jp"]
addressis = ["相模原市", "川崎市", "町田市", "相模原市"]
telephones = ["08008192573", "00000000000", "09876543212", "12345678900"]

0.upto(3) do |idx|
    Member.create(
        name: names[idx],
        mail: mails[idx],
        address: addressis[idx],
        telephone: telephones[idx]
    )
end
