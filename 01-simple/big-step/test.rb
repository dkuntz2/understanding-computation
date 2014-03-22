require_relative 'expressions.rb'

puts Number.new(23).evaluate({})
puts Variable.new(:x).evaluate({x: Number.new(23)})

puts While.new(
	LessThan.new(Variable.new(:x), Number.new(5)),
	Assign.new(:x, Multiply.new(Variable.new(:x), Number.new(3)))
).evaluate( { x: Number.new(1) })