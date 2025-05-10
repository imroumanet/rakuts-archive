# Define the project information from index.html
$projects = @(
    @{
        file = "shape1.html"
        title = "Project Wonka Chocolate"
        year = "2025"
        description = "A luxury interior design project"
        alt = "Project Wonka Chocolate"
    },
    @{
        file = "shape2.html"
        title = "Complex R11"
        year = "2023"
        description = "A modern residential complex project"
        alt = "Complex R11"
    },
    @{
        file = "shape3.html"
        title = "Project Salted Caramel"
        year = "2025"
        description = "A sophisticated kitchen design project"
        alt = "Project Salted Caramel"
    },
    @{
        file = "shape4.html"
        title = "Equestrian Space"
        year = "2023"
        description = "An elegant gallery space designed for equestrian art exhibitions"
        alt = "Equestrian Space"
    },
    @{
        file = "shape5.html"
        title = "Project Tropical Paradise"
        year = "2025"
        description = "A vibrant living corner design with tropical elements"
        alt = "Project Tropical Paradise"
    },
    @{
        file = "shape6.html"
        title = "Villa Savannah"
        year = "2024"
        description = "A luxurious bathroom design for a modern villa"
        alt = "Villa Savannah"
    },
    @{
        file = "shape7.html"
        title = "Project Scandi"
        year = "2024"
        description = "A minimalist modern villa with Scandinavian influences"
        alt = "Project Scandi"
    },
    @{
        file = "shape8.html"
        title = "Project Vanilla"
        year = "2025"
        description = "A sophisticated dining space with neutral tones"
        alt = "Project Vanilla"
    },
    @{
        file = "shape9.html"
        title = "Solitude View"
        year = "2024"
        description = "A tranquil spa bathroom with panoramic views"
        alt = "Solitude View"
    }
)

foreach ($project in $projects) {
    $filePath = "projects/$($project.file)"
    Write-Host "Updating $filePath..."
    
    # Read the file content
    $content = Get-Content -Path $filePath -Raw
    
    # Update document title in head section
    $content = $content -replace '<title>.*?</title>', "<title>$($project.title) - rákuts archive</title>"
    
    # Update h1 title
    $content = $content -replace '<h1 class="project-title">.*?</h1>', "<h1 class=`"project-title`">$($project.title)</h1>"
    
    # Update description
    $content = $content -replace '<p class="project-description">.*?</p>', "<p class=`"project-description`">$($project.description) completed in $($project.year). Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et purus eget erat vulputate pharetra nec ac odio. In hac habitasse platea dictumst. Sed ornare luctus placerat.</p>"
    
    # Update image alt text
    $content = $content -replace 'alt=".*?" class="project-image"', "alt=`"$($project.alt)`" class=`"project-image`""
    
    # Add year to project details if not already there
    if ($content -notmatch '<p><strong>Year:</strong>') {
        $content = $content -replace '<h3>Project Details</h3>', "<h3>Project Details</h3>`n                    <p><strong>Year:</strong> $($project.year)</p>"
    }
    
    # Write the updated content back to the file
    Set-Content -Path $filePath -Value $content
}

Write-Host "All project pages have been updated!" 