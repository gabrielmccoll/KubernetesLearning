$files = git diff --cached --name-only
foreach ($file in $files) {
    if ($file -like "*.yml" -or $file -like "*.yaml" -and $file -notlike "ADO") {
        checkov.cmd -f $file --quiet --compact
        if ($LASTEXITCODE -gt 0) {
            exit 1
        }
    }
}