namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      spinner = TTY::Spinner.new("[:spinner] Bora rodar isso daí? ...", format: :bouncing_ball)
      spinner.auto_spin
      %x(bundle)
      %x(rails db:drop db:create db:migrate dev:add_users dev:add_types dev:add_coins)
      spinner.success("Já acabou!!")
    else
      puts "Not in Development!"
    end
  end

  desc "Cria moedas"
  task add_coins: :environment do
    coins = [
      {
        description: "Bitcoin",
        acronym: "BTC",
        url_image: "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMMAAAECCAMAAAB0YpM9AAAAhFBMVEX////3kxr3jgD3jAD2iQD3khT3kQ33kAj3kRH+7uL//fv2iAD70a73kAP7y6P7zaf95tT7yJ36uoH96tv+8+r5r2n++fT838j6v4z+7+T5q2H83MP6wpL4plT95NH6von5sW/4nDr82Lv4okn4qVv3liX4n0H4nTv81LT5tnn3mTD4pE6UDtdvAAALHUlEQVR4nO2d55ryIBCFDZCia9+1fPa+lvu/vy+JLQWUGYaYPM+e3xpzhJc6A7WaZV36mx/bv2FZwy+fi+B0rLKPKXccxw19eKfjv0+/DFJL5lzl+qyqPtau81TsY1U1H0PhZBT64P5q8ekXAyjGISdXTD/9YgA9cEhLDD/9YgClcHiWw/rT7wVQHodYbPnpFwNIjoPDJTj0B8168S+oIQAOe8Y4W5XQhz4OP3GtC9tdVrLyAOCwedS6kvmA4NBKfiL20SmFDwgOuVoX+uCDY/EvnZECh3P+kz/yWsc/3gijcEh7GBX/1mmhcXjWukbxb53W2ASHSMGh+JfOSB8HVa2bFf/Sei/2h0Ox+sPBsYIDcP5YRhy+v8R2NtKvoWXEocOcgHF9H8Y4uPQ4DLz4ydo+yohDompEPg5vfJQSh8wPvfNRUhxyeuXDHIdfagu1gS99J6UPcxzG5B7kVePpY5ueAlcBB5kPPuh075+vCg45hVNgMZ+NoipfJRxyiurVuT89VAyH/Ku2uNRCyXHQkxQHRa37DA7vJcPhXDocXqpCOCgV7PLbiYXhUKfx4ASc73qLVE2vGg6RvLDt/V0+4x8qhsPzDUMfznW/vTgc6Irh6eO6z6AoYVkjbCYqHHLymeLfod/8bVooh5eysPk7KdqDBRzaE86ZLx8CWRE9DpHqx5MjOCvIh71YiJ/N8lyIDwsrS0kNp6EP5tn2YD2uZtiZC7ul4XJ+sh7iNOypWnYq+dzpWQ9kHMtHCXRymdjZ3gjqKiachPK407a7F/TP1hAkobAw+lar1Mh2dYrFxMBm5AbxmFwlX0zsxZPWCymI2MXKWo2SrwzbcWEr/mRW4IiWMTuRQIpVCUviBxtYLAr14ARfPXoPRGuY+uK/5GwXXA6hArEh9tDTZZpxsomHONF6uASaFo7DTf83nEBRzDzYlnQMpdvH8bhBaSxoZua+QzhX1caBPb8Tzsw9wcwGKQGja2R1cfBX6e/9aw7M+HA5mYm5Lg7N/He7s73BjNblVG2sNg7ywfO/3hltw/VomMDgkFF95nFcW+XRrGdicUhrtBOokSN7+VRdmeCQ1E8f5UJQjGMNcUhoOBbyiIfXJsyRIMAh4eIkNEv1KX9u7IEGh4fqv+ABpPn6OBUOD7UFsKF1HVMPdDjc9W8PZJsbYk2Kw107WH0yLQhiHG46wUwYEjHX7F+1cbiqDzLh7Yw80ONw1QDEhFEf0bWBQ6wzpKMwWnSyg0MkRaKZ4vEDAw+WcIikvdIQiRt4sIVDJA/Q12Gef5M9HGqwWCOOX2/SxgFTXxsAIhh++dIiDqEm+nM7H79kZhMHUKROgO7lrOIAWovGB0ZYxUEZIifVHuvBLg76VTUS1oNdHGABtUgLlnEAecDWJcs4QOoSOvZvZxmHH0C7hF3csI0DYI/MW+F+wjoOgAFTCxmDaR0HQCAI6+B+wjYOkGYJm2VgG4cRxANuM8U6DpCYIuQ8rqfpAYsDZEIdIJvW/nav9XwsDitAMWCzrHWXdpE4dCEDPiTStnFwIKvfAvcbbWsrS7HmkP137Fqlbu/g9zHriLBkCyxy2o23L85jwGkWsS6wHQjkcqs2Ds41A+vS675/6E2LABbIga1KujjcFWUjz3s6YfQ/A+hmFnb7QReHpKLMvsNy87KtXQwENJrGdXEW0LmjYb3iYttvLiQDnJ9Nn3F4PBBHjlkhOOQVtCIn+91p1j5upqPRdNOcnS5M8BYi9sTFjsegOEh/3PMZC81EYswHb67fxLFDewwOdiRLx9ZT4dGgSn3pt9lpmeFAKdbHFgMFDiQK0DWpPDgYBPSVpSp94fPnCg9SV+jLIOq7JDiYWCgHDq4wyv0rQ1VijlGQcQlwcIVJdEOtDDgwZhrD92kcmDA/tO+jVSmcgCzNI1q1cfBoMk5SBsS5Q5F/oouDN6m3B+H8ADOxkSo0MCNKfNUNo7jua/w79qMzFLAznOTzCLOodasS/75/ozGazQlSmfiSyoQ2Dpk9gW57Z1oeDD3vzEgfh/x3u72DQKxcPMXXJEDAcMhpuDkxg0ym4IviFBo4Djktxi7eBjsbJzJhccg+ZtnCVqrAOPXEBIe0RitsPpZALwRcZYhDSo3OHpePxc1yTwhwSGo0B68RR2Jrg66CCIfkEwcCURb+GW+CDoen6hN4JlNoAu2BEoenumv4eL61xXogxuGhJrylxaYo0uNw1xCYBOSgV+1t4HBXE7oP5whUj20Hh5vqHrCBClCRiLZwuKqxBuaLYrbi7OFw0xaa3gfvJXSjBDE4XHWANU+I8yCt4nCV/LBypeBH7drFIRYgMDf+t9rA51vHIdIRdhI6NFjdPg6RdDMSbn8XcF+0ABxqwOw+8BWfBeAQCRKNCK1MheAA+Z1YsAFHMTjUVMd9q/4w0K6cNg7Q9i4r0EFzsG6uIBxgkd6wSLiicIAllTkuJBVIt4SNcQDuNOUDdJeq8IGGdmCxKQ7AQVMuMnQjuJi3ZRV6ottqG+MAPAEzF3fyG8Txj3ySveh2rF2+xjhAG9eMh+87TV764uHGQNsCAQ6wKw6yp5Kluvnowt7JbLNYbE6AlRMCHECJotlyyDdqXhz4CBnAEOAAu6aBp5mmOImVAAfYYaqZqRxBBAAFDooLwFQeUt+FTaHkosABlIOSCXAFNWkKEeAAG3unC57kHFYCHBS3BSmUnsgBzoJQigAH7UHNzUNy5Rg2j1U90RwHYOOYWhRQXGAPkzkO0L8y1bSShFaZ43CA7WulsvBJrsPyDEMFoUBnkAYudMoVXDZmkQi6mbQPJROaQHPYFya42Pen6IC7GbhdSc6AYCuEr+S2uFiD0/piTcB/ZPKqc+ILEFyNS5FzmnrwY0OTBy/BhllaitL61kttPhYXzNUq4jndhJw5BVGUDhfOo6bvjAyba44Jk0suzFgNf47nUZd+ZySPMm90exdsFFAygd21fpXGNa/PvazG7eN00f0O1R1tOuPB3iRSUTz/FsUFxfRyA/+e1nfL7YOcYJdTslXaWr/By45S0Q7f8Tn6lfORG51Vz4d8H6taPr6UTXZlfLw5QeW7UwEf4n3cdNl96B5kU2Yfahoq4wO6uR5ybpy8QCzcMQKL2ba4C1LfCn3qbGM0Xhd1W9xr+UZHeg8/n2kZ1SSj1KASZIsaJX9H+ny2aAiDYbIlxcqyoZjpStznq1LL9EZkFQ6ssN7DN74TSHWH/Sac2BfSezDza40UOES9ZmMUXa9NluKqsHAxtqDA4TGGHG76juD2rm3nK3MLChzSG0rHU2CWUqmS+2UUsXmTCofsdCT0QW+B7W1mi8oGkdSNsEeSKqp8MdmUivh8o0BciG7t08HhJtA9Gu/k8QPZ9fK6ONRIN2WYmJA5AOGgmGf4YU8I6dJdxp0e6dW0xjiwY617XM6Z0LliNNqF+Z2ZB4CkZI7DPXBt2D3OBr88ssJafpDeO7ivjl/G+N1JpYxxcFvpTw2/R8defzBfu1w8xM7z1aw5snRv+UCOgyw4QI7DqxNpG8NIpLfoymSOA9HhEnipcJAMYt7g8DmZ9w6t/CcLluLkcxocCtIfDk6ZcZB0pH84WNQfDo7RTXVEMscBe3oynf5wcMqAgyKxolI4KG7Vk+GgOAzyDwcKyU8YqhQOw/FWtkNdKRxq8XGHOR+VwuGujI9K4ZDU4uFDFmdfWhxyuvqQHVpT2rmDVIvZuoo4aKgSOLxWdXBQq8y9g64UdyxVCofZRdafVwqHSIvePOujUjjcdfXxaGYrhUNS3aePSuGQ1dUH9lzG8ui7MzE9vvet/gNgBdTwk1bglwAAAABJRU5ErkJggg==",
        mining_type: MiningType.all.sample,
        user_id: 1
      },
      {
        description: "Ethereum",
        acronym: "ETH",
        url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/ETHEREUM-YOUTUBE-PROFILE-PIC.png/640px-ETHEREUM-YOUTUBE-PROFILE-PIC.png",
        mining_type: MiningType.all.sample,
        user_id: 1
      }
    ]

    coins.each do |coin|
      Coin.find_or_create_by(coin)
    end
  end

  desc "Cria tipos de mineração"
  task add_types: :environment do
    mining_types = [
      {description: "Proof of Work", acronym: "PoW", user_id: 1},
      {description: "Proof of Stake", acronym: "PoS", user_id: 1},
      {description: "Proof of Capacity", acronym: "PoC", user_id: 1}
    ]
    mining_types.each do |type|
      MiningType.find_or_create_by(type)
    end
  end

  desc "Cria Usuários"
  task add_users: :environment do
    jean = User.new(name: 'Jean', email: "jeanrmsodre@gmail.com", password: "Jean!123", is_admin: true)
    rafa = User.new(name: 'Rafael', email: "rafaelsouza@gmail.com", password: "Rafa!123", is_admin: false)
    jean.save!
    rafa.save!
  end
end
