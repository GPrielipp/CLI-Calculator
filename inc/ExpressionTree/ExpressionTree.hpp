#ifndef EXPRESSION_TREE_HPP
#define EXPRESSION_TREE_HPP

#include <string>
#include "../Node/ComponentNode.hpp"
#include "../Visitor/Visitor.hpp"

class ExpressionTree
{
protected:
    ComponentNode* root;
public:
    ExpressionTree(ComponentNode* root);
    bool is_null();
    int item();
    ExpressionTree left();
    ExpressionTree right();
    void accept(Visitor& visitor);
    iterator begin(const std::string& traversal_order);
    iterator end(const std::string& traversal_order);

    struct iterator
    {
        using iterator_category = std::forward_iterator_tag;
        using difference_type   = std::ptrdiff_t;
        using value_type        = ComponentNode;
        using pointer           = ComponentNode*;
        using reference         = ComponentNode&;
    };
};


#endif//EXPRESSION_TREE_HPP