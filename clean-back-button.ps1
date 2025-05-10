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
    Write-Host "Cleaning back button CSS in $file..."
    
    # Read the file content
    $content = Get-Content -Path $file -Raw
    
    # Find the style tag content
    if ($content -match '<style>(.*?)</style>') {
        $styleContent = $matches[1]
        
        # Remove all existing back-button CSS
        $styleContent = $styleContent -replace '\.back-button\s*\{[^}]*\}', ''
        $styleContent = $styleContent -replace '\.back-button:hover\s*\{[^}]*\}', ''
        
        # Remove all media queries related to back-button
        $styleContent = $styleContent -replace '@media\s*\([^)]*\)\s*\{[^{]*\.back-button[^}]*\}[^}]*\}', ''
        
        # Add new clean back-button CSS
        $newBackButtonCSS = @"
        .back-button {
            display: inline-block;
            position: fixed;
            bottom: 2rem;
            left: 2rem;
            padding: 0.8rem 1.5rem;
            background-color: white;
            color: #333;
            text-decoration: none;
            border-radius: 30px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            opacity: 0;
            animation: fadeIn 0.8s forwards;
            animation-delay: 1.3s;
            font-weight: 500;
            z-index: 10;
        }
        
        .back-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
        }
        
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
                position: fixed;
                left: 50%;
                right: auto;
                bottom: 1.5rem;
                transform: translateX(-50%);
                width: auto;
                text-align: center;
                margin-left: auto;
                margin-right: auto;
                padding: 0.7rem 1.2rem;
                font-size: 0.9rem;
            }
            
            .back-button:hover {
                transform: translateX(-50%) translateY(-2px);
            }
        }
"@
        
        # Replace the style tag content
        $updatedContent = $content -replace '<style>(.*?)</style>', "<style>$styleContent$newBackButtonCSS</style>"
        
        # Write the updated content back to the file
        Set-Content -Path $file -Value $updatedContent
    } else {
        Write-Host "Could not find style tag in $file"
    }
}

Write-Host "All back buttons have been cleaned and fixed for better mobile centering!" 