#include "../../inc/ExpressionTree/ExpressionTree.hpp"

ExpressionTree::ExpressionTree(ComponentNode* root)
{
    this->root = root;
}

bool ExpressionTree::is_null()
{
    // not sure what this function is supposed to do XD
    return false;
}

int ExpressionTree::item()
{
    return this->root->item();
}

ExpressionTree ExpressionTree::left()
{
    return this->root->left();
}

ExpressionTree ExpressionTree::right()
{
    return this->root->right();
}

void ExpressionTree::accept(Visitor& visitor)
{
    this->root->accept(visitor);
}

