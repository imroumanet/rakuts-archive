document.addEventListener('DOMContentLoaded', function() {
    // Function to detect if the device is a mobile/touch device
    function isTouchDevice() {
        return (('ontouchstart' in window) ||
                (navigator.maxTouchPoints > 0) ||
                (navigator.msMaxTouchPoints > 0));
    }
    
    // Only initialize custom cursor on non-touch devices
    if (!isTouchDevice()) {
        // Create the custom cursor element
        const cursor = document.createElement('div');
        cursor.className = 'custom-cursor';
        cursor.textContent = '*';
        document.body.appendChild(cursor);
        
        // Add the active class to the body
        document.body.classList.add('custom-cursor-active');
        
        // Function to update cursor position
        function updateCursorPosition(e) {
            cursor.style.left = `${e.clientX}px`;
            cursor.style.top = `${e.clientY}px`;
        }
        
        // Listen for mouse movement to update cursor position
        document.addEventListener('mousemove', updateCursorPosition);
        
        // Handle cursor state when mouse enters/leaves the window
        document.addEventListener('mouseenter', function() {
            cursor.style.opacity = '1';
        });
        
        document.addEventListener('mouseleave', function() {
            cursor.style.opacity = '0';
        });
        
        // Handle cursor state for clickable elements
        const clickableElements = document.querySelectorAll('a, button, input, textarea, select, [role="button"], .bento-item, .full-link');
        
        clickableElements.forEach(element => {
            element.addEventListener('mouseenter', function() {
                cursor.classList.add('clickable');
            });
            
            element.addEventListener('mouseleave', function() {
                cursor.classList.remove('clickable');
            });
        });
        
        // Handle cursor state during clicks
        document.addEventListener('mousedown', function() {
            cursor.style.transform = 'translate(-50%, -50%) scale(0.9)';
        });
        
        document.addEventListener('mouseup', function() {
            cursor.style.transform = 'translate(-50%, -50%) scale(1)';
        });
    }
}); 