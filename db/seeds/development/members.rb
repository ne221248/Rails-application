names = ["朝田創太", "菅野創太", "関根賢太郎", "立入雅史", "admin", "operator"]
mails = ["ne221248@senshu-u,jp", "example1@senshu-u.jp", "example2@senshu-u.jp", "example3@senshu-u.jp", "admin@senshu-u.jp", "operator@senshu-u.jp"]
addressis = ["相模原市", "川崎市", "町田市", "相模原市", "専修大学", "G倉庫"]
telephones = ["08008192573", "00000000000", "09876543212", "12345678900", "01937839271", "09081728371"]
passwords = ["pocha", "pocha", "pocha", "pocha", "game", "game"]

0.upto(5) do |idx|
    Member.create(
        name: names[idx],
        mail: mails[idx],
        address: addressis[idx],
        telephone: telephones[idx],
        password: passwords[idx],
        password_confirmation: passwords[idx]
    )
end
