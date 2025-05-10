# rákuts archive - Portfolio Website

A beautiful bento grid portfolio website for architecture and interior visualization studio.

## Features

- Responsive bento grid layout
- Interactive hover effects
- Lightbox image viewer
- Animated entrance effects
- Mobile-friendly design

## How to Use

1. Simply open the `index.html` file in your web browser to view the website locally.
2. To deploy to the web, upload all files to your web hosting provider.

## Customizing Content

### Updating Images

Replace the images in the `images/` folder with your own images. Update the `src` attributes in the HTML file accordingly.

### Updating Project Descriptions

To update project descriptions, modify the `data-title` and `data-description` attributes in the HTML file for each bento item. These will automatically update both in the hover overlay and in the lightbox.

Example:
```html
<div class="bento-item large-item" data-title="Your New Title" data-description="Your new description text goes here.">
    <img src="images/your-image.jpg" alt="Project Title">
    <div class="overlay">
        <h3>Your New Title</h3>
        <p>Your new description text goes here.</p>
    </div>
</div>
```

### Changing the Grid Layout

You can modify the grid layout by changing the classes assigned to each bento item:

- `large-item`: Takes up 2x2 grid spaces
- `medium-item`: Takes up 2x1 grid spaces
- `small-item`: Takes up 1x1 grid space

## Customizing Style

To change the visual style of the website, edit the `styles.css` file. Here are some common customizations:

### Colors

- Background color: Change `body { background-color: #f5f5f5; }`
- Bento item background: Change `.bento-item { background-color: #fff; }`
- Name item background: Change `.name-item { background-color: #f0f0f0; }`
- Text colors: Change various color properties in the CSS

### Fonts

The website uses 'Inter' font from Google Fonts. To change the font:

1. Update the Google Fonts link in the HTML head section with your preferred font
2. Update the font-family in the CSS: `body { font-family: 'Your Font', sans-serif; }`

### Border Radius

To change the roundness of the bento items, modify:
```css
.bento-item {
    border-radius: 24px; /* Change this value */
}
```

## Need Help?

Please contact rákuts archive for any additional customization needs. 