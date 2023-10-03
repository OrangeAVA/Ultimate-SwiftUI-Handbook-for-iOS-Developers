import Cocoa

// String is the Type represent Text
let greeting: String = "Hello, playground"
let myName: String = "James Thang"

// Int is for whole Number
var myAge: Int = 26

// Since it it 2023 so I am 1 year older
myAge += 1

// Current Temperature, not know yet because data is being calculate
var temperature: Int?

// Now we have data, which is 26 Celcius
temperature = 26

if let temperature {
    print("Current temperature is \(temperature)")
}

// Data is recalculate, so set to unknown
temperature = nil

if let temperature {
    print("Current temperature is \(temperature)")
} else {
    print("We are recalculating, please wait")
}


// Force unwrapping
let optionalValue: Int? = 42
let unwrappedValue = optionalValue!


// Optional Binding If let
if let unwrappedValue = optionalValue {
    // Use unwrappedValue safely here
} else {
    // Handle the case when optionalValue is nil
}

// Optional Binding Guard let

func processValue(_ optionalValue: Int?) {
    guard let unwrappedValue = optionalValue else {
        return // Exit early if optionalValue is nil
    }
    // Use unwrappedValue safely here
}

let optionalNilValue: Int? = nil
let unwrappedNilValue = optionalNilValue ?? 0 // If optionalValue is nil, unwrappedValue will be 0


struct SomeStruct {
    var value: Int
}

let optionalStruct: SomeStruct? = SomeStruct(value: 42)
let result = optionalStruct?.value
// result will be an Int? containing 42, or nil if optionalStruct is nil

// Arithmetic Operators

1 + 2
5 - 3
2 * 3
10.0 / 2.5

// Comparison Operators
1 == 1   // true because 1 is equal to 1
2 != 1   // true because 2 isn't equal to 1
2 > 1    // true because 2 is greater than 1
1 < 2    // true because 1 is less than 2
1 >= 1   // true because 1 is greater than or equal to 1
2 <= 1   // false because 2 isn't less than or equal to 1

// Assignment operators
var a = 1
a += 2

// Range operators
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

// Time in 24 hour format
//var time = 8
var weather = "raining"

//if time <= 10 && weather == "raining" {
//    print("Book a Car to work because it is raining")
//}

if !(weather == "raining") {
    print("It is not raining, we can go outside and play.")
} else {
    print("It is raining, we should stay inside.")
}

let hungry = true
let thirsty = false

if hungry || thirsty {
    print("Let's get something to eat and drink.")
} else {
    print("We are not hungry or thirsty.")
}

// Time in 24 hour format
var time = 8

if time <= 12 {
    print("Good morning")
} else if time <= 18 {
    print("Good afternoon")
} else {
    print("Good evening")
}

switch time {
case 0...12:
    print("Good morning")
case 13...18:
    print("Good afternoon")
default:
    print("Good evening")
}


let b = 5
let c = 10

var min = b < c ? b : c
print(min)

if b < c {
    min = b
} else {
    min = c
}
print(min)



var daysOfWeek: [String] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]

// Add more items to Array
daysOfWeek.append("Saturday")
daysOfWeek.append("Sunday")

// Access item in an Array
// First day of the week
daysOfWeek[0]

// Last day of the week
daysOfWeek[daysOfWeek.count - 1]

var dateOfWeek: [String] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]


for day in dateOfWeek {
    print(day)
}

for (index, day) in dateOfWeek.enumerated() {
    print("Index \(index) : \(day)")
}

// Favourite Fruit of our friends
var names: [String : String] = ["Anna": "Apple", "Brian": "Banana", "Craig": "Coconut"]

// Anna Favorite Fruit
let favoriteFruit = names["Anna"]

// Check mine, unexisted yet
let myFavoriteFruit = names["James"]

// Adding my Favorite Fruit
names["James"] = "Watermelon"
names

