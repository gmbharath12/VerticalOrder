//
//  main.m
//  Trees
//
//  Created by Bharath G M on 7/27/14.
//  Copyright (c) 2014 Bharath G M. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <malloc/malloc.h>

struct node
{
    int data;
    struct node *left;
    struct node *right;
};
typedef struct node* NODE;

NODE getNewNode(int new_data)
{
    NODE temp = (struct node*)malloc(sizeof(struct node));
    temp->data = new_data;
    temp->left = NULL;
    temp->right = NULL;
    return temp;
}

void getVerticalOrder(NODE root, NSMutableDictionary* hashTable,int horizontalDistance)
{
    if (root == NULL)
    {
        return;
    }
    NSMutableArray* larray;
    
    if (![hashTable objectForKey:[NSString stringWithFormat:@"%d",horizontalDistance]])
    {
        larray = [NSMutableArray array];
        [larray addObject:[NSString stringWithFormat:@"%d",root->data]];
        [hashTable setObject:larray forKey:[NSString stringWithFormat:@"%d",horizontalDistance]];
    }
    else
    {
        [[hashTable objectForKey:[NSString stringWithFormat:@"%d",horizontalDistance]] addObject:[NSString stringWithFormat:@"%d",root->data]];
    }
         
    getVerticalOrder(root->left, hashTable, horizontalDistance-1);
    getVerticalOrder(root->right, hashTable, horizontalDistance+1);
}

void printVerticalOrder(NODE root)
{
    if (root == NULL)
    {
        return ;
    }
    NSMutableDictionary *hashTable = [[NSMutableDictionary alloc] init];
    int horizontalDistance = 0;
    getVerticalOrder(root, hashTable,horizontalDistance);
    NSLog(@" \n Vertical Order of a tree = %@",hashTable);
}


int main(int argc, const char * argv[])
{

    @autoreleasepool
    {
        NODE root = getNewNode(1);
        root->left = getNewNode(2);
        root->right = getNewNode(3);
        root->left->left = getNewNode(4);
        root->left->right = getNewNode(5);
        root->right->left = getNewNode(6);
        root->right->right = getNewNode(7);
        root->right->left->right = getNewNode(8);
        root->right->right->right = getNewNode(9);
        printf("Vertical order traversal is \n");
        printVerticalOrder(root);
        
    }
    return 0;
}

