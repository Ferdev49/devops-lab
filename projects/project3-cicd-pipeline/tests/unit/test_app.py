"""
Unit tests for app.py
"""
import pytest
from app import add, subtract, hello_world


class TestMath:
    """Tests for math functions"""
    
    def test_add_positive_numbers(self):
        """Test adding two positive numbers"""
        assert add(5, 3) == 8
    
    def test_add_negative_numbers(self):
        """Test adding negative numbers"""
        assert add(-5, -3) == -8
    
    def test_add_mixed(self):
        """Test adding positive and negative"""
        assert add(10, -5) == 5
    
    def test_subtract_positive(self):
        """Test subtracting positive numbers"""
        assert subtract(10, 4) == 6
    
    def test_subtract_negative(self):
        """Test subtracting negative numbers"""
        assert subtract(-10, -5) == -5
    
    def test_subtract_result_negative(self):
        """Test subtraction resulting in negative"""
        assert subtract(5, 10) == -5


class TestGreeting:
    """Tests for greeting function"""
    
    def test_hello_world(self):
        """Test hello_world returns correct string"""
        result = hello_world()
        assert result == "Hello, CI/CD Pipeline!"
    
    def test_hello_world_is_string(self):
        """Test hello_world returns a string"""
        result = hello_world()
        assert isinstance(result, str)