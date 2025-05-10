# Define the project files to update (excluding shape1.html which is already fixed)
$projectFiles = @(
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
    
    # Find and replace the back button CSS in the mobile media query
    $pattern = '\.back-button\s*\{\s*position:\s*fixed;\s*left:\s*50%;\s*right:\s*auto;'
    $replacement = '.back-button { position: fixed; left: 120px; right: 120px;'
    
    # Apply the replacement
    $updatedContent = $content -replace $pattern, $replacement
    
    # Write the updated content back to the file
    if ($updatedContent -ne $content) {
        Set-Content -Path $file -Value $updatedContent
        Write-Host "Updated $file successfully."
    } else {
        Write-Host "Could not update $file - pattern not found."
    }
}

Write-Host "All back buttons have been updated with left: 120px; right: 120px; for mobile view!" 