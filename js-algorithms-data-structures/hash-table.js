/* Hash Table */
'use strict';

// max is the number of buckets we're using in our hashtag values
let hash = (string, max) => {
	let tmpHash = 0;
	for (var i = 0; i < string.length; i++) {
		tmpHash += string.charCodeAt(i);
	}

	return tmpHash % max;
};

let HashTable = function() {
	let storage = [];
	const storageLimit = 14;

	this.print = function() {
		console.log(storage);
	};

	this.add = function(key, value) {
		let index = hash(key, storageLimit);

		if (undefined === storage[index]) {
			storage[index] = [ [key, value] ];
		} else {
			let inserted = false;
			for (var i = 0; i < storage[index].length; i++) {
				if (storage[index][i][0] === key) {
					storage[index][i][1] = value;
					inserted = true;
				}
			}

			if (inserted === false) {
				storage[index].push([key, value]);
			}
		}
	};

	this.remove = (key) => {
		let index = hash(key, storageLimit);

		if (1 === storage[index].length && storage[index][0][0] === key) {
			delete storage[index];
		} else {
			for (var i = 0; i < storage[index].length; i++) {
				if (storage[index][i] === key) {
					delete storage[index][i];
				}
			}
		}
	};

	this.lookup = (key) => {
		let index = hash(key, storageLimit);
		if (undefined === storage[index]) {
			return undefined;
		} else {
			for(var i = 0, length1 = storage[index].length; i < length1; i++){
				if (storage[index][i][0] === key) {
					return storage[index][i][1];
				}
			}
		}
	};
};

console.log(hash('quincy', 10));

let ht = new HashTable();
ht.add('beau', 'person');
ht.add('fido', 'dog');
ht.add('rex', 'dinosour');
ht.add('tux', 'penguin');
console.log(ht.lookup('tux'));
ht.print();
