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
    Write-Host "Updating mobile back button in $file..."
    
    # Read the file content
    $content = Get-Content -Path $file -Raw
    
    # Find the mobile media query section for the back button and update it
    $pattern = '(@media \(max-width: 768px\) \{[^}]*?\.back-button \{[^}]*?)left: 50%;([^}]*?transform: translateX\(-50%\)[^}]*?\})'
    
    # Update with the new left and right values
    $replacement = '$1left: 120px; right: 120px;$2'
    
    # Apply the replacement
    $updatedContent = $content -replace $pattern, $replacement
    
    # If the pattern wasn't found or replacement didn't work, try a more direct approach
    if ($updatedContent -eq $content) {
        # Find the mobile media query section
        $mobileMediaQueryPattern = '(@media \(max-width: 768px\) \{[^{]*\.back-button \{)([^}]*?)(\})'
        
        # Add the left and right properties
        $replacement = '$1$2 left: 120px; right: 120px; $3'
        
        # Apply the replacement
        $updatedContent = $content -replace $mobileMediaQueryPattern, $replacement
    }
    
    # Write the updated content back to the file
    if ($updatedContent -ne $content) {
        Set-Content -Path $file -Value $updatedContent
        Write-Host "Updated $file successfully."
    } else {
        Write-Host "Could not update $file - pattern not found."
    }
}

Write-Host "All back buttons have been updated with left: 120px; right: 120px; for mobile view!" 