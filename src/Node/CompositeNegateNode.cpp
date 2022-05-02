#include "../../inc/Node/CompositeNegateNode.hpp"

CompositeNegateNode::CompositeNegateNode(ComponentNode* negatedNode)
: ComponentNode(negatedNode, NO_NODE, UNARY) {}

void CompositeNegateNode::accept(Visitor& visitor)
{
    // ahhhh
}