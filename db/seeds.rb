# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

tBigLeaf = Tag.create( name: "Big leaf" )
tTea = Tag.create( name: "Tea" )
tCoffee = Tag.create( name: "Coffee" )

pSome = Product.create( name: "Some sort of tea", cost: 12 )
pCoffee = Product.create( name: "Coffee", cost: 27 )
pHarrar = Product.create( name: "Эфиопия Харрар", cost: 25 )
pBigLeaf = Product.create( name: "Some big-leaf tea", cost: 22 )

ProductTag.create( product: pSome, tag: tTea )
ProductTag.create( product: pCoffee, tag: tCoffee )
ProductTag.create( product: pHarrar, tag: tTea )
ProductTag.create( product: pBigLeaf, tag: tTea )
ProductTag.create( product: pBigLeaf, tag: tBigLeaf )

Action.create( name: "Discount for Ephiopia Harrar", discount_type: Action::DISCOUNT_PERCENT, discount_value: 50, product: pHarrar, count: 2 )
Action.create( name: "Discount for big-leaf tea", discount_type: Action::DISCOUNT_VALUE, discount_value: 20, tag: tBigLeaf, count: 3 )
