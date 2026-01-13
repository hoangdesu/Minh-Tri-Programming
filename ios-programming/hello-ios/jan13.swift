import Foundation

let hello = "Hello, world!"
let multilineString = """
                  @@@
      @@          @@@@
    @@  @@@         @@@@@
    @@@@@@@@@       @@@@@
      @@@@@@@@@@    @@@@@@
        @@@@@@@@@@  @@@@@@
          @@@@@@@@@@@@@@@@@
@           @@@@@@@@@@@@@@@
@@@@@@        @@@@@@@@@@@@@
  @@@@@@@@@@@@@@@@@@@@@@@@@@
    @@@@@@@@@@@@@@@@@@@@@@@@
        @@@@@@@@@@@@@     @
                      \(hello)
"""

print(multilineString)

print("Hello Swift")

let age = 66

print(age > 18 ? (age > 65 ? "Senior" : "Old") : "Young")


if age > 18 {
  if age > 65 {
    print("Senior")
  } else {
    print("Old")
  }
} else {
  print("Young")
}

// 1...5: iterator
// print(1...5)

// close range
for i in 1...5 {
  print(i)
}

// open range
// range(10): 0->9
for x in 2..<10 {
  print(x)
}
