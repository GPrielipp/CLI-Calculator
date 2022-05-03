#include "../../inc/Node/LeafNode.hpp"

// trying to fix undefined reference
template class LeafNode<int>;


template <typename T>
LeafNode<T>::LeafNode(T contents)
: ComponentNode(NO_NODE, NO_NODE, LEAF)
{
    this->mvalue = contents;
}

template <typename T>
T LeafNode<T>::value()
{
    return this->mvalue;
}

template <typename T>
void LeafNode<T>::accept(Visitor& visitor)
{
    // ahhhh
}