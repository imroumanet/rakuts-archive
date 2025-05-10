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
    Write-Host "Fixing back button in $file..."
    
    # Read the file content
    $content = Get-Content -Path $file -Raw
    
    # Remove the duplicate media query section for the back button
    $pattern = '(@media \(max-width: 768px\) \{[^}]*?\.back-button \{[^}]*?transform: translateX\(-50%\)[^}]*?\}[^}]*?\})\s*@media \(max-width: 768px\) \{[^}]*?\.back-button \{[^}]*?transform: translateX\(-50%\) !important[^}]*?\}[^}]*?\}'
    
    # Create a consolidated media query with all the necessary CSS properties
    $replacement = @"
        @media (max-width: 768px) {
            .project-container {
                padding: 1.5rem;
            }
            
            .project-title {
                font-size: 2.2rem;
            }
            
            .project-content {
                grid-template-columns: 1fr;
                gap: 1.5rem;
            }
            
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
    
    # Apply the replacement
    $updatedContent = $content -replace $pattern, $replacement
    
    # If the pattern wasn't found or replacement didn't work, try an alternative approach
    if ($updatedContent -eq $content) {
        # Find all media queries and replace them with our consolidated one
        $mediaQueryPattern = '@media \(max-width: 768px\) \{[^}]*?\}'
        
        # Remove all existing media queries
        $contentWithoutMediaQueries = $content -replace $mediaQueryPattern, ''
        
        # Add our consolidated media query before the closing </style> tag
        $updatedContent = $contentWithoutMediaQueries -replace '</style>', "$replacement`n    </style>"
    }
    
    # Write the updated content back to the file
    Set-Content -Path $file -Value $updatedContent
}

Write-Host "All back buttons have been fixed for better mobile centering!" 