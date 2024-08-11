// 1. Cơ bản (C#)
using System;

public delegate void MyDelegate(string message);

class Program
{
    static void Main()
    {
        MyDelegate del = new MyDelegate(ShowMessage);
        del("Hello, Delegate!");
    }

    static void ShowMessage(string message)
    {
        Console.WriteLine(message);
    }
}


// 2. Tham Số và Giá Trị Trả Về
using System;

public delegate int MathOperation(int x, int y);

class Program
{
    static void Main()
    {
        MathOperation add = new MathOperation(Add);
        MathOperation multiply = new MathOperation(Multiply);

        int sum = add(5, 3);
        int product = multiply(5, 3);

        Console.WriteLine($"Sum: {sum}");
        Console.WriteLine($"Product: {product}");
    }

    static int Add(int x, int y)
    {
        return x + y;
    }

    static int Multiply(int x, int y)
    {
        return x * y;
    }
}


// 3. Multicast Delegate
using System;

public delegate void MultiDelegate(string message);

class Program
{
    static void Main()
    {
        MultiDelegate del = ShowMessage;
        del += ShowAnotherMessage;

        del("Hello, Multicast Delegate!");
    }

    static void ShowMessage(string message)
    {
        Console.WriteLine("Message 1: " + message);
    }

    static void ShowAnotherMessage(string message)
    {
        Console.WriteLine("Message 2: " + message);
    }
}


// 4. Anonymous Method
using System;

public delegate void AnonymousDelegate(string message);

class Program
{
    static void Main()
    {
        AnonymousDelegate del = delegate (string message)
        {
            Console.WriteLine("Anonymous Method: " + message);
        };

        del("Hello, Anonymous Method!");
    }
}


// 5. Lambda Expression
using System;

public delegate void LambdaDelegate(string message);

class Program
{
    static void Main()
    {
        LambdaDelegate del = message => Console.WriteLine("Lambda Expression: " + message);

        del("Hello, Lambda Expression!");
    }
}


// Biểu thức lambda trong C# là cách viết ngắn gọn và rõ ràng cho các phương thức hoặc hàm vô danh
// Nó cung cấp một cú pháp súc tích hơn so với việc sử dụng delegate hoặc phương thức ẩn danh