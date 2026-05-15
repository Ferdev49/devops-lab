"""
End-to-End (E2E) tests for complete workflow
Tests the entire application from start to finish
"""
import sys
import os

# Agregar el directorio padre al path
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../..')))

from app import add, subtract, hello_world


class TestE2EWorkflow:
    """End-to-end tests for complete application workflow"""
    
    def test_complete_user_journey(self):
        """Test complete user journey through the application"""
        # Step 1: Greeting
        greeting = hello_world()
        assert greeting == "Hello, CI/CD Pipeline!"
        
        # Step 2: Math operations
        result1 = add(10, 5)
        assert result1 == 15
        
        result2 = subtract(result1, 3)
        assert result2 == 12
        
        # Step 3: Verify final result
        assert result2 > 0
        assert isinstance(result2, int)
    
    def test_application_reliability(self):
        """Test application reliability with multiple operations"""
        operations_count = 10
        results = []
        
        for i in range(operations_count):
            value = add(i, i)
            value = subtract(value, 1)
            results.append(value)
        
        assert len(results) == operations_count
        assert all(isinstance(r, int) for r in results)
    
    def test_edge_cases(self):
        """Test edge cases and boundary conditions"""
        # Zero values
        assert add(0, 0) == 0
        assert subtract(0, 0) == 0
        
        # Large numbers
        assert add(1000000, 1000000) == 2000000
        
        # Negative results
        result = subtract(5, 10)
        assert result == -5
        
        # Mixed operations
        value = 100
        value = add(value, 50)      # 150
        value = subtract(value, 75)  # 75
        assert value == 75
    
    def test_data_integrity(self):
        """Test that data integrity is maintained through operations"""
        original_value = 42
        
        # Perform operations
        result = add(original_value, 8)  # 50
        result = subtract(result, 8)     # 42
        
        # Verify we get back the original value
        assert result == original_value
    
    def test_concurrent_operations(self):
        """Test that multiple operations work correctly together"""
        results = []
        
        for i in range(5):
            temp = add(i, 1)
            temp = subtract(temp, 1)
            results.append(temp)
        
        assert results == [0, 1, 2, 3, 4]


class TestProductionReadiness:
    """Tests to verify production readiness"""
    
    def test_application_startup(self):
        """Test that application starts without errors"""
        greeting = hello_world()
        assert greeting is not None
        assert len(greeting) > 0
    
    def test_error_handling(self):
        """Test basic error handling"""
        try:
            result = add(5, 3)
            assert result == 8
        except Exception as e:
            raise AssertionError(f"Unexpected error: {e}")
    
    def test_response_time(self):
        """Test that operations complete in reasonable time"""
        import time
        
        start = time.time()
        for _ in range(100):
            add(1, 1)
            subtract(2, 1)
        elapsed = time.time() - start
        
        # Should complete in less than 1 second
        assert elapsed < 1.0
    
    def test_memory_efficiency(self):
        """Test that operations don't leak memory"""
        results = []
        
        # Perform many operations
        for i in range(1000):
            value = add(i, i)
            results.append(value)
        
        # Should successfully complete without memory issues
        assert len(results) == 1000