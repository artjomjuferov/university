#include <iostream>
#include <string>

template <class T> struct Node
{
	T data;
	Node<T>* next;
	Node<T>* prev;
};

template <typename T> class List
{
public:
	List();
	void add(T data);
	void pop_back();
	void show();
	bool empty();
private:
	Node<T>* head;
	Node<T>* tail;
};

template <typename T>
List<T>::List():
head(NULL),
tail(NULL)
{
}

template <typename T>
void List<T>::add(T data)
{
	Node<T>* tmp = new Node<T>;
	tmp->data = data;
	tmp->next = NULL;

	if (head != NULL)
	{
		tmp->prev = tail;
		tail->next = tmp;
		tail = tmp;
	}
	else
	{
		tmp->prev = NULL;
		head = tail = tmp;
	}
}

template <typename T>
void List<T>::show()
{
	if (head == NULL)
	{
		std::cout << "empty" << std::endl;
		return;
	}

	Node<T>* tmp = head;

	while (tmp != NULL)
	{
		std::cout << tmp->data << ' ';
		tmp = tmp->next;
	}
	std::cout << std::endl;
}

template <typename T>
bool List<T>::empty()
{
	if (head == NULL)
		return true;
	return false;
}

template <typename T>
void List<T>::pop_back()
{
	if (!empty())
	{
		if (tail->prev == NULL)
		{
			tail = head = NULL;
		}
		else
		{
			tail->prev->next = tail->next;
			delete tail;
		}
	}
}

template <class T> class Stack
{
public:
	Stack(){};
	void pop();
	void push(T data);
	bool empty();
	void show();
private:
	List<T> mList;
};

template <typename T>
void Stack<T>::pop()
{
	if (!mList.empty())
		mList.pop_back();
	else
		std::cout << "stack is empty" << std::endl;
}

template <typename T>
void Stack<T>::push(T data)
{
	mList.add(data);
}

template <typename T>
bool Stack<T>::empty()
{
	return mList.empty();
}

template <typename T>
void Stack<T>::show()
{
	mList.show();
}


int main()
{
	Stack<std::string> st;
	
	st.pop();
	st.push("dgd");
	st.push("dsgsdg");
	st.push("dwgd");
	st.pop();
	st.show();
	return 0;
}