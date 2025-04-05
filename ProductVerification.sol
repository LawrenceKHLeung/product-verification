// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Smart contract for product verification system
contract ProductVerification {
    // Public address of the contract owner (the company "He@ven")
    address public owner;

    // Struct to store product details
    struct Product {
        string productionDate; // Date the product was made (e.g., "2025-04-05")
        string model;          // Model name or code (e.g., "HX-4500")
    }

    // Mapping to store product details by product ID (key: productId, value: Product struct)
    mapping(string => Product) public products;

    // Event emitted when a product is registered, useful for tracking
    event ProductRegistered(string productId, string productionDate, string model);

    // Modifier to restrict functions to the owner only
    modifier onlyOwner() {
        require(msg.sender == owner, "Only He@ven can perform this action"); // Check caller is owner
        _; // Continue execution if check passes
    }

    // Constructor runs once when the contract is deployed
    constructor() {
        owner = msg.sender; // Set the deployer (e.g., He@ven’s MetaMask account) as the owner
    }

    // Function to register a new product, restricted to the owner
    function registerProduct(
        string memory productId,    // Unique ID for the product
        string memory productionDate, // Production date as a string
        string memory model          // Model name as a string
    ) public onlyOwner {
        // Check if the product ID is already registered (prevent overwrites)
        require(bytes(products[productId].productionDate).length == 0, "Product already registered");
        // Store the product details in the mapping
        products[productId] = Product(productionDate, model);
        // Emit an event to log the registration
        emit ProductRegistered(productId, productionDate, model);
    }

    // Function to verify a product, accessible to anyone (read-only)
    function verifyProduct(string memory productId)
        public
        view
        returns (bool, string memory, string memory)
    {
        // Check if the product exists by seeing if productionDate is empty
        if (bytes(products[productId].productionDate).length == 0) {
            return (false, "", ""); // Product not found, return false and empty strings
        } else {
            // Product exists, return true and its details
            return (
                true,
                products[productId].productionDate,
                products[productId].model
            );
        }
    }
}