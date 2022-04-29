#ifndef COMPONENT_NODE_HPP
#define COMPONENT_NODE_HPP

#include "../Visitor/Visitor.hpp"
class Component_Node 
{
private:
public:
    virtual int item() = 0;
    virtual Component_Node* left() = 0;
    virtual Component_Node* right() = 0;
    virtual void accept(Visitor &visitor) = 0;
};

#endif//COMPONENT_NODE_HPP