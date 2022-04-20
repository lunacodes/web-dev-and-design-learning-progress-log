/* Stacks */
'use strict';

// Stacks
// functions: push, po, peek, length

let letters = [];
let word = 'freeCodeCamp';

// put letters of word into stack
for (var i = 0; i < word.length; i++) {
	letters.push(word[i]);
}

// pop off the stack in reverse order
for (var i = 0; i < word.length; i++) {
	rword += letters.pop();

	if (rword === word) {
		console.log(word, 'is a palindrome.');
	} else {
		console.log(word, 'is not a palindrome');
	}
}


// Creates a stack
let Stack = function() {
	this.count = 0;
	this.storage = {};

	// Adds a value onto the end of the stack
	this.push = function(value) {
		this.storage[this.count] = value;
		this.count++;
	};

	// Removes and returns the value at the end of the stack
	this.pop = function() {
		if (this.count === 0) {
			return undefined;
		}

		this.count--;
		let result = this.storage[this.count];
		delete this.storage[this.count];
		return result;
	};

	// Returns the size of the stack
	this.size = function() {
		return this.count;
	};

	// Returns the value at the end of the stack
	this.peek = function() {
		return this.storage[this.count - 1];
	};
};

let myStack = new Stack();
myStack.push(1);
