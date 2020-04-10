extends Node2D

if true:
    pass
elif true:
    pass
else:
    pass

match x:
    1:
        print("We are number one!")
    2:
        print("Two are better than one!")
    "test":
        print("Oh snap! It's a string!")

match typeof(x):
    TYPE_REAL:
        print("float")
    TYPE_STRING:
        print("text")
    TYPE_ARRAY:
        print("array")

match x:
    1:
        print("It's one!")
    2:
        print("It's one times two!")
    _:
        print("It's not 1 or 2. I don't care to be honest.")

match x:
    1:
        print("It's one!")
    2:
        print("It's one times two!")
    var new_var:
        print("It's not 1 or 2, it's ", new_var)

match x:
    []:
        print("Empty array")
    [1, 3, "test", null]:
        print("Very specific array")
    [var start, _, "test"]:
        print("First element is ", start, ", and the last is \"test\"")
    [42, ..]:
        print("Open ended array")

match x:
    {}:
        print("Empty dict")
    {"name": "Dennis"}:
        print("The name is Dennis")
    {"name": "Dennis", "age": var age}:
        print("Dennis is ", age, " years old.")
    {"name", "age"}:
        print("Has a name and an age, but it's not Dennis :(")
    {"key": "godotisawesome", ..}:
        print("I only checked for one entry and ignored the rest")

match x:
    1, 2, 3:
        print("It's 1 - 3")
    "Sword", "Splash potion", "Fist":
        print("Yep, you've taken damage")

for x in [5, 7, 11]:
    statement # Loop iterates 3 times with 'x' as 5, then 7 and finally 11.

var dict = {"a": 0, "b": 1, "c": 2}
for i in dict:
    print(dict[i]) # Prints 0, then 1, then 2.

for i in range(3):
    statement # Similar to [0, 1, 2] but does not allocate an array.

for i in range(1, 3):
    statement # Similar to [1, 2] but does not allocate an array.

for i in range(2, 8, 2):
    statement # Similar to [2, 4, 6] but does not allocate an array.

for c in "Hello":
    print(c) # Iterate through all characters in a String, print every letter on new line.

for i in 3:
    statement # Similar to range(3)

for i in 2.2:
    statement # Similar to range(ceil(2.2))

while true:
    if test:
        break
    continue

if true and false:
    pass
elif true and true or false and not true and true is bool:
    pass

# A file is a class!

# Inheritance

extends BaseClass

# (optional) class definition with a custom icon

class_name MyClass, "res://path/to/optional/icon.svg"


# Member variables

var a = 5
var s = "Hello"
var arr = [1, 2, 3]
var dict = {"key": "value", 2: 3}
var typed_var: int
var inferred_type := "String"

# Constants

const ANSWER = 42
const THE_NAME = "Charly"

# Enums

enum {UNIT_NEUTRAL, UNIT_ENEMY, UNIT_ALLY}
enum Named {THING_1, THING_2, ANOTHER_THING = -1}

# Built-in vector types

var v2 = Vector2(1, 2)
var v3 = Vector3(1, 2, 3)


# Function

func some_function(param1, param2):
    var local_var = 5

    if param1 < local_var:
        print(param1)
    elif param2 > 5:
        print(param2)
    else:
        print("Fail!")

    for i in range(20):
        print(i)

    while param2 != 0:
        param2 -= 1

    var local_var2 = param1 + 3
    return local_var2


# Functions override functions with the same name on the base/parent class.
# If you still want to call them, use '.' (like 'super' in other languages).

func something(p1, p2):
    .something(p1, p2)


# Inner class

class Something:
    var a = 10


# Constructor

func _init():
    print("Constructed!")
    var lv = Something.new()
    print(lv.a)

# Casting
var my_node2D: Node2D
my_node2D = $Sprite as Node2D

var my_node2D: Node2D
my_node2D = $Button as Node2D # Results in 'null' since a Button is not a subtype of Node2D.

var my_int: int
my_int = "123" as int # The string can be converted to int.
my_int = Vector2() as int # A Vector2 can't be converted to int, this will cause an error.

# Will infer the variable to be of type Sprite.
var my_sprite := $Character as Sprite

# Will fail if $AnimPlayer is not an AnimationPlayer, even if it has the method 'play()'.
($AnimPlayer as AnimationPlayer).play("walk")

# Static
static func sum2(a, b):
    return a + b

breakpoint

# Load the class resource when calling load().
var my_class = load("myclass.gd")

# Preload the class only once at compile time.
const MyClass = preload("myclass.gd")

func _init():
    var a = MyClass.new()
    a.some_function()

# Coroutines with yield
func my_func():
    print("Hello")
    yield()
    print("world")

func _ready():
    var y = my_func()
    # Function state saved in 'y'.
    print("my dear")
    y.resume()
    # 'y' resumed and is now an invalid state.

# Check that 'i' is 0. If 'i' is not 0, an assertion error will occur.
assert(i == 0)

# Usage of remote
remote func register_player(info):
    # Get the id of the RPC sender.
    var id = get_tree().get_rpc_sender_id()
    # Store the info
    player_info[id] = info

puppet func stun():
    stunned = true

master func exploded(by_who):
    if stunned:
        return # Already stunned

    rpc("stun")
    stun() # Stun myself, could have used remotesync keyword too.

remotesync func register_player(info):
    # Get the id of the RPC sender.
    var id = get_tree().get_rpc_sender_id()
    # Store the info
    player_info[id] = info

puppetsync func stun():
    stunned = true

mastersync func exploded(by_who):
    if stunned:
        return # Already stunned

    rpc("stun")
    stun() # Stun myself, could have used remotesync keyword too.

# Constants
var p = PI
var t = TAU
var i = INF
var n = NAN

# Operators
x[index]
x.attribute
foo()
if a is bool:
    pass

~1
-x
x = 1 * 2 / 2 % 4 + 3 - 12 << 1 >> 2 & 3 ^ 1 | 32

1 < 2 > 1 <= 3 >= 4 == 2 != 3 and !a or not a
2==2 && 2 == 2 and 2 == 2 or 2 == 2 || 2 == 2
a if x else 2
a = 1
a += 1
a -= 1
a *= 1
a /= 1
a %= 1
a &= 1
a |= 1

for x in a:
    pass

45
0x8F51
0b101010
3.14
58.1e-10
"Hello"
"""Hello"""
@"Node/Label"
$NodePath

PoolByteArray()
PoolIntArray()
PoolRealArray()
PoolStringArray()
PoolVector2Array()
PoolVector3Array()
PoolColorArray()

var d = {4: 5, "A key": "A value", 28: [1, 2, 3]}
d["Hi!"] = 0
d = {
    22: "value",
    "some_key": 2,
    "other_key": [2, 3, 4],
    "more_key": "Hello"
}

var d = {
    test22 = "value",
    some_key = 2,
    other_key = [2, 3, 4],
    more_key = "Hello"
}

var d = {} # Create an empty Dictionary.
d.waiting = 14 # Add String "waiting" as a key and assign the value 14 to it.
d[4] = "hello" # Add integer 4 as a key and assign the String "hello" as its value.
d["Godot"] = 3.01 # Add String "Godot" as a key and assign the value 3.01 to it.

var my_vector2: Vector2
var my_node: Node = Sprite.new()

var my_vector2 := Vector2() # 'my_vector2' is of type 'Vector2'.
var my_node := Sprite.new() # 'my_node' is of type 'Sprite'.
