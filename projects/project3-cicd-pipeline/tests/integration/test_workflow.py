"""
Integration tests for app workflow
"""
import sys
import os

# Agregar el directorio padre al path
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../..')))

from app import add, subtract, hello_world


class TestIntegration:
    """Integration tests combining multiple functions"""
    
    def test_complete_workflow(self):
        """Test a complete workflow combining functions"""
        greeting = hello_world()
        result_add = add(5, 3)
        result_sub = subtract(result_add, 2)
        
        assert greeting == "Hello, CI/CD Pipeline!"
        assert result_add == 8
        assert result_sub == 6
    
    def test_chained_operations(self):
        """Test chaining multiple operations"""
        value = 10
        value = add(value, 5)      # 15
        value = subtract(value, 3)  # 12
        value = add(value, 8)       # 20
        
        assert value == 20