"""
Simple Flask app for CI/CD Pipeline demonstration
"""

def hello_world():
    """Return a greeting message"""
    return "Hello, CI/CD Pipeline!"


def add(a, b):
    """Add two numbers"""
    return a + b


def subtract(a, b):
    """Subtract two numbers"""
    return a - b


if __name__ == "__main__":
    print(hello_world())
    print(f"5 + 3 = {add(5, 3)}")
    print(f"10 - 4 = {subtract(10, 4)}")