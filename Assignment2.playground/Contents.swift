import UIKit

protocol Person: Identifiable {
    var name: String { get }
}

struct Customer: Person {
    let id: UUID
    let name: String
    let waiter: Waiter

    init(name: String, waiter: Waiter) {
        self.id = UUID()
        self.name = name
        self.waiter = waiter
    }
}

struct Waiter: Person {
    let id: UUID
    let name: String
    var customers: [Customer] = []
    
    init(name: String) {
        self.id = UUID()
        self.name = name
    }
    
    mutating func addCustomer(_ customer: Customer) {
        customers.append(customer)
    }
}

protocol OrderItem {
    var name: String { get }
    var portions: Int { get }
    var price: Double { get }
}

protocol Order: Identifiable {
    var customer: Customer { get }
    var items: [OrderItem] { get }
    var totalPrice: Double { get }
}

struct MenuItem: OrderItem {
    let name: String
    let portions: Int
    let price: Double
}

// Order Model
struct CustomerOrder: Order {
    let id: UUID
    let customer: Customer
    let items: [OrderItem]
    
    var totalPrice: Double {
        return items.reduce(0) { $0 + ($1.price * Double($1.portions)) }
    }
    
    init(customer: Customer, items: [OrderItem]) {
        self.id = UUID()
        self.customer = customer
        self.items = items
    }
}

enum Appetizer: String {
    case greek = "Greek"
    case caesar = "Caesar"
    case green = "Green"
}

enum MainCourse: String {
    case pizza = "Pizza"
    case pasta = "Pasta"
    case chicken = "Chicken"
    case fries = "Fries"
}

enum Dessert: String {
    case iceCream = "Ice Cream"
    case brownie = "Brownie"
    case lavaCake = "Lava Cake"
}

enum Beverage: String {
    case coffee = "Coffee"
    case tea = "Tea"
    case juice = "Juice"
    case soda = "Soda"
    case water = "Water"
    case wine = "Wine"
}

// Printing Order Details
func getOrderDetails(_ order: CustomerOrder) {
    print("Customer <<\(order.customer.name)>> with ID <<\(order.customer.id)>> gives order")
    for item in order.items {
        print(" ✅ \(item.portions) x \(item.name) - $\(item.price) each")
    }
    print("to waiter 🙆🏻‍♂️ <<\(order.customer.waiter.name)>> with ID <<\(order.customer.waiter.id)>>")
    print("💰 With Total Price: $\(order.totalPrice)")
    print(String(repeating: "-", count: 100))
}

// MARK: - USAGE

// Creating Waiters
var waiterVazgen = Waiter(name: "Vazgen")

// Creating Customers
let customerKarine = Customer(name: "Karine", waiter: waiterVazgen)
let customerGor = Customer(name: "Gor", waiter: waiterVazgen)

// Assigning Customers to Waiter
waiterVazgen.addCustomer(customerKarine)
waiterVazgen.addCustomer(customerGor)

// Creating Orders
let firstOrderItems: [OrderItem] = [
    MenuItem(name: Appetizer.caesar.rawValue, portions: 1, price: 8.0),
    MenuItem(name: MainCourse.pizza.rawValue, portions: 4, price: 12.0),
    MenuItem(name: Dessert.iceCream.rawValue, portions: 5, price: 5.0),
    MenuItem(name: Beverage.wine.rawValue, portions: 2, price: 7.0)
]

let secondOrderItems: [OrderItem] = [
    MenuItem(name: Appetizer.green.rawValue, portions: 3, price: 7.0),
    MenuItem(name: MainCourse.pasta.rawValue, portions: 1, price: 11.0),
    MenuItem(name: Dessert.brownie.rawValue, portions: 1, price: 6.0),
    MenuItem(name: Beverage.coffee.rawValue, portions: 2, price: 3.0)
]

let firstOrder = CustomerOrder(customer: customerKarine, items: firstOrderItems)
let secondOrder = CustomerOrder(customer: customerGor, items: secondOrderItems)

getOrderDetails(firstOrder)
getOrderDetails(secondOrder)
