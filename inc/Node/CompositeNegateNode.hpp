#ifndef COMPOSITE_NEGATE_NODE_HPP
#define COMPOSITE_NEGATE_NODE_HPP

#include "ComponentNode.hpp"

class CompositeNegateNode : public ComponentNode
{
private:
    ComponentNode* negatedNode;
public:
    CompositeNegateNode(ComponentNode* negatedNode);
    ~CompositeNegateNode();
    NodeTypes item();       //return NodeTypes::UNARY
    ComponentNode* left();  //return NO_NODE
    ComponentNode* right(); //return this->negatedNode
    void accept(Visitor &visitor);
};

#endif//COMPOSITE_NEGATE_NODE_HPP