// Update Anna favourite fruit
names["Anna"] = "Orange"
names

// Remove Brian favourite fruit
names["Brian"] = nil
names

var alphabetArray = ["a", "b", "c"]

// Define a Function that can append 2 Element
func append2Element(element1: String, element2: String) {
    alphabetArray.append(element1)
    alphabetArray.append(element2)
}

// Execute by calling it
append2Element(element1: "d", element2: "e")
alphabetArray

// Define a function to add 2 value
func add2ValueWithReturn(a: Int, b: Int) -> Int {
    return a + b
    
    // Won't be execute
    a * b
}

let result1 = add2ValueWithReturn(a: 1, b: 2)
result1

func add2ValueNoReturn(a: Int, b: Int) {
    a + b
}

let result2 = add2ValueNoReturn(a: 1, b: 2)
result2


func doSomething(fn: (Int) -> Int, x: Int) -> Int {
    let result = fn(x)
    return result
}

// This is the function that will be passed as an argument
func double(x: Int) -> Int {
    return x * 2
}

// Now we can call `doSomething` and pass the `double` function as an argument
let resultsOfDoSomething = doSomething(fn: double, x: 10)
resultsOfDoSomething
// Output: Result: 20

// Now with Closure, we can pass it Directly without have to define a double function
let resultsOfDoSomethingClosure = doSomething(fn: { $0 * 2 }, x: 10)
resultsOfDoSomethingClosure


var globalVariable = "I am a global variable"

func someFunction() {
    let localVariable = "I am a local variable"
    globalVariable // "I am a global variable"
    localVariable // "I am a local variable"
}

someFunction()
globalVariable
// Error: localVariable is not defined in this scope
//localVariable

if true {
    let blockVariable = "I am a block variable"
    blockVariable // "I am a block variable"
}

// Error: blockVariable is not defined in this scope
//blockVariable

struct Student {
    let id: String                  // Student ID
    let name: String                // Student Name
    let isMale: Bool                // Student gender: Male or Female
    var age: Int                    // Student Age
    var scores: [String : Double]   // Ex: Math : 9.1
    
    func singASong() -> String {
        return name + " sing a Song"
    }
    
    mutating func increaseAge(number: Int) {
        age = age + number
    }
}

var studentJohn = Student(
    id: UUID().uuidString,
    name: "John",
    isMale: true,
    age: 23,
    scores: [
        "Math" : 9,
        "Physic" : 8.4,
        "Computer Science" : 8.5
    ]
)

studentJohn.singASong()
studentJohn.increaseAge(number: 5)
studentJohn.age




studentJohn.age = 24
//studentJohn.isMale = false


class StudentClass {
    let id: String                  // Student ID
    let name: String                // Student Name
    let isMale: Bool                // Student gender: Male or Female
    var age: Int                    // Student Age
    var scores: [String : Double]   // Ex: Math : 9.1
    
    init(id: String, name: String, isMale: Bool, age: Int, scores: [String : Double]) {
        self.id = id
        self.name = name
        self.isMale = isMale
        self.age = age
        self.scores = scores
    }
    
    func singASong() -> String {
        return name + " sing a Song"
    }
    
    func increaseAge(number: Int) {
        age = age + number
    }
}

let studentEmma = StudentClass(
    id: UUID().uuidString,
    name: "Emma",
    isMale: false,
    age: 22,
    scores: [
        "Math" : 5,
        "Physic" : 8.4,
        "Computer Science" : 7.5
    ]
)

print("")
print("")


class MyClass {
  var myProperty: String = "Hello" {
    willSet(newValue) {
      print("About to set myProperty to \(newValue)")
    }
    
    didSet(oldValue) {
      print("myProperty was changed from \(oldValue) to \(myProperty)")
    }
  }
}

let myInstance = MyClass()
myInstance.myProperty = "World" // About to set myProperty to World, myProperty was changed from Hello to World
