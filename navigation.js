// Handle page transitions and navigation
document.addEventListener('DOMContentLoaded', function() {
    // Handle page transitions
    if (sessionStorage.getItem('isPageTransition') === 'true') {
        // If this is a page we navigated to, add initial hidden class
        document.body.classList.add('page-entering');
        
        // After a delay, show the page content
        setTimeout(() => {
            document.body.classList.add('page-visible');
            // Clear the session flag
            sessionStorage.removeItem('isPageTransition');
        }, 300);
    } else {
        // If direct page load, just show content
        document.body.classList.add('page-visible');
    }

    // Set up navigation for all links
    const allLinks = document.querySelectorAll('a[href]:not([href^="javascript"]):not([href^="#"]):not([href^="mailto"]):not([target="_blank"])');
    const pageTransition = document.querySelector('.page-transition');

    allLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            // Don't handle if it's a mailto link or external link
            if (this.getAttribute('href').startsWith('mailto:') || this.getAttribute('target') === '_blank') {
                return;
            }

            e.preventDefault();
            
            // Store the href for redirection
            const href = this.getAttribute('href');
            
            // Set flag for the target page
            sessionStorage.setItem('isPageTransition', 'true');
            
            // Fade out current page
            document.body.classList.add('page-leaving');
            if (pageTransition) {
                pageTransition.classList.add('active');
            }
            
            // Delay redirection to allow for animations
            setTimeout(function() {
                window.location.href = href;
            }, 700); // 0.7 second delay
        });
    });

    // Handle browser back/forward buttons
    window.addEventListener('popstate', function() {
        sessionStorage.setItem('isPageTransition', 'true');
    });
}); 