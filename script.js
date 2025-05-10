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

// Add a simple lightbox functionality
document.addEventListener('click', (e) => {
    const bentoItem = e.target.closest('.bento-item');
    
    if (bentoItem && !bentoItem.classList.contains('studio-item')) {
        // Get the image source
        const imgSrc = bentoItem.querySelector('img').src;
        const title = bentoItem.getAttribute('data-title');
        const description = bentoItem.getAttribute('data-description');
        
        // Create lightbox elements
        const lightbox = document.createElement('div');
        lightbox.classList.add('lightbox');
        
        const lightboxContent = document.createElement('div');
        lightboxContent.classList.add('lightbox-content');
        
        const lightboxImg = document.createElement('img');
        lightboxImg.src = imgSrc;
        
        const lightboxInfo = document.createElement('div');
        lightboxInfo.classList.add('lightbox-info');
        
        const lightboxTitle = document.createElement('h2');
        lightboxTitle.textContent = title;
        
        const lightboxDesc = document.createElement('p');
        lightboxDesc.textContent = description;
        
        const closeBtn = document.createElement('button');
        closeBtn.classList.add('lightbox-close');
        closeBtn.textContent = '×';
        closeBtn.addEventListener('click', (e) => {
            e.stopPropagation();
            document.body.removeChild(lightbox);
        });
        
        // Assemble and append lightbox elements
        lightboxInfo.appendChild(lightboxTitle);
        lightboxInfo.appendChild(lightboxDesc);
        
        lightboxContent.appendChild(lightboxImg);
        lightboxContent.appendChild(lightboxInfo);
        
        lightbox.appendChild(closeBtn);
        lightbox.appendChild(lightboxContent);
        
        // Add lightbox to body
        document.body.appendChild(lightbox);
        
        // Close lightbox when clicking outside the image
        lightbox.addEventListener('click', () => {
            document.body.removeChild(lightbox);
        });
        
        // Prevent closing when clicking on the content
        lightboxContent.addEventListener('click', (e) => {
            e.stopPropagation();
        });
    }
});

// Add additional styles for the lightbox
const style = document.createElement('style');
style.textContent = `
    .lightbox {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.9);
        display: flex;
        align-items: center;
        justify-content: center;
        z-index: 1000;
        opacity: 0;
        animation: fadeIn 0.3s forwards;
    }
    
    @keyframes fadeIn {
        from { opacity: 0; }
        to { opacity: 1; }
    }
    
    .lightbox-content {
        max-width: 90%;
        max-height: 90%;
        display: flex;
        flex-direction: column;
        background-color: #fff;
        border-radius: 12px;
        overflow: hidden;
        box-shadow: 0 5px 30px rgba(0, 0, 0, 0.3);
        animation: scaleIn 0.3s forwards;
    }
    
    @keyframes scaleIn {
        from { transform: scale(0.9); }
        to { transform: scale(1); }
    }
    
    .lightbox-content img {
        max-width: 100%;
        max-height: 80vh;
        object-fit: contain;
    }
    
    .lightbox-info {
        padding: 1.5rem;
        background-color: #fff;
    }
    
    .lightbox-info h2 {
        margin-bottom: 0.5rem;
        font-weight: 500;
    }
    
    .lightbox-info p {
        color: #666;
        line-height: 1.6;
    }
    
    .lightbox-close {
        position: absolute;
        top: 1rem;
        right: 1.5rem;
        background: none;
        border: none;
        color: #fff;
        font-size: 2.5rem;
        cursor: pointer;
        z-index: 1001;
    }
    
    .lightbox-close:hover {
        color: #ddd;
    }
    
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