
/*
 Jimmy Ren
 11167170
 1
 I'm looking forward to creating working apps that I can modify and use to help with personal projects!
 */

// Exercise 1

let foo: Int = 42
var fooStr:String? = String(foo)
print("My number is \(fooStr!)")
if let fooTemp = fooStr {
    print("My number is \(fooTemp)")
}
print("My number is \(fooStr ?? "default")")

// Exercise 2
var someChars: [Character] = ["c", "i", "s", "1", "9", "5"]
var charString: String = String(someChars)
let exclamationMark = "!"
charString.append(exclamationMark)

var peopleDict = ["Jerry": 19, "Justin": 20, "Andrew": 19]
dump(peopleDict)

var myInfo:(String, String) = ("Jimmy", "2023")
print(myInfo)

// Exercise 3
for (key, age) in peopleDict {
    if age < 21 {
        print("My friend \(key) is under 21")
    } else {
        print("My friend \(key) is not under 21")
    }
}

for i in 1...10 {
    print(i)
}

for char in someChars {
    print(char)
}
// Exercise 4
func sumAndDiff(x: Int, y: Int) -> (sum: Int, diff: Int) {
    return (x + y, x - y)
}

typealias Course = String
typealias PennId = Int

func enroll(in course: Course, using pennId: PennId) -> () {
    print("Enrolled \(pennId) in \(course)")
}

let newCourse = "CIS195"
let myPennId = 11167170
enroll(in: newCourse, using: myPennId)
// Exercise 5 and Exercise 6
struct Rectangle {
    var length: Int
    var width: Int
    var area: Int {
        get {
            return length * width
        }
    }
    var description: String? {
        didSet {
            print(description!)
        }
    }
}

var myRect = Rectangle(length: 4, width: 5)
myRect.description = "This is my rectangle"
print(myRect.area)

typealias Major = String
enum School {
    case Wharton
    case Engineering
    case College
    case Nursing
}
class Student {
    var name: String
    var school: School?
    var major: Major = "undeclared"
    init(name: String, school: School, major: Major) {
        self.name = name
        self.school = school
        self.major = major
    }
    init(name: String) {
        self.name = name
    }
}

var me = Student(name: "Jimmy", school: School.Engineering, major: "CIS")
var babyQuaker = Student(name: "Jimmy")
let majors: [Major] = ["CIS", "MEAM", "Finance", "Other"]
babyQuaker.major = majors.randomElement()!

print(babyQuaker.major)
