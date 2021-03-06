.\Add-RoslynLibraries

$slnFileName = Resolve-Path "..\chapter05\BeaverMusic\BeaverMusic.sln"

$FirstProject = ([Roslyn.Services.Solution]::Load($slnFileName)).Projects | 
                    Select -First 1

$FirstDocument = $FirstProject.Documents | 
    Select -First 1 

$cancelToken = New-Object System.Threading.CancellationToken
$Root = $FirstDocument.GetSyntaxTree($cancelToken).GetRoot($cancelToken)
$Root.Usings | Select name