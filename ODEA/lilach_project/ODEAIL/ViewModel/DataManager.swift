
import FirebaseFirestore
import Foundation

class DataManager: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published private(set) var recentsOrders: [Order] = []
    @Published private(set) var total: Int = 0

    private let db = Firestore.firestore()
    private let userId: String

    init(userId: String) {
        self.userId = userId
        fetchOrders()
    }

    func addToCart(product: Product) {
        products.append(product)
        total += product.price
    }

    func removeFromCart(product: Product) {
        products = products.filter { $0.id != product.id }
        total -= product.price
    }

    func removeAllFromCart() {
        products = []
        total = 0
    }

    func saveCartToFirestore() {
        let orderID = UUID().uuidString
        let orderRef = db.collection("users").document(userId).collection("orders").document(orderID)

        let productDictionaries = products.map { product in
            return [
                "id": product.id,
                "name": product.name,
                "price": product.price,
                "image": product.image
            ] as [String: Any]
        }

        let data: [String: Any] = [
            "date": Date().timeIntervalSince1970,
            "products": productDictionaries
        ]

        orderRef.setData(data) { error in
            if let error = error {
                print("Error saving order to Firestore: \(error.localizedDescription)")
            } else {
                print("Order saved to Firestore successfully.")
                self.fetchOrders() // Refresh the local orders after saving a new order
            }
        }
    }

    func fetchOrders() {
        recentsOrders.removeAll()

        db.collection("users")
            .document(userId)
            .collection("orders")
            .getDocuments { [weak self] snapshot, error in
                guard error == nil else {
                    print(error!.localizedDescription)
                    return
                }

                if let snapshot = snapshot {
                    for document in snapshot.documents {
                        let data = document.data()
                        let id = document.documentID

                        if let productsData = data["products"] as? [[String: Any]],
                           let date = data["date"] as? TimeInterval {
                            // Parse the products data into an array of Product objects
                            var products: [Product] = []
                            for productData in productsData {
                                if let productId = productData["id"] as? String,
                                   let productImage = productData["image"] as? String,
                                   let productName = productData["name"] as? String,
                                   let productPrice = productData["price"] as? Int {
                                    let product = Product(id: productId, name: productName, image: productImage, price: productPrice)
                                    products.append(product)
                                }
                                // Add other properties of the product if necessary
                            }

                            // Create the order with the extracted products
                            let order = Order(id: id, createdDate: date, products: products)
                            // Add other properties of the order if necessary

                            // Add the order to the recentsOrders array
                            self?.recentsOrders.append(order)
                        }
                    }
                }
            }
    }
}
