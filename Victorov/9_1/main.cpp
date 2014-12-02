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
	void add_front(T data);
	void add_back(T data);
	void pop_back();
	void pop_front();
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
void List<T>::add_front(T data)
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
void List<T>::add_back(T data)
{
	Node<T>* tmp = new Node<T>;
	tmp->data = data;
	tmp->prev = NULL;

	if (head != NULL)
	{
		tmp->next = head;
		head->prev = tmp;
		head = tmp;
	}
	else
	{
		tmp->next = NULL;
		head = tail = tmp;
	}
}

template <typename T>
void List<T>::show()
{
	if (head == NULL)
	{
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
void List<T>::pop_front()
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

template <typename T>
void List<T>::pop_back()
{
	if (!empty())
	{
		if (tail->next == NULL)
		{
			tail = head = NULL;
		}
		else
		{
			head->next->prev = head->prev;
			delete head;
		}
	}
}

template <class T> class Deque
{
public:
	Deque(){};
	void pop_front();
	void pop_back();
	void push_front(T data);
	void push_back(T data);
	bool empty();
	void show();
private:
	List<T> mList;
};

template <typename T>
void Deque <T>::pop_front()
{
	if (!mList.empty())
		mList.pop_front();
	else
		std::cout << "stack is empty" << std::endl;
}

template <typename T>
void Deque <T>::pop_back()
{
	if (!mList.empty())
		mList.pop_back();
	else
		std::cout << "stack is empty" << std::endl;
}

template <typename T>
void Deque <T>::push_back(T data)
{
	mList.add_back(data);
}

template <typename T>
void Deque <T>::push_front(T data)
{
	mList.add_front(data);
}

template <typename T>
bool Deque <T>::empty()
{
	return mList.empty();
}

template <typename T>
void Deque <T>::show()
{
	mList.show();
}


int main()
{
	Deque <int> que;
	
	que.pop_front();
	que.push_front(1);
	que.show();
	que.push_front(2);
	que.show();
	que.push_back(3);
	que.show();
	que.pop_front();
	que.show();
	que.pop_back();
	que.show();
	que.show();
	que.show();

	return 0;
}