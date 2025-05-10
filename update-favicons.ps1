# Define the project files to update
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
    Write-Host "Updating $file..."
    
    # Read the file content
    $content = Get-Content -Path $file -Raw
    
    # Check if favicon links are already present
    if ($content -notmatch '<link rel="icon" href="../favicon.svg"') {
        # Add favicon links after the title tag
        $content = $content -replace '(<title>.*?</title>)', '$1
    <link rel="icon" href="../favicon.svg" type="image/svg+xml">
    <link rel="alternate icon" href="../favicon.ico" type="image/x-icon">'
        
        # Write the updated content back to the file
        Set-Content -Path $file -Value $content
    } else {
        Write-Host "Favicon links already present in $file, skipping."
    }
}

Write-Host "All project pages have been updated with favicon links!" 