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
    Write-Host "Updating title in $file..."
    
    # Read the file content
    $content = Get-Content -Path $file -Raw
    
    # Update the title tag to just "rákuts"
    $content = $content -replace '<title>.*?</title>', '<title>rákuts</title>'
    
    # Write the updated content back to the file
    Set-Content -Path $file -Value $content
}

Write-Host "All project page titles have been updated to 'rákuts'!" 