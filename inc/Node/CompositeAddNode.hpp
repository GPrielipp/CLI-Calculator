#ifndef COMPOSITE_ADD_NODE_HPP
#define COMPOSITE_ADD_NODE_HPP

#include "./ComponentNode.hpp"

class CompositeAddNode : public ComponentNode
{
private:
    ComponentNode* leftChild;
    ComponentNode* rightChild;
public:
    CompositeAddNode(ComponentNode* left, ComponentNode* right);
    ~CompositeAddNode();
    NodeTypes item();       //return NodeTypes::BINARY
    ComponentNode* left();  //return this->leftChild
    ComponentNode* right(); //return this->rightChild
    void accept(Visitor &visitor);
};

#endif//COMPOSITE_ADD_NODE_HPP