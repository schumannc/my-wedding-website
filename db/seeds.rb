## This file should contain all the record creation needed to seed the database with its default values.
## The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
##
## Examples:
##
##   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
##   Mayor.create(name: 'Emanuel', city: cities.first)
#Admin.delete_all
#
#Admin.create!(
#user: 'hscosta',
#password: 'lljh422',
#password_confirmation: 'lljh422'
#)
#
#Confirmation.delete_all
#Message.delete_all
#
#
#Order.delete_all
#LineItem.delete_all
#Presente.delete_all
#Presente.create!(item: 'Sala',
#	url: 'sala',
#	image_url: 'presentes/min_Ap_10.jpg',
#	description: 'Para recebê-los com carinho',
#	details: 'Planejados, piso e acabamento do teto'
#)
#Presente.create!(item: 'Cozinha',
#	url: 'cozinha',
#	image_url: 'presentes/min_Ap_20.jpg',
#	description: 'Aqui a Pamela passa longe',
#	details: 'Planejados, piso e acabamento do teto'
#)
#Presente.create!(item: 'Quarto',
#	url: 'quarto',
#	image_url: 'presentes/min_Ap_30.jpg',
#	description: 'O ninho de amor dos pombinhos',
#	details: 'Planejados, piso e acabamento do teto'
#)
#Presente.create!(item: 'Quarto do Bebê',
#	url: 'quartodobebe',
#	image_url: 'presentes/min_Ap_40.jpg',
#	description: 'Calma, ainda não! Esse é pro futuro',
#	details: 'Planejados, piso e acabamento do teto'
#
#)
#Presente.create!(item: 'Banheiro',
#	url: 'banheiro',
#	image_url: 'presentes/min_Ap_50.jpg',
#	description: 'Nada como uma boa ducha',
#	details: 'Planejados, piso e acabamento do teto'
#)
#Presente.create!(item: 'Varanda',
#	url: 'varanda',
#	image_url: 'presentes/min_Ap_60.jpg',
#	description: 'Para arejar as ideias',
#	details: 'Planejados, piso e acabamento do teto'
#
#)
##ITENS SALA
#Presente.find_by(url: 'sala').line_items.create!(item: 'Móveis Planejados',
#	url: 'planejado',
#	image_url: 'itens/planejado_sala.png',
#	valor: 2000
#)
#Presente.find_by(url: 'sala').line_items.create!(item: 'Almofadas Decorativas',
#	url: 'almofadas',
#	image_url: 'itens/almofadas.png',
#	valor: 200
#)
#Presente.find_by(url: 'sala').line_items.create!(item: 'TV 40" SMART',
#	url: 'tv',
#	image_url: 'itens/tv.png',
#	valor: 1600
#)
#
#Presente.find_by(url: 'sala').line_items.create!(item: 'Sofá',
#	url: 'sofa',
#	image_url: 'itens/sofa.png',
#	valor: 3400
#)
#Presente.find_by(url: 'sala').line_items.create!(item: 'Luminária',
#	url: 'luminaria',
#	image_url: 'itens/luminaria.png',
#	valor: 650
#)
#Presente.find_by(url: 'sala').line_items.create!(item: 'Poster',
#	url: 'poster',
#	image_url: 'itens/poster.png',
#	valor: 450
#)
##ITENS COZINHA
#Presente.find_by(url: 'cozinha').line_items.create!(item: 'Móveis Planejados',
#	url: 'planejado',
#	image_url: 'itens/planejado_cozinha.png',
#	valor: 2000
#)
#Presente.find_by(url: 'cozinha').line_items.create!(item: 'Conjunto de Panelas',
#	url: 'panelas',
#	image_url: 'itens/panelas.png',
#	valor: 400
#)
#Presente.find_by(url: 'cozinha').line_items.create!(item: 'Cooktop',
#	url: 'cooktop',
#	image_url: 'itens/cooktop.png',
#	valor: 400
#)
#Presente.find_by(url: 'cozinha').line_items.create!(item: 'Nespresso',
#	url: 'nespresso',
#	image_url: 'itens/nespresso.png',
#	valor: 350
#)
#Presente.find_by(url: 'cozinha').line_items.create!(item: 'Coifa',
#	url: 'coifa',
#	image_url: 'itens/coifa.png',
#	valor: 800
#)
#Presente.find_by(url: 'cozinha').line_items.create!(item: 'Forno de Embutir',
#	url: 'forno',
#	image_url: 'itens/forno.png',
#	valor: 2900
#)
#Presente.find_by(url: 'cozinha').line_items.create!(item: 'Torneira com Filtro Deca',
#	url: 'torneira',
#	image_url: 'itens/torneira.png',
#	valor: 1100
#)
#Presente.find_by(url: 'cozinha').line_items.create!(item: 'Micro-ondas',
#	url: 'microondas',
#	image_url: 'itens/microondas.png',
#	valor: 1100
#)
#
##ITENS QUARTO
#Presente.find_by(url: 'quarto').line_items.create!(item: 'Móveis Planejados',
#	url: 'planejado',
#	image_url: 'itens/planejado_quarto.png',
#	valor: 3000
#)
#Presente.find_by(url: 'quarto').line_items.create!(item: 'TV Monitor LED 19"',
#	url: 'tv',
#	image_url: 'itens/tv.png',
#	valor: 400
#)
#Presente.find_by(url: 'quarto').line_items.create!(item: 'Conjunto Box Baú + Colchão',
#	url: 'cama',
#	image_url: 'itens/cama.png',
#	valor: 1800
#)
#
#Presente.find_by(url: 'quarto').line_items.create!(item: 'Lustres 2x',
#	url: 'lustre',
#	image_url: 'itens/lustre_quarto.png',
#	valor: 400
#)
#
#Presente.find_by(url: 'quarto').line_items.create!(item: 'Cadeira',
#	url: 'cadeira',
#	image_url: 'itens/cadeira.png',
#	valor: 500
#)
#
#
##ITENS Quarto do Bêbe
#Presente.find_by(url: 'quartodobebe').line_items.create!(item: 'Móveis Planejados',
#	url: 'planejado',
#	image_url: 'itens/planejado_bebe.png',
#	valor: 1000
#)
#Presente.find_by(url: 'quartodobebe').line_items.create!(item: 'Berço',
#	url: 'berco',
#	image_url: 'itens/berco.png',
#	valor: 1300
#)
#Presente.find_by(url: 'quartodobebe').line_items.create!(item: 'Cômoda',
#	url: 'comoda',
#	image_url: 'itens/comoda.png',
#	valor: 850
#)
#Presente.find_by(url: 'quartodobebe').line_items.create!(item: 'Poltrona',
#	url: 'poltrona',
#	image_url: 'itens/poltrona.png',
#	valor: 500
#)
#
#
##ITENS Banheiro
#Presente.find_by(url: 'banheiro').line_items.create!(item: 'Reforma do Banheiro',
#	url: 'reforma',
#	image_url: 'itens/revestimento.png',
#	valor: 1200
#)
#Presente.find_by(url: 'banheiro').line_items.create!(item: 'Louças',
#	url: 'cuba',
#	image_url: 'itens/cuba.png',
#	valor: 900
#)
#Presente.find_by(url: 'banheiro').line_items.create!(item: 'Torneira',
#	url: 'torneira',
#	image_url: 'itens/torneira_banheiro.png',
#	valor: 550
#)
#
##ITENS Varanda
#Presente.find_by(url: 'varanda').line_items.create!(item: 'Banco 2 Lugares',
#	url: 'banco',
#	image_url: 'itens/banco.png',
#	valor: 700
#)
#Presente.find_by(url: 'varanda').line_items.create!(item: 'Jardim Vertical',
#	url: 'jardim',
#	image_url: 'itens/jardim.png',
#	valor: 400
#)
#Presente.find_by(url: 'varanda').line_items.create!(item: 'Mesinha de Centro',
#	url: 'mesinha',
#	image_url: 'itens/mesa.png',
#	valor: 350
#)
##ITENS COZINHA
#Presente.find_by(url: 'cozinha').line_items.create!(item: 'Fritadeira Elétrica',
#	url: 'fritadeira',
#	image_url: 'itens/fritadeira.jpg',
#	valor: 1200
#)
#Presente.find_by(url: 'cozinha').line_items.create!(item: 'Juicer',
#	url: 'juicer',
#	image_url: 'itens/juicer.jpg',
#	valor: 250
#)
#Presente.find_by(url: 'cozinha').line_items.create!(item: 'Máquina de Macarrão',
#	url: 'maquina_de_macarrao',
#	image_url: 'itens/maquina_de_macarrao.jpg',
#	valor: 350
#)
#Presente.find_by(url: 'cozinha').line_items.create!(item: 'Panela Elétrica',
#	url: 'panela_eletrica',
#	image_url: 'itens/panela_eletrica.jpg',
#	valor: 350
#)
#Presente.find_by(url: 'cozinha').line_items.create!(item: 'Torradeira',
#	url: 'torradeira',
#	image_url: 'itens/torradeira.jpg',
#	valor: 500
#)
#Presente.find_by(url: 'sala').line_items.create!(item: 'Home Theater',
#	url: 'home_theater',
#	image_url: 'itens/home_theater.jpg',
#	valor: 850
#)

#LineItem.all.each do |item|
#img_url = item.image_url
#puts img_url
#img_url = img_url.sub(/.png/, ".jpg")
#puts img_url
#item.image_url = img_url
#item.save
#end

mod = LineItem.find_by(item:'Torradeira')
puts mod
mod.valor = 200
mod.save

Presente.find_by(url: 'sala').line_items.create!(item: 'Aspirador Vertical',
	url: 'aspirador',
	image_url: 'itens/aspirador_de_po.jpg',
	valor: 350
)

Presente.find_by(url: 'sala').line_items.create!(item: 'Plafon LED',
	url: 'plafon',
	image_url: 'itens/plafon.jpg',
	valor: 150
)

Presente.find_by(url: 'sala').line_items.create!(item: 'Pendente',
	url: 'pendente',
	image_url: 'itens/pendente.jpg',
	valor: 100
)

Presente.find_by(url: 'sala').line_items.create!(item: 'Mesa Lateral',
	url: 'mesa_lat',
	image_url: 'itens/mesa_lateral.jpg',
	valor: 100
)