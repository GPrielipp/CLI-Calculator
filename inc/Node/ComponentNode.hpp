#ifndef COMPONENT_NODE_HPP
#define COMPONENT_NODE_HPP

#include "../Visitor/Visitor.hpp"
#define NO_NODE nullptr

enum NodeTypes
{
    COMPONENT=-1,
    LEAF,
    INTERIOR,
    UNARY,
    BINARY
};

class ComponentNode 
{
private:
protected:
    ComponentNode* leftNode;
    ComponentNode* rightNode;
    NodeTypes type;
public:
    ComponentNode();
    ComponentNode(ComponentNode* leftChild, ComponentNode* rightChild, NodeTypes type);
    NodeTypes item();
    ComponentNode* left();
    ComponentNode* right();
    virtual void accept(Visitor &visitor) = 0;
};

#endif//COMPONENT_NODE_HPP