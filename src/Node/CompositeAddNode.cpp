#include "../../inc/Node/CompositeAddNode.hpp"

CompositeAddNode::CompositeAddNode(ComponentNode* left, ComponentNode* right) 
: ComponentNode(left, right, BINARY) {}

void CompositeAddNode::accept(Visitor& visitor)
{
    // ahhhhhh
}