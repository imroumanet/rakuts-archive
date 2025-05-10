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

# Read the fixed CSS from shape1.html
$shape1Content = Get-Content -Path "projects/shape1.html" -Raw

# Extract the style section
if ($shape1Content -match '(?s)<style>(.*?)</style>') {
    $fixedStyleContent = $matches[1]
    
    foreach ($file in $projectFiles) {
        Write-Host "Updating back button in $file..."
        
        # Read the file content
        $content = Get-Content -Path $file -Raw
        
        # Replace the style section
        if ($content -match '(?s)<style>(.*?)</style>') {
            $updatedContent = $content -replace '(?s)<style>(.*?)</style>', "<style>$fixedStyleContent</style>"
            
            # Write the updated content back to the file
            Set-Content -Path $file -Value $updatedContent
            Write-Host "Updated $file successfully."
        } else {
            Write-Host "Could not find style tag in $file"
        }
    }
} else {
    Write-Host "Could not extract style content from shape1.html"
}

Write-Host "All back buttons have been fixed for better mobile centering!" 