#include <iostream>
#include <memory>
#include <string>
#include "../inc/calc-package.hpp"

std::unique_ptr<ComponentNode*> make_expr_tree(std::string)
{
	ComponentNode* l1 = new LeafNode<int>(5);
	ComponentNode* l2 = new LeafNode<int>(3);
	ComponentNode* l3 = new LeafNode<int>(4);
	ComponentNode* neg = new CompositeNegateNode(l1);
	ComponentNode* add = new CompositeAddNode(l2, l3);
	ComponentNode* mul = new CompositeMultiplyNode(neg, add);
	mul = dynamic_cast<ComponentNode*>(mul);
	return std::make_unique<ComponentNode*>(mul);
}

int main(int argc, char* argv[]) {
	/* SAMPLE PROBLEM FOR THIS CODE
		-5(3+4) = -35
			  x
			/   \
		   -     +
		    \   / \
			 5 3   4
	*/
	// would like to get to this point vvvv
	// std::unique_ptr<Component_Node*> expr_tree = make_expr_tree("-5 * (3 + 4)");
	std::unique_ptr<ComponentNode*> expr_tree = make_expr_tree("-5 * (3 + 4)");

	std::cout << (*expr_tree.get())->item() << std::endl;

	std::cout << "Program success" << std::endl;
	return EXIT_SUCCESS;
}