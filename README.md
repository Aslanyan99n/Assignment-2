# Restaurant Order Management System

This Swift project simulates a simple restaurant order management system. It allows you to create customers, waiters, and orders while managing the interactions between them. The project features custom models for orders and order items, integrating Swift protocols to handle identifiability and pricing calculations.

## Features

- **Protocols for Identifiable Models**: Define protocols to ensure consistent interfaces for customers, waiters, and orders.
- **Order Management**: Create customers and waiters, assign orders, and calculate total order prices dynamically.
- **Custom Enumerations for Menu Items**: Easily define appetizers, main courses, desserts, and beverages.

### Adding to Your Project

To include this order management system in your project, copy the code into your Swift file or module.

## Usage

### Creating Models and Protocols

The system defines key models like `Customer`, `Waiter`, and `CustomerOrder` with supporting protocols and structures to manage and display orders effectively.

### 1. Protocol Definitions

- **`Person`**: A protocol for identifiable people with a name property.
- **`OrderItem`**: A protocol representing an order item with properties for name, portions, and price.
- **`Order`**: A protocol for orders with a customer, list of items, and total price.

### 2. Structs and Enums

#### `Customer` and `Waiter`

`Customer` and `Waiter` structs conform to the `Person` protocol. Customers are associated with a waiter, and waiters can have multiple customers.

#### `OrderItem` and `CustomerOrder`

`MenuItem` conforms to `OrderItem`, representing items that can be ordered. `CustomerOrder` represents an order placed by a customer with multiple items.

#### Menu Enums

- **`Appetizer`**: Options like Caesar, Green, etc.
- **`MainCourse`**: Dishes such as Pizza and Pasta.
- **`Dessert`**: Options like Ice Cream and Lava Cake.
- **`Beverage`**: Drinks including Coffee, Wine, and Soda.

### 3. Example Code

Here's an example demonstrating how to create waiters, customers, and orders, then print the order details:

```swift
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
```

Output Example
The example above will generate output showing the details of each order, including the items, portions, individual prices, and total price:

```
Customer <<Karine>> with ID <<UUID>> gives order
 ✅ 1 x Caesar - $8.0 each
 ✅ 4 x Pizza - $12.0 each
 ✅ 5 x Ice Cream - $5.0 each
 ✅ 2 x Wine - $7.0 each
to waiter 🙆🏻‍♂️ <<Vazgen>> with ID <<UUID>>
💰 With Total Price: $81.0
----------------------------------------------------------------------------------------------------
Customer <<Gor>> with ID <<UUID>> gives order
 ✅ 3 x Green - $7.0 each
 ✅ 1 x Pasta - $11.0 each
 ✅ 1 x Brownie - $6.0 each
 ✅ 2 x Coffee - $3.0 each
to waiter 🙆🏻‍♂️ <<Vazgen>> with ID <<UUID>>
💰 With Total Price: $41.0
----------------------------------------------------------------------------------------------------
```
