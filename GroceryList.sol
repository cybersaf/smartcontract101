// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GroceryList {
    // Array to store the grocery items
    string[] private items;

    // Event to emit when a new item is added
    event ItemAdded(string item, uint256 index);

    // Event to emit when an item is removed
    event ItemRemoved(string item, uint256 index);

    // Function to add a new item to the list
    function addItem(string memory newItem) public {
        items.push(newItem);
        emit ItemAdded(newItem, items.length - 1);
    }

    // Function to remove an item from the list by index
    function removeItem(uint256 index) public {
        require(index < items.length, "Index out of bounds");

        // Emit the event before removing the item
        emit ItemRemoved(items[index], index);

        // Move the last item into the place to delete
        items[index] = items[items.length - 1];

        // Remove the last element
        items.pop();
    }

    // Function to get the entire list of items
    function getItems() public view returns (string[] memory) {
        return items;
    }

    // Function to get the number of items in the list
    function getItemCount() public view returns (uint256) {
        return items.length;
    }
}