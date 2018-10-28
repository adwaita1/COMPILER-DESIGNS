struct IntListNode
{
	int val;
	struct IntListNode *next;
};

struct ParseTreeNode
{
	char place[10];
	char type[10];
	struct IntListNode *truelist,*falselist;
};

struct quad
{
	char op[10];
	char arg1[100];
	char arg2[100];
	char res[100];
	char type[100];
};


