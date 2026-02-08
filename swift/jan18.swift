print("hello swift")

// Two-sum:
// nums: [Int] = [1, 2, 3, 4]
// target: Int = 7

// fun(nums, target) -> [Int]

// indices = [2, 3]


// Iterator
//     Array
//         String
//     Dictionary
//     Set





// target = 17 = 8 + 9 => indices 3 & 4

// n = 5 => 17 - 5 = 12
// n = 6 => 17 - 6 = 11
// ...
// n = 8 => 17 - 8 = 9
// n = 9

// target = 14
// n = 5 => [9
// n = 6 => 8
// n = 7 => 7
// n = 8 => 3     ]

// enumrated() -> tuple ()
// decompose

// for (i, num) in nums.enumerated() {
//     print(i, num)
// }


// for i in 0..<nums.count {
//     print(i, nums[i])
// }



func twoSums(nums: [Int], target: Int) -> [Int] {
    for i in 0..<nums.count - 1 {
        for j in i+1..<nums.count {
            if nums[i] + nums[j] == target {
                return [i, j]
            }
        }
    }
    return []
}



var nums = [5, 6, 7, 8, 9]
var target = 17

// print( 6 in nums )
print(nums.contains(6))

print(twoSums(nums: nums, target: target))

var cities: [String : String] = [
    "vietnam": "hanoi",
    "japan": "tokyo"
]

cities["korea"] = "seoul"

print(cities)
print(cities["korea"]!)
print(cities.keys.contains("korea"))


// invalid swift syntax, must use contains
// if "vietnam" in cities.keys {
//     print("Yesss")
// }
