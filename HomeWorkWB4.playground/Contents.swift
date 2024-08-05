import UIKit

// 1. Обобщенная структура
struct Stack<Element> {
    var elements: [Element] = []

    mutating func push(_ element: Element) {
        elements.append(element)
    }

    mutating func pop() -> Element? {
        return elements.popLast()
    }
}

//2. Обобщенный класс
class Queue<Element> {
    var elements: [Element] = []
    
    func enqueue(_ element: Element) {
        elements.append(element)
    }
    
    func dequeue() -> Element? {
        guard !elements.isEmpty else {
            return nil
        }
        return elements.removeFirst()
    }
}

// 3. Создание протокола Container
protocol Container {
    associatedtype Item
    mutating func add(_ item: Item)
    mutating func remove() -> Item?
}

// 4. Реализация протокола

extension Stack: Container {
    mutating func add(_ item: Element) {
        self.push(item)
    }

    mutating func remove() -> Element? {
        return self.pop()
    }
}

extension Queue: Container {
    func add(_ item: Element) {
        self.enqueue(item)
    }

    func remove() -> Element? {
        return self.dequeue()
    }
}
// 5. Непрозрачные типы
func makeOpaqueContainer<T: Container>(_ container: T) -> some Container {
    return container
}

// 6. Стирание типов
class AnyContainer<Item>: Container {
    private let append: (Item) -> Void
    private let delete: () -> Item?

    init<T: Container>(_ container: T) where T.Item == Item {
        var container = container
        append = { item in
            container.add(item)
        }
        delete = {
            return container.remove()
        }
    }

    func add(_ item: Item) {
        append(item)
    }

    func remove() -> Item? {
        return delete()
    }
}

// 7. Примеры использования
// Stack с Int
var intStack = Stack<Int>()
intStack.push(1)
intStack.push(2)
print(intStack.pop() ?? "")
print(intStack.elements)

// Queue с String
let stringQueue = Queue<String>()
stringQueue.enqueue("Hello")
stringQueue.enqueue("World")
print(stringQueue.dequeue() ?? "")
print(stringQueue.elements)

// Opaque Container
var opaqueStack = makeOpaqueContainer(intStack) as! Stack<Int>
opaqueStack.add(3)
opaqueStack.add(2)
print(opaqueStack.remove() ?? "")

// AnyContainer
let anyIntStack = AnyContainer(intStack)
anyIntStack.add(4)
print(anyIntStack.remove() ?? "")
