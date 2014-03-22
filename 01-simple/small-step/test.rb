require_relative 'expressions.rb'

stmt = Assign.new(:x, Add.new(Variable.new(:x), Number.new(1)))
env = { x: Number.new(2) }
Machine.new(stmt, env)#.run


# if statement
Machine.new(
	If.new(
		Variable.new(:x),
		Assign.new(:y, Number.new(1)),
		Assign.new(:y, Number.new(2))
	), { x: Boolean.new(true) }
)#.run

# if, no else
Machine.new(
	If.new(
		Variable.new(:x), Assign.new(:y, Number.new(1)), DoNothing.new
	), { x: Boolean.new(false) }
)#.run


# some sequences
Machine.new(
	Sequence.new(
		Assign.new(:x, Add.new(Number.new(1), Number.new(1))),
		Assign.new(:y, Add.new(Variable.new(:x), Number.new(3)))
	), {}
)#.run


# looping
Machine.new(
	While.new(
		LessThan.new(Variable.new(:x), Number.new(5)),
		Assign.new(:x, Multiply.new(Variable.new(:x), Number.new(3)))
	), { x: Number.new(1) }
).run