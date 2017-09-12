namespace :utils do
  desc "Popular banco de Dados"
  task seed: :environment do
    puts('Gerando os contato (Contacts)...')
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        kind: Kind.all.sample,
        rmk: LeroleroGenerator.sentence([1,2,3,4,5].sample)
      )
    end
    puts('[OK]')
    
    puts('Gerando os endereços (Addresses)...')
    Contact.all.each do |contact|
      Address.create!(
        street: Faker::Address.street_name,
        city: Faker::Address.city,
        state: Faker::Address.state_abbr,
        contact: contact
      )
    end
    puts('[OK]')
    
    puts('Gerando os telefones (Phones)...')
    Contact.all.each do |contact|
      Random.rand(1..5).times do |i|
        Phone.create!(
          phone: Faker::PhoneNumber.phone_number,
          contact: contact,
        )
      end
    end
    puts('[OK]')
  end

end
