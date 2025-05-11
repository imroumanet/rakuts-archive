# Define the project files and their corresponding new URLs
$projects = @(
    @{file = "projects/shape1.html"; backLink = "home"},
    @{file = "projects/shape2.html"; backLink = "home"},
    @{file = "projects/shape3.html"; backLink = "home"},
    @{file = "projects/shape4.html"; backLink = "home"},
    @{file = "projects/shape5.html"; backLink = "home"},
    @{file = "projects/shape6.html"; backLink = "home"},
    @{file = "projects/shape7.html"; backLink = "home"},
    @{file = "projects/shape8.html"; backLink = "home"},
    @{file = "projects/shape9.html"; backLink = "home"}
)

foreach ($project in $projects) {
    Write-Host "Updating links in $($project.file)..."
    
    # Read the file content
    $content = Get-Content -Path $project.file -Raw
    
    # Replace the back button link
    $updatedContent = $content -replace '<a href="../index.html" class="back-button">', "<a href=`"../$($project.backLink)`" class=`"back-button`">"
    
    # Write the updated content back to the file
    if ($updatedContent -ne $content) {
        Set-Content -Path $project.file -Value $updatedContent
        Write-Host "Updated $($project.file) successfully."
    } else {
        Write-Host "No changes needed for $($project.file)."
    }
}

Write-Host "All project pages have been updated to use clean URLs!" 