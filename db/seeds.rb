# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

monuments = Monumnet.create([{ 
  name: 'Taj Mahal', description: 'The Taj Mahal, which means crown of palaces in the Persian language, stands on the riverbanks of the Yamuna River in Agra in northern India.'
  availability: true, price: $12000
  name: 'Statue of Liberty', description: 'The monument stands on Liberty Island in the Hudson River facing New York City. You can climb up the 154 steps from the pedestal to the head of the statue where you can see the fantastic views over the ‘Big Apple’ as New York is often lovingly called.'
  availability: true, price: $9000
  name: 'The Moscow Kremlin', description: 'The Grand Kremlin Palace is part of the Kremlin complex and is located next to the Red Square and St Basil’s Cathedral in Russia’s capital city Moscow.'
  availability: true, price: $12500
  name: 'Great Sphinx of Giza', description: 'The Sphinx is a monolith carved from the bedrock of the plateau, which also served as the quarry for the pyramids and other monuments in the area.[14] The archaeological evidence suggests that the Great Sphinx was created around 2500 BC for the pharaoh Khafre, the builder of the Second Pyramid at Giza.[15] The stones cut from around the Sphinxs body were used to construct a temple in front of it, however both the enclosure and this temple were never completed and the relative scarcity of Old Kingdom cultural material suggests that a Sphinx cult was not established at the time'
  availability: true, price: $15000
  name: 'Chichen Itza', description: 'The layout of Chichen Itza site core developed during its earlier phase of occupation, between 750 and 900 AD.[19] Its final layout was developed after 900 AD, and the 10th century saw the rise of the city as a regional capital controlling the area from central Yucatán to the north coast, with its power extending down the east and west coasts of the peninsula.[20] The earliest hieroglyphic date discovered at Chichen Itza is equivalent to 832 AD, while the last known date was recorded in the Osario temple in 998.'
  availability: true, price: $25000
  }])
