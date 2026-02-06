param(
    [Parameter(Mandatory = $true)]
    [ValidateSet('setup', 'compile')]
    [string]$Action
)

$ErrorActionPreference = 'Stop'

function Invoke-InVsX86([string]$Command) {
    $programFilesX86 = [Environment]::GetFolderPath('ProgramFilesX86')
    $vswhere = Join-Path $programFilesX86 'Microsoft Visual Studio\Installer\vswhere.exe'
    if (-not (Test-Path $vswhere)) {
        throw "vswhere.exe not found at '$vswhere'."
    }

    $vsPath = & $vswhere -latest -products * -property installationPath
    if ([string]::IsNullOrWhiteSpace($vsPath)) {
        throw 'No Visual Studio installation was found by vswhere.'
    }

    $vsDevCmd = Join-Path $vsPath 'Common7\Tools\VsDevCmd.bat'
    if (-not (Test-Path $vsDevCmd)) {
        throw "VsDevCmd.bat not found at '$vsDevCmd'."
    }

    $cmd = '"' + $vsDevCmd + '" -arch=x86 -host_arch=x64 >nul && set CC=cl && set CXX=cl && ' + $Command
    cmd /c $cmd
    if ($LASTEXITCODE -ne 0) {
        exit $LASTEXITCODE
    }
}

switch ($Action) {
    'setup' {
        if (Test-Path 'builddir/meson-private/coredata.dat') {
            Invoke-InVsX86 'meson setup builddir --reconfigure'
        }
        else {
            Invoke-InVsX86 'meson setup builddir --backend ninja --buildtype release'
        }
    }
    'compile' {
        Invoke-InVsX86 'meson compile -C builddir'
    }
}
