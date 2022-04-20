/* Queues */
'use strict';

function Queue() {
	let collection = [];

	this.print = () => {
		console.log(collection);
	};

	this.enqueue = element => {
		collection.push(element);
	};

	this.dequeue = () => {
		return collection.shift();
	};

	this.front = () => {
		return collection[0];
	};

	this.size = () => {
		return collection.length;
	};

	this.isEmpty = () => {
		return (0 === collection.length);
	};
}

let q = new Queue();
q.enqueue('a');
q.enqueue('b');
q.enqueue('c');
q.print();
q.dequeue();
console.log(q.front());

function PriorityQueue() {
	let collection = [];
	this.printCollection = () => {
		console.log(collection);
	};

	this.enqueue = function(elm) {
		if (this.isEmpty()) {
			collection.push(elm);
		} else {
			let added = false;
			for (var i = 0; i < collection.length; i++) {
				if (elm[i] < collection[i][1]) {
					// checking priorities
					collection.splice(i, 0, elm);
					let added = true;
					break;
				}
			}

			if (!added) {
				collection.push(elm);
			}
		}
	};

	this.dequeue = () => {
		let value = collection.shift();
		return value[0];
	};

	this.front = () => {
		return collection[0];
	};

	this.size = () => {
		return collection.length;
	};

	this.isEmpty = () => {
		return (0 === collection.length);
	};

}

let pq = new PriorityQueue();
pq.enqueue(['Beau Carnes', 2]);
pq.enqueue(['Quincy Larson', 3]);
pq.enqueue(['Ewa Mitulska-Wójcik', 1]);
pq.enqueue(['Briana Swift', 2]);
pq.printCollection();
pq.dequeue();
console.log(pq.front());
pq.printCollection();
