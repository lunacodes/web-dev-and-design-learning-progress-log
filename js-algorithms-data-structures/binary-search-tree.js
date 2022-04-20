/* Binary Search Tree
	 A binary Tree is an ordered tree with only 2 branches per node
	 Each left subtree is <= parent node
	 Each right subtree is >= parent node

	 Binary search allows for skipping about half the tree, on average.
	 So insertion/deletion can vary between
	 Linear O(n) [worst case] - O(log(n)) [best case]
	 Unsorted array is Linear O(n). Hash table is fastest

	 Depth-first search: Tree is explored as deeply as possible, before the search continues to another sub-tree

*/
'use strict';

class Node {
	constructor(data, left = null, right = null) {
		this.data = data;
		this.left = left;
		this.right = right;
	}
}

class BST {
	constructor() {
		// Creates the node at the top of the tree
		this.root = null;
	}

	add(data) {
		const node = this.root;

		if (null === node) {
			// If we're on the first node, then set the value to
			// the data that was passed in
			this.root = new Node(data);
			return;
		} else {
			const searchTree = node => {
				if (data < node.data) {
					// If passed data < current node, we're going to put it
					// on the left side of tree
					if (null === node.left) {
						// If new location empty, create a node with passed data
						node.left = new Node(data);
						return;
					} else if (null !== node.left) {
						// Otherwise, recurse until left node > passed data
						return searchTree(node.left);
					}
				} else if (data > node.data) {
					// If passed data > current node, we'll put it
					// on the right side of the tree
					if (null === node.right) {
						// If new location empty, create node with passed data
						node.right = new Node(data);
						return;
					} else if (null !== node.right) {
						// Otherwise, recurse until right node > passed data
						return searchTree(node.right);
					}
				} else {
					return null;
				}
			};
			return searchTree(node);
		}
	}

	findMin() {
		let current = this.root;
		while (null !== current.left) {
			current = current.left;
		}
		return current.data;
	}

	findMax() {
		let current = this.root;
		while (null !== current.right) {
			current = current.right;
		}
		return current.data;
	}

	find(data) {
		let current = this.root;
		while (data !== current.data) {
			if (data < current.data) {
				current = current.left;
			}
		}
	}

	isPresent(data) {
		let current = this.root;
		while (current) {
			if (current.data === data) {
				return true;
			}

			if (data < current.data) {
				current = current.left;
			} else {
				current = current.right;
			}
		}
		return false;
	}

	remove(data) {
		const removeNode = (node, data) => {
			if (null === node) {
				return null;
			}

			if (data === node.data) {
				// node has no children
				if ((null === node.left) && (null === node.right)) {
					return null; // set reference to node to null
				}

				// node has no left child
				if (null === node.left) {
					return node.right; // replace node with the node to its right
				}

				// node has no right child
				if (null === node.right) {
					return node.left; // replace node with left node
				}

				// node has two children
				// In this case, we have to cut out a generation, while
				// preserving the one below it, and then take the leftmost (i.e. lowest) value
				// and set the newly empty node to that value
				let tempNode = node.right;
				while (null !== tempNode.left) {
					tempNode = tempNode.left;
				}

				node.data = tempNode.data;
				node.right = removeNode(node.right, tempNode.data);

				return node;
			} else if (data < node.data) {
				node.left = removeNode(node.left, data);
				return node;
			} else {
				node.right = removeNode(node.right, data);
			}
		};

		this.root = removeNode(this.root, data);
	}

	// Searching through balanced trees is much more efficient
	// returns true if all intermediate branches of the tree have 2 children
	isBalanced() {
		return (this.findMinHeight() >= this.findMaxHeight() - 1);
	}

	// Returns the distance from the root node to the first leaf node without 2 children
	findMinHeight(node = this.root) {
		if (null === node) {
			return -1; // this was return -1 in orig code, why??
		}

		let left = this.findMinHeight(node.left);
		let right = this.findMinHeight(node.right);

		if (left < right) {
			return left + 1;
		} else {
			return right + 1;
		}
	}

	// returns distance from root node to furthest node (which will have no children)
	findMaxHeight(node = this.root) {
		if (null === node) {
			return -1;
		}

		let left = this.findMinHeight(node.left);
		let right = this.findMinHeight(node.right);

		if (left > right) {
			return left + 1;
		} else {
			return right + 1;
		}
	}

	// Begin search at left most node & end at right most node
	inOrder() {
		let result = [];

		function traverseInOrder(node) {
			node.left && traverseInOrder(node.left);
			result.push(node.data);
			node.right && traverseInOrder(node.right);
		}

		if (null === this.root) {
			return -1;
		} else {
			traverseInOrder(this.root);
			return result;
		}
	}

	// Explore the root nodes before the leaves
	preOrder() {
		let result = [];

		function traversePreOrder(node) {
			result.push(node.data);
			node.left && traversePreOrder(node.left);
			node.right && traversePreOrder(node.right);
		}

		if (null === this.root) {
			return null;
		} else {
			traversePreOrder(this.root);
			return result;
		}
	}

	// Explores leaf nodes before the roots, for each branch level
	// Starts with left-most branch
	postOrder() {
		let result = [];

		function traversePostOrder (node) {
			node.left && traversePostOrder(node.left);
			node.right && traversePostOrder(node.right);
			result.push(node.data);
		}

		if (null === this.root) {
			return null;
		} else {
			traversePostOrder(this.root);
			return result;
		}
	}

	// Breadth-first search: Explores all the nodes per level,
	// before moving onto the next level
	levelOrder() {
		let result = [];
		let Q = [];

		if (null !== this.root) {
			Q.push(this.root);

			while (Q.length > 0) {
				let node = Q.shift();
				result.push(node.data);

				if (null !== node.left) {
					Q.push(node.left);
				}

				if (null !== node.right) {
					Q.push(node.right);
				}
			}
			return result;
		} else {
			return null;
		}
	}
}

const bst = new BST();

bst.add(9);
bst.add(4);
bst.add(17);
bst.add(3);
bst.add(6);
bst.add(22);
bst.add(5);
bst.add(7);
bst.add(20);

console.log(bst.findMinHeight());
console.log(bst.findMaxHeight());
console.log(bst.isBalanced());
bst.add(10);
console.log(bst.findMinHeight());
console.log(bst.findMaxHeight());
console.log(bst.isBalanced());
console.log('inOrder: ' + bst.inOrder());
console.log('preOrder: ' + bst.preOrder());
console.log('postOrder: ' + bst.postOrder());

console.log('levelOrder: ' + bst.levelOrder());
