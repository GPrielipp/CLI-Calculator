#ifndef LEAF_NODE_HPP
#define LEAF_NODE_HPP

#include "ComponentNode.hpp"

template <typename T>
class LeafNode : public ComponentNode
{
private:
    T mvalue;
public:
    LeafNode(T contents);
    ~LeafNode();
    NodeTypes item();       // return NodeTypes::LEAF
    T value();               // return this->value
    ComponentNode* left();  // return NO_NODE
    ComponentNode* right(); // return NO_NODE
    void accept(Visitor &visitor);
};

#endif//LEAF_NODE_HPP