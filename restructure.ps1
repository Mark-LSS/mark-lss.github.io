$ErrorActionPreference = "Stop"

Write-Host "Creating folders..."
$folders = @(
    "assets",
    "assets\css",
    "assets\img",
    "calculators",
    "emergency",
    "familiarisations",
    "documents",
    "systems"
)

foreach ($folder in $folders) {
    if (-not (Test-Path $folder)) {
        New-Item -ItemType Directory -Path $folder | Out-Null
        Write-Host "Created: $folder"
    }
}

Write-Host "Moving calculator files..."
$calculatorFiles = @(
    "bailout-endurance.html",
    "calculate-otu-and-esot.html",
    "daltons-law-calculations.html",
    "ead-and-table-depth-selection.html",
    "esot-recovery-calculator.html",
    "multi-segment-otu-esot.html",
    "otu-esot-converter.html",
    "vital-capacity-reduction-calculator.html"
)

foreach ($file in $calculatorFiles) {
    if (Test-Path $file) {
        Move-Item -Path $file -Destination "calculators\$file" -Force
        Write-Host "Moved: $file -> calculators\$file"
    } else {
        Write-Host "Missing calculator file: $file"
    }
}

Write-Host "Moving emergency files..."
$emergencyFiles = @(
    "bailout-opened-while-on-nitrox.html",
    "nitrox-failure-switch-to-air.html"
)

foreach ($file in $emergencyFiles) {
    if (Test-Path $file) {
        Move-Item -Path $file -Destination "emergency\$file" -Force
        Write-Host "Moved: $file -> emergency\$file"
    } else {
        Write-Host "Emergency file not found yet: $file"
    }
}

function New-PlaceholderPage {
    param(
        [string]$Path,
        [string]$Title,
        [string]$Heading,
        [string]$Text
    )

    if (-not (Test-Path $Path)) {
@"
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>$Title</title>
  <link rel="stylesheet" href="../assets/css/site.css">
</head>
<body>

<header class="site-header">
  <div class="container header-inner">
    <div class="brand">
      <div class="brand-mark">∩</div>
      <div>
        <h1>Diving Toolkit</h1>
        <p class="tagline">Operational calculators and support tools</p>
      </div>
    </div>

    <nav class="top-nav">
      <a href="../index.html">Home</a>
      <a href="../index.html#calculators">Calculators</a>
      <a href="../index.html#emergency">Emergency</a>
      <a href="../index.html#documents">Documents</a>
    </nav>
  </div>
</header>

<main class="tool-page">
  <div class="container tool-shell">
    <div class="tool-topbar">
      <div class="tool-breadcrumbs">
        <a href="../index.html">Home</a>
        <span>/</span>
        <span>$Heading</span>
      </div>

      <a class="back-home" href="../index.html">← Back to Home</a>
    </div>

    <div class="info-card">
      <h2>$Heading</h2>
      <p>$Text</p>
    </div>
  </div>
</main>

<footer class="site-footer">
  <div class="container footer-inner">
    <span>Diving Toolkit</span>
    <span>Structured operational portal</span>
  </div>
</footer>

</body>
</html>
"@ | Set-Content -Path $Path -Encoding UTF8

        Write-Host "Created placeholder: $Path"
    }
}

Write-Host "Creating placeholder section pages..."
New-PlaceholderPage -Path "familiarisations\index.html" -Title "Familiarisations" -Heading "Familiarisations" -Text "Familiarisation content will be added here."
New-PlaceholderPage -Path "documents\index.html" -Title "Documents" -Heading "Documents" -Text "Document links and references will be added here."
New-PlaceholderPage -Path "systems\index.html" -Title "Systems & Tools" -Heading "Systems & Tools" -Text "Systems and support tools will be added here."

Write-Host ""
Write-Host "Done."
Write-Host "Next:"
Write-Host "1. Put site.css into assets\css\site.css"
Write-Host "2. Update root index.html links to calculators\ and emergency\"
Write-Host "3. Commit and push to GitHub"