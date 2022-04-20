/* LinkedList */
'use strict';

function linkedList() {
	let length = 0;
	let head = null;

	let Node = function(element) {
		this.element = element;
		this.next = null;
	};

	this.size = () => {
		return length;
	};

	this.head = () => {
		return head;
	}

	this.add = function(element) {
		var node = new Node(element);

		if (null === head) {
			head = node;
		} else {
			let currentNode = head;

			while (currentNode.next) {
				currentNode = currentNode.next;
			}

			currentNode.next = node;
		}

		length++;
	};

	this.remove = element => {
		let currentNode = head;
		let previousNode;

		if (currentNode.element === element) {
			head = currentNode.next;
		} else {
			while (currentNode.element !== element) {
				previousNode = currentNode;
				currentNode = currentNode.next;
			}

			previousNode.next = currentNode.next;
		}

		length--;
	};

	this.isEmpty = () => {
		return length === 0;
	};

	this.indexOf = element => {
		let currentNode = head;
		let index = -1;

		while (currentNode) {
			index++;

			if (currentNode.element === element) {
				return index;
			}

			currentNode = currentNode.next;
		}

		return -1;
	};

	this.elementAt = index => {
		let currentNode = head;
		let count = 0;

		while (count < index) {
			count++;
			currentNode = currentNode.next;
		}

		return currentNode.element;
	};

	this.addAt = (index, element) => {
		let node = new Node(element);

		let currentNode = head;
		let previousNode;
		let currentIndex = 0;

		if (index > length) {
			return false;
		}

		if (0 === index) {
			node.next = currentNode;
			head = node;
		} else {
			while (currentIndex < index) {
				currentIndex++;
				previousNode = currentNode;
				currentNode = currentNode.next;
			}

			node.next = currentNode;
			previousNode.next = node;
		}

		length++;
	};

	this.removeAt = index => {
		let currentNode = head;
		let previousNode;
		let currentIndex = 0;

		if (index < 0 || index >= length) {
			return null;
		}

		if (0 === index) {
			head = currentNode.next;
		} else {
			while (currentIndex < index) {
				currentIndex++;
				previousNode = currentNode;
				currentNode = currentNode.next;
			}

			previousNode.next = currentNode.next;
		}

		length--;
		return currentNode.element;
	};
}

var conga = new linkedList();
conga.add('Kitten');
conga.add('Puppy');
conga.add('Dog');
conga.add('Cat');
conga.add('Fish');
console.log(conga.size());
console.log(conga.removeAt(3));
console.log(conga.elementAt(3));
console.log(conga.indexOf('Puppy'));
console.log(conga.size());
