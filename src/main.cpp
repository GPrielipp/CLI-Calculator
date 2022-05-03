#include <iostream>
#include <memory>
#include <string>
#include "../inc/nodes.hpp"

std::unique_ptr<ComponentNode*> make_expr_tree(std::string)
{
	ComponentNode* nodes[] = {

	};
	return nullptr;
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

	std::cout << "Program success" << std::endl;
	return EXIT_SUCCESS;
}