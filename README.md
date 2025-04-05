# He@ven Product Verification System

ELEC S431F project  
LEUNG Pak Hei (13430941)  
YEUNG Yiu Ming (13448839)  
LEUNG Kim Hung (12895666)  
CHUNG Ching Fan (12889101)  

This is a blockchain project built for "He@ven," a fictional company, to register and verify products using the Sepolia Ethereum test network. It uses a smart contract to store product details (product ID, production date, and model) and provides a web interface for the company to register products and users to verify authenticity via QR codes.

## Features
- **Smart Contract**: Registers products (only by the company) and verifies authenticity (publicly accessible).
- **Registration Page**: Allows "He@ven" to add products and generates a QR code for each.
- **Verification Page**: Lets users check product authenticity by entering a product ID or scanning a QR code.
- **Hosted on GitHub Pages**: Simple deployment with no server setup required.
- **Styled Interface**: Includes a company logo and clean design for the verification page.

## Project Structure
product-verification/__
├── index.html              # Verification page for users__
├── register.html           # Registration page for He@ven__
├── logo.png                # Company logo (150x75 pixels recommended)__
├── ProductVerification.sol # Smart contract source code__
└── README.md               # This file__

## Usage
Register a Product
1. Visit https://lawrencekhleung.github.io/product-verification/register.html.
2. Connect MetaMask with the owner account (the one that deployed the contract).
3. Enter a unique Product ID, Production Date, and Model (e.g., "1006", "2025-04-08", "B5").
4. Click "Register" and confirm the transaction in MetaMask.
5. A QR code will appear—scan or save it for verification.

Verify a Product
1. Visit https://lawrencekhleung.github.io/product-verification/.
2. Connect MetaMask (any account works for verification).
3. Manual: Enter a Product ID (e.g., "1006") and click "Check".
4. QR Code: Scan the QR code from registration—it auto-fills and verifies.
5. Result shows if the product is genuine, with details if registered.
