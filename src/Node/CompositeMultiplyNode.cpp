#include "../../inc/Node/CompositeMultiplyNode.hpp"

CompositeMultiplyNode::CompositeMultiplyNode(ComponentNode* left, ComponentNode* right)
: ComponentNode(left, right, BINARY) {}

void CompositeMultiplyNode::accept(Visitor& visitor)
{
    // ahhhhh
}