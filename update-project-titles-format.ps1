# Define the project files and their corresponding titles
$projects = @(
    @{file = "projects/shape1.html"; name = "Project Wonka Chocolate"},
    @{file = "projects/shape2.html"; name = "Complex R11"},
    @{file = "projects/shape3.html"; name = "Project Salted Caramel"},
    @{file = "projects/shape4.html"; name = "Equestrian Space"},
    @{file = "projects/shape5.html"; name = "Project Tropical Paradise"},
    @{file = "projects/shape6.html"; name = "Villa Savannah"},
    @{file = "projects/shape7.html"; name = "Project Scandi"},
    @{file = "projects/shape8.html"; name = "Project Vanilla"},
    @{file = "projects/shape9.html"; name = "Solitude View"}
)

foreach ($project in $projects) {
    Write-Host "Updating title in $($project.file)..."
    
    # Read the file content
    $content = Get-Content -Path $project.file -Raw
    
    # Update the title tag to "rákuts - [project name]"
    $newTitle = "rákuts - $($project.name)"
    $content = $content -replace '<title>.*?</title>', "<title>$newTitle</title>"
    
    # Write the updated content back to the file
    Set-Content -Path $project.file -Value $content
}

Write-Host "All project page titles have been updated to the new format!" 