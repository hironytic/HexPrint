import Foundation

func main() {
    guard CommandLine.arguments.count >= 2 else {
        print("HexPrint <file>\n")
        return
    }
    
    let filePath = CommandLine.arguments[1]
    
    do {
        let data = try Data(contentsOf: URL(fileURLWithPath: filePath))
        var count = 0
        var line = ""
        for byte in data {
            line += String(format: "0x%02x, ", byte)
            count += 1
            if count >= 8 {
                print(line)
                line = ""
                count = 0
            }
        }
    } catch let error {
        print("Error: \(error)")
    }
}

main()
