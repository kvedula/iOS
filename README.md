# iOS
iOS Lessons for Tech Lab

Introduction to iOS
===

Welcome to iOS @ TechLab. Here you will be able to get some of the basic concepts of iOS 
and soon move on to more advanced topics as the lessons progress.


## Getting started

Make sure you have a folder on the desktop of your computer that has your name on it.

Open up XCode6-Beta3, go to the **File** menu, and select "New > Playground". Today we're going to learn the Swift programming language - if it makes sense to you immediately, you can move on to the [first app](first-app.md) page and get a head start on building your first iPhone app.

When you have a playground open, hit **Alt - Command - Enter** to also bring up the console where you can see the output of what you print.

## The Swift language

A quick reference on the language things I'm going to cover.

### Constants

```swift
let constantValue = 56
let anotherConstant = 23
let yetAnother = constantValue + anotherConstant
```

### Variables

```swift
var x = 5
x += 1
x = x + constantValue
```

### Printing stuff

```swift
println("whatever you want")
```

### Variable Types

```swift
var regularString = "swift can figure out that this is a string"
var explicitString: String = "but now it's ensuring only strings go into the variable"
```

### Conditionals

```swift
if trueOrFalseStatement {
  // true block
}
else {
  // false block
}
```

### Data Types

- Booleans (true or false) is `Bool`
- Integers (whole numbers) are `Int`
- Doubles (precise numbers) are `Double`

### String interpolation

Swift offers a nice way to substitute an expression into a string.
```swift
println("One plus one is \(1 + 1)")

var theVariable = 5
println("My variable contains a \(theVariable)")
```

### for

```swift
for index in 1...5 {
    println("\(index) times 5 is \(index * 5)")
}
```

### Functions

Reusable code.
```swift
func addOne(toThisNumber:Int) -> Int {
  return toThisNumber + 1
}

addOne(5)
```

### Classes

Large organizational structure for your code.

```swift
class MyClassName {

}
```

### Instance data

Data that belongs to each object that is created with the class.

```swift
class TheClass {
  let constantValue: Int = 12
  let assignItLater: Double
}
```

### Referring to an object

In your class definition, refer to the object that will be running the code using the `self` keyword. This is the same as the `this` keyword in Java.

### Constructor

Make a constructor by defining an `init` function.

```swift
class TheClass {
  let constantValue: Int = 12
  let assignItLater: Double
  
  init(inputValue: Int) {
    self.constantValue = inputValue
  }
}
```


