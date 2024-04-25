import 'package:web/helpers.dart';
import 'dart:html';

import 'model/product.dart';
import 'services/product_service.dart';

void main() async {

  // This is the default content
  final now = DateTime.now();
  final element = document.querySelector('#output') as HTMLDivElement;
  element.text = 'The time is ${now.hour}:${now.minute}'
      ' and your Dart web app is running!';





  /* -------------------------------------------- */
  /* ------ 1. Display a table of products ------ */
  /* -------------------------------------------- */

  Future<void> refreshProductTable(List<Product> products) async {
    // Get the product-table element
    Element productTable = querySelector('#product-table')!;

    // Clear the existing product rows
    productTable.innerHTML = '';

    // Add a row for each product
    for (var product in products) {
      productTable.innerHTML += '''
        <tr>
          <th scope="row">${product.id}</td>
          <td>${product.name}</td>
          <td>${product.price}</td>
          <td>${product.description}</td>
          <td class="text-end">
            <button class="btn btn-warning edit-btn" data-id="${product.id}" data-bs-toggle="modal" data-bs-target="#editModal">Edit</button>
            <button class="btn btn-danger delete-btn" data-id="${product.id}" data-bs-toggle="modal" data-bs-target="#deleteModal">Delete</button>
        </tr>
      ''';
    }
  };

  ProductService productService = ProductService();
  List<Product> products = await productService.getAllProducts();
  refreshProductTable(products);





  /* ----------------------------------------------- */
  /* ---- 2. Edit & Deleteproduct functionality ---- */
  /* ----------------------------------------------- */

  void attachEventListeners() {

    // Add event listener to the edit buttons
    for (var btn in querySelectorAll('.edit-btn')) {
      btn.onClick.listen((event) async {
        var id = int.parse(btn.getAttribute('data-id')!);
        Product? product = await productService.getProductById(id);

        // Populate the input fields with the product details
        InputElement idInput = querySelector('#id-edit') as InputElement;
        InputElement nameInput = querySelector('#name-edit') as InputElement;
        InputElement priceInput = querySelector('#price-edit') as InputElement;
        InputElement descriptionInput = querySelector('#description-edit') as InputElement;
        idInput.value = product?.id.toString();
        nameInput.value = product?.name;
        priceInput.value = product?.price.toString();
        descriptionInput.value = product?.description;

        // Add event listener to the save button
        querySelector('#edit-product-btn')?.onClick.listen((event) async {
          // Update the product
          Product updatedProduct = Product(int.parse(idInput.value ?? ''), nameInput.value ?? '', double.parse(priceInput.value ?? '0'), descriptionInput.value ?? '');
          await productService.updateProduct(updatedProduct);

          // Refresh the product table
          products = await productService.getAllProducts();
          refreshProductTable(products);

          // Re-attach the event listeners
          attachEventListeners();

          // Clear the input values
          idInput.value = '';
          nameInput.value = '';
          priceInput.value = '';
          descriptionInput.value = '';
          
        });
      });
    }

    // Add event listener to the delete buttons
    for (var btn in querySelectorAll('.delete-btn')) {
      btn.onClick.listen((event) async {
        var id = int.parse(btn.getAttribute('data-id')!);

        querySelector('#delete-id')?.text = '#$id';

        // Add event listener to the delete button in the modal
        querySelector('#delete-product-btn')?.onClick.listen((event) async {
          // Delete the product
          await productService.deleteProduct(id);

          // Refresh the product table
          products = await productService.getAllProducts();
          refreshProductTable(products);

          // Re-attach the event listeners
          attachEventListeners();
        });
      });

    }
  }

  attachEventListeners();




  /* -------------------------------------------- */
  /* -------- 3. Form to add new product -------- */
  /* -------------------------------------------- */

  // Get the 3 inputs and the create button
  InputElement nameInput = querySelector('#name') as InputElement;
  InputElement priceInput = querySelector('#price') as InputElement;
  InputElement descriptionInput = querySelector('#description') as InputElement;
  ButtonElement createProductBtn = querySelector('#create-product-btn') as ButtonElement;

  createProductBtn.onClick.listen((event) async {
    // Create a new product object
    Product newProduct = Product(0, nameInput.value ?? '', double.parse(priceInput.value ?? '0'), descriptionInput.value ?? '');

    // Add the new product to the list of products
    await productService.createProduct(newProduct);

    // Refresh the product table
    products = await productService.getAllProducts();
    refreshProductTable(products);

    // Clear the input values
    nameInput.value = '';
    priceInput.value = '';
    descriptionInput.value = '';

    // Re-attach the event listeners
    attachEventListeners();
    
  });
  

}
