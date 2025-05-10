document.addEventListener('DOMContentLoaded', () => {
    const bentoItems = document.querySelectorAll('.bento-item');
    
    // Add hover effects for each bento item
    bentoItems.forEach(item => {
        if (item.classList.contains('studio-item')) return; // Skip the studio name item
        
        // Get data attributes
        const title = item.getAttribute('data-title');
        const description = item.getAttribute('data-description');
        
        // Create overlay content if not already set in HTML
        if (!item.querySelector('.overlay')) {
            const overlay = document.createElement('div');
            overlay.classList.add('overlay');
            
            const titleElement = document.createElement('h3');
            titleElement.textContent = title;
            
            const descElement = document.createElement('p');
            descElement.textContent = description;
            
            overlay.appendChild(titleElement);
            overlay.appendChild(descElement);
            
            item.appendChild(overlay);
        }
    });
    
    // Add animation when the page loads
    setTimeout(() => {
        document.body.classList.add('loaded');
        
        bentoItems.forEach((item, index) => {
            setTimeout(() => {
                item.classList.add('visible');
            }, index * 100);
        });
    }, 300);
});

// Add styles for animations and transitions
const style = document.createElement('style');
style.textContent = `    
    .visible {
        opacity: 1;
        transform: translateY(0);
    }
    
    body.loaded .bento-item {
        opacity: 0;
        transform: translateY(20px);
        transition: opacity 0.5s ease, transform 0.5s ease;
    }
    
    body.loaded .bento-item.visible {
        opacity: 1;
        transform: translateY(0);
    }
`;

document.head.appendChild(style);

// Wait for DOM to be fully loaded
document.addEventListener('DOMContentLoaded', function() {
    // Add page transition div to the body
    const transitionElement = document.createElement('div');
    transitionElement.className = 'page-transition';
    document.body.appendChild(transitionElement);
    
    // Handle page entering animation
    if (sessionStorage.getItem('isPageTransition') === 'true') {
        // If this is a page we navigated to, add initial hidden class
        document.body.classList.add('page-entering');
        
        // After a delay, show the page content
        setTimeout(() => {
            document.body.classList.add('page-visible');
            // Clear the session flag
            sessionStorage.removeItem('isPageTransition');
        }, 300); // Delay before showing content
    }
    
    // Get all elements with the class 'full-link'
    const links = document.querySelectorAll('.full-link');
    
    // Add click event listener to each link
    links.forEach(link => {
        link.addEventListener('click', function(e) {
            // Prevent default link behavior
            e.preventDefault();
            
            // Store the href for redirection
            const href = this.getAttribute('href');
            
            // Set flag for the target page
            sessionStorage.setItem('isPageTransition', 'true');
            
            // Fade out current page
            document.body.classList.add('page-leaving');
            transitionElement.classList.add('active');
            
            // Apply button press animation if it's the studio button
            if (this.closest('.studio-item')) {
                const studioItem = this.closest('.studio-item');
                studioItem.classList.add('button-pressed');
            }
            
            // Delay redirection to allow for animations
            setTimeout(function() {
                window.location.href = href;
            }, 700); // 0.7 second delay
        });
    });
    
    // Set up email popup functionality
    const contactLink = document.getElementById('contact-link');
    const emailPopup = document.getElementById('email-popup');
    const closePopup = document.querySelector('.close-popup');
    const copyEmailBtn = document.getElementById('copy-email');
    
    if (contactLink) {
        contactLink.addEventListener('click', function() {
            emailPopup.style.display = 'flex';
        });
    }
    
    if (closePopup) {
        closePopup.addEventListener('click', function() {
            emailPopup.style.display = 'none';
        });
    }
    
    // Close popup when clicking outside
    window.addEventListener('click', function(e) {
        if (e.target === emailPopup) {
            emailPopup.style.display = 'none';
        }
    });
    
    // Copy email functionality
    if (copyEmailBtn) {
        copyEmailBtn.addEventListener('click', function() {
            const emailText = this.previousElementSibling.textContent;
            
            // Create a temporary input element
            const tempInput = document.createElement('input');
            tempInput.value = emailText;
            document.body.appendChild(tempInput);
            
            // Select and copy the text
            tempInput.select();
            document.execCommand('copy');
            
            // Remove the temporary element
            document.body.removeChild(tempInput);
            
            // Change button text temporarily
            const originalText = this.textContent;
            this.textContent = 'Copied!';
            this.style.backgroundColor = '#28a745';
            
            // Reset button after a delay
            setTimeout(() => {
                this.textContent = originalText;
                this.style.backgroundColor = '';
            }, 1500);
        });
    }
}); 