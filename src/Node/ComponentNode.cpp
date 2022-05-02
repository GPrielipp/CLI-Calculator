#include "../../inc/Node/ComponentNode.hpp"

ComponentNode::ComponentNode() 
{
    this->leftNode = NO_NODE;
    this->rightNode = NO_NODE;
    this->type = COMPONENT;
}

ComponentNode::ComponentNode(ComponentNode* leftChild, ComponentNode* rightChild, NodeTypes type)
{
    this->leftNode = leftChild;
    this->rightNode = rightChild;
    this->type = type;
}

NodeTypes ComponentNode::item()
{
    return this->type;
}

ComponentNode* ComponentNode::left()
{
    return this->leftNode;
}

ComponentNode* ComponentNode::right()
{
    return this->rightNode;
}