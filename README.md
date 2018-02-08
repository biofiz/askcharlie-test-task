## TEST DATA

1. Run irb console in project directory using command:
```bush
  irb -I .
```

2. Require the file in console:
```ruby
  require 'robot'
```

3. Run one by one this commands
```ruby
  robot = Robot.new
  robot.left # raises an error
  robot.place(2,1,'NORTH') # places robot in x_coordinate=2, y_coordinate=1, position='NORTH'
  robot.move # moves robot in y_coordinate=2 (x_coordinate=2, position='NORTH')
  robot.right # rotate robot 90 degrees right in position='EAST' (x_coordinate=2, y_coordinate=2)
  robot.move # moves robot in x_coordinate=3 (y_coordinate=2, position='EAST')
  robot.move # moves robot in x_coordinate=4 (y_coordinate=2, position='EAST')
  robot.move # raises an error (x_coordinate=4, y_coordinate=2 position='EAST')
  robot.left # rotate robot 90 degrees left in position='NORTH' (x_coordinate=4, y_coordinate=2)
  robot.report # print x_coordinate, y_coordinate and position of the robot ("# Output: 4,2,NORTH")
```
