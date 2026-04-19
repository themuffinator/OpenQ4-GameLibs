param(
    [Parameter(Mandatory = $true)]
    [ValidateSet('setup', 'compile')]
    [string]$Action
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$workspaceRoot = [System.IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..'))
$mesonWrapper = Join-Path $workspaceRoot 'tools\build\meson_setup.ps1'
$buildDir = Join-Path $workspaceRoot 'builddir'

if (-not (Test-Path $mesonWrapper)) {
    throw "OpenQ4-GameLibs Meson wrapper not found at '$mesonWrapper'."
}

function Invoke-GameLibsMeson([string[]]$MesonArgs) {
    & powershell -NoProfile -ExecutionPolicy Bypass -File $mesonWrapper @MesonArgs
    if ($LASTEXITCODE -ne 0) {
        exit $LASTEXITCODE
    }
}

function Test-MesonBuildDirectory([string]$Path) {
    $coreData = Join-Path $Path 'meson-private\coredata.dat'
    $ninjaFile = Join-Path $Path 'build.ninja'
    return (Test-Path $coreData) -and (Test-Path $ninjaFile)
}

switch ($Action) {
    'setup' {
        if (Test-MesonBuildDirectory $buildDir) {
            Invoke-GameLibsMeson @(
                'setup',
                $buildDir,
                $workspaceRoot,
                '--reconfigure',
                '--backend',
                'ninja',
                '--buildtype',
                'release',
                '--vsenv'
            )
        } else {
            Invoke-GameLibsMeson @(
                'setup',
                '--wipe',
                $buildDir,
                $workspaceRoot,
                '--backend',
                'ninja',
                '--buildtype',
                'release',
                '--vsenv'
            )
        }
    }
    'compile' {
        Invoke-GameLibsMeson @(
            'compile',
            '-C',
            $buildDir
        )
    }
}
