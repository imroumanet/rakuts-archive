# Update all project pages to include the custom cursor
$projectFiles = Get-ChildItem -Path "projects" -Filter "*.html"

foreach ($file in $projectFiles) {
    Write-Host "Updating $($file.Name)..."
    
    # Read the file content
    $content = Get-Content -Path $file.FullName -Raw
    
    # Add custom-cursor.css if it doesn't exist
    if ($content -notmatch '<link rel="stylesheet" href="../custom-cursor.css">') {
        $content = $content -replace '(<link rel="stylesheet" href="../styles.css">)', '$1
    <link rel="stylesheet" href="../custom-cursor.css">'
    }
    
    # Add custom-cursor.js if it doesn't exist
    if ($content -notmatch '<script src="../custom-cursor.js"></script>') {
        $content = $content -replace '(<div class="page-transition"></div>)', '$1
    
    <script src="../custom-cursor.js"></script>'
    }
    
    # Write the updated content back to the file
    Set-Content -Path $file.FullName -Value $content
}

Write-Host "All project pages have been updated!" 