# Define the project files to update
$projectFiles = @(
    "projects/shape1.html",
    "projects/shape2.html",
    "projects/shape3.html",
    "projects/shape4.html",
    "projects/shape5.html",
    "projects/shape6.html",
    "projects/shape7.html",
    "projects/shape8.html",
    "projects/shape9.html"
)

foreach ($file in $projectFiles) {
    Write-Host "Updating back button in $file..."
    
    # Read the file content
    $content = Get-Content -Path $file -Raw
    
    # Find the mobile media query section for the back button
    $pattern = '(@media \(max-width: 768px\) \{[^}]*?\.back-button \{[^}]*?)left: 50%;([^}]*?transform: translateX\(-50%\)[^}]*?\})'
    
    # Update with improved centering CSS
    $replacement = '$1left: 50% !important;$2width: auto !important; right: auto !important; margin-left: auto !important; margin-right: auto !important;}'
    
    # Apply the replacement
    $updatedContent = $content -replace $pattern, $replacement
    
    # If the pattern wasn't found or replacement didn't work, try an alternative approach
    if ($updatedContent -eq $content) {
        # Find the back-button class and add the mobile-specific CSS
        $backButtonPattern = '(\.back-button \{[^}]*?\})'
        $mobileMediaQueryPattern = '(@media \(max-width: 768px\) \{[^}]*?\})'
        
        # Create improved mobile CSS for the back button
        $mobileBackButtonCSS = @"
        @media (max-width: 768px) {
            .back-button {
                position: fixed !important;
                left: 50% !important;
                right: auto !important;
                bottom: 1.5rem !important;
                transform: translateX(-50%) !important;
                width: auto !important;
                text-align: center !important;
                margin-left: auto !important;
                margin-right: auto !important;
                padding: 0.7rem 1.2rem !important;
                font-size: 0.9rem !important;
            }
            
            .back-button:hover {
                transform: translateX(-50%) translateY(-2px) !important;
            }
        }
"@
        
        # Check if there's already a media query
        if ($content -match $mobileMediaQueryPattern) {
            # Add our CSS before the closing </style> tag
            $updatedContent = $content -replace '</style>', "$mobileBackButtonCSS`n    </style>"
        } else {
            # Add our CSS before the closing </style> tag
            $updatedContent = $content -replace '</style>', "$mobileBackButtonCSS`n    </style>"
        }
    }
    
    # Write the updated content back to the file
    Set-Content -Path $file -Value $updatedContent
}

Write-Host "All back buttons have been updated for better mobile centering!" 