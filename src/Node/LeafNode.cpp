#include "../../inc/Node/LeafNode.hpp"

template <typename T>
LeafNode<T>::LeafNode(T contents)
: ComponentNode(NO_NODE, NO_NODE, LEAF)
{
    this->value = contents;
}

template <typename T>
void LeafNode<T>::accept(Visitor& visitor)
{
    // ahhhh
}