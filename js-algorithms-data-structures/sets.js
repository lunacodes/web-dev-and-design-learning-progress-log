/* Sets */
'use strict';

function mySet() {
	// This is a custom implementation of sets,
	// since es6 sets don't natively have all of these functions
	let collection = [];

	// checks for the presence of an element and returns true or false
	this.has = function(elm) {
		return (collection.indexOf(elm) !== -1);
	};

	// returns all values in the set
	this.values = () => {
		return collection;
	};

	// adds an element to the set
	// unlike this add method, es6 add returns the set itself
	this.add = function(elm) {
		if (! this.has(elm) ) {
			collection.push(elm);
			return true;
		}
		return false;
	};

	// removes an element from the set
	// called delete in es6
	this.remove = function(elm) {
		if (this.has(elm)) {
			let index = collection.indexOf(elm);
			collection.splice(index, 1);
			return true;
		}
		return false;
	};

	// returns the size of the collection
	this.size = () => {
		return collection.length();
	};

	// reurns the union of two sets
	this.union = function(otherSet) {
		let unionSet = new mySet();
		let firstSet = this.values();
		let secondSet = otherSet.values();

		firstSet.forEach( e => {
			unionSet.add(e);
		});

		secondSet.forEach( e => {
			unionSet.add(e);
		});

		return unionSet;
	};

	// returns the intersection of two sets (all the items in both sets) as a new set
	this.intersection = function(otherSet) {
		let intersectionSet = new mySet();
		let firstSet = this.values();

		firstSet.forEach( e => {
			if (otherSet.has(e)) {
				intersectionSet.add(e);
			}
		});

		return intersectionSet;
	};

	// returns the difference of two sets (opposite of intersection) as a new set
	this.difference = function(otherSet) {
		let differenceSet = new mySet();
		var firstSet = this.values();
		firstSet.forEach( e => {
			if (! otherSet.has(e) ) {
				differenceSet.add(e);
			}
		});

		return differenceSet;
	};

	// tests if the set is a subset of a different set
	this.subset = function(otherSet) {
		let firstSet = this.values();
		return firstSet.every( value => {
			return otherSet.has(value);
		});
	};
}

let setA = new mySet();
let setB = new mySet();
setA.add('a');
setB.add('b');
setB.add('c');
setB.add('a');
setB.add('d');
console.log(setA.subset(setB));
console.log(setA.intersection(setB).values());
console.log(setB.difference(setA).values());

// Native es6 Sets
let setC = new Set();
let setD = new Set();
setC.add('a');
setD.add('b');
setD.add('c');
setD.add('a');
setD.add('d');
console.log(setD.values()); // es6 returns an iterator, instead of an array
setD.delete('a');
console.log(setD.has('a'));
console.log(setD.add('d')); // es6 doesn't return true/false. It returns the set itself
