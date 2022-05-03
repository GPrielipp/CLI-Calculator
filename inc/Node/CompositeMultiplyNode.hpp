#ifndef COMPOSITE_MULTIPLY_NODE_HPP
#define COMPOSITE_MULTIPLY_NODE_HPP

#include "ComponentNode.hpp"

class CompositeMultiplyNode : public ComponentNode
{
private:
public:
    CompositeMultiplyNode(ComponentNode* left, ComponentNode* right);
    ~CompositeMultiplyNode();
    NodeTypes item();       //return NodeTypes::BINARY
    ComponentNode* left();  //return this->leftChild
    ComponentNode* right(); //return this->rightChild
    void accept(Visitor &visitor);
};

#endif//COMPOSITE_MULTIPLY_NODE_HPP