//: Playground - noun: a place where people can play

import UIKit

let galaxy = "Milky Way🐂"

// swift3
for char in galaxy.characters {
    print(char)
}

// swift4
for char in galaxy {
    print(char)
}
galaxy.count
galaxy.isEmpty
galaxy.dropFirst()
String(galaxy.reversed())

// Filter out any none ASCII characters
galaxy.filter { (char) -> Bool in
    let isASCII = char.unicodeScalars.reduce(true, { $0 && $1.isASCII })
    return isASCII
}

let endIndex = galaxy.index(galaxy.startIndex, offsetBy: 3)
var milkSubstring = galaxy[galaxy.startIndex...endIndex]
type(of: milkSubstring)

// Concatenate a String onto a Substring
milkSubstring += ""

// Creaet a String from a Substring
let milkString = String(milkSubstring)
milkSubstring[milkSubstring.startIndex...]

let keys = ["One Key", "One play", "Two Key", "Three Key"]
let values = [1,10,2,3,5]
let starDistanceDict = Dictionary(uniqueKeysWithValues: zip(keys, values))

// 重复key的处理,uniquingKeysWith函数指针对重复key对应的value的处理
let favoriteKeys = ["One", "Two", "One", "Three"]
let mergedKeysAndValues = Dictionary(zip(favoriteKeys, repeatElement(1, count: favoriteKeys.count)), uniquingKeysWith: -)

// 字典(Dictionary)和集合(Set)通过过滤
let newStarDistanceDict = starDistanceDict.filter{ $0.value > 2 }
newStarDistanceDict

// 字典映射
let mappedCloseStars = newStarDistanceDict.mapValues { "\($0 + 1)" }
mappedCloseStars

// 字典默认值
let siriusDistance = mappedCloseStars["Five", default: "unknown"]
var starWordsCount: [String: Int] = [:]
let starKeys = ["One Key", "One play", "Two Key", "Three Key"]
for starName in starKeys {
    let numWords = starName.split(separator: " ").count
    starWordsCount[starName, default: 0] += numWords
}
starWordsCount

let groupKeys = ["One Key", "One play", "Two Key", "Three Key"]
let groups = Dictionary.init(grouping: groupKeys, by: { return $0.first! })
groups

struct CuriosityLog: Codable {
    enum Discovery: String, Codable {
        case rock, water, martian
    }
    
    var sol: Int
    var discoveries: [Discovery]
}
let logSol42 = CuriosityLog(sol: 42, discoveries: [.rock, .rock, .rock])
// 要实现编码对象，你需要将对象传递给编码器
let jsonEncoder = JSONEncoder()
// Encode the data
let jsonData = try jsonEncoder.encode(logSol42)
// 从data中创建一个jsonString,把对象自动编码成一个json对象
let jsonString = String(data: jsonData, encoding: .utf8)

// 把数据解码成具体对象
let jsonDecoder = JSONDecoder()
let decodeLog = try jsonDecoder.decode(CuriosityLog.self, from: jsonData)
decodeLog.sol
decodeLog.discoveries


struct Lightsaber {
    enum Color {
        case blue, green, red
    }
    let color: Color
}

class ForceUser {
    var name: String
    var lightsaber: Lightsaber
    var master: ForceUser?
    
    init(name: String, lightsaber: Lightsaber, master: ForceUser? = nil) {
        self.name = name
        self.lightsaber = lightsaber
        self.master = master
    }
}
let sidious = ForceUser(name: "xiaobai", lightsaber: Lightsaber(color: .red))
let obiwan  = ForceUser(name: "obi-wan", lightsaber: Lightsaber(color: .blue))
let ankai   = ForceUser(name: "an-kai", lightsaber: Lightsaber(color: .green), master: obiwan)

obiwan[keyPath: \ForceUser.name]
obiwan.name

ankai.lightsaber.color
ankai[keyPath: \ForceUser.lightsaber.color]

ankai.master?.name
let masterKeyPath = \ForceUser.master
let anakinMasterName = ankai[keyPath: masterKeyPath]?.name

ankai[keyPath: masterKeyPath] = sidious
ankai.master?.name

// 多行字符串文字
let star = "☆"
let introString = """
    A long time ago in a galaxy far,
    far away....

    You could write multi-lined strings
    without "escaping" single quotes.

    The indentation of the closing quotes
    below deside where the text line
    begins.

    You can even dynamically add values
    from properties: \(star)
    """

print(introString)

var numbers = ["One", "Two", "Three", "Four", "Five", "Six"]
let outSide = numbers[4...]         // 之前: numbers[4..<numbers.endIndex]
let before = numbers[..<4]          // 之前: numbers[numbers.startindex..<4]


var numberedPlanets = Array(zip(0..., numbers))
print(numberedPlanets)
numbers.append("☆")
numberedPlanets = Array(zip(0..., numbers))
print(numberedPlanets)

// 模式匹配
func temperature(planetNumber: Int) {
    switch planetNumber {
    case ...2:
        print("Too hot")
    case 4...:
        print("Too cold")
    default:
        break
    }
}
temperature(planetNumber: 3)

struct GenericDictionary<Key: Hashable, Value> {
    var data: [Key: Value]
    init(data: [Key: Value]) {
        self.data = data
    }
    subscript<T>(key: Key) -> T? {
        return data[key] as? T
    }
}

let genericDict = GenericDictionary(data: ["one": "one", "two": 2, "three": 3, "four": 4])
let one: String? = genericDict["one"]

extension GenericDictionary {
    subscript<Keys: Sequence>(keys: Keys) -> [Value] where Keys.Iterator.Element == Key {
        var values: [Value] = []
        for key in keys {
            if let value = data[key] {
                values.append(value)
            }
        }
        return values
    }
}

genericDict[["one", "two"]]

var swapNumbers = [1,2,0,4]
swapNumbers.swapAt(0, 1)








