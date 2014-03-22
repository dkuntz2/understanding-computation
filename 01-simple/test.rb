require_relative 'expressions.rb'

# hey look, expressions work
exp = Add.new(
	Multiply.new(Number.new(1), Number.new(2)),
	Multiply.new(Number.new(3), Number.new(4))
)

# and machines do too
puts "Running an expression"
Machine.new(exp).run

# and even this new fangled less than thing...
puts "\n\nNow with booleans"
Machine.new(
	LessThan.new(Number.new(5), Add.new(Number.new(2), Number.new(2)))
).run

# also variables
puts "\n\nAnd Variables!!!!"
Machine.new(
	Add.new(Variable.new(:x), Variable.new(:y)),
	{ x: Number.new(3), y: Number.new(4) }
).run