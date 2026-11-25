# SPDX-License-Identifier: MIT-0
[CmdletBinding(SupportsShouldProcess)]
param([string]$PolicyJson)

$Ansible.Changed = $false
$policy = ConvertFrom-Json -InputObject $PolicyJson
$hklm = [Microsoft.Win32.RegistryKey]::OpenBaseKey(
    [Microsoft.Win32.RegistryHive]::LocalMachine, [Microsoft.Win32.RegistryView]::Registry64
)
$before = [ordered]@{}
$after = [ordered]@{}
$pending = [System.Collections.Generic.List[object]]::new()

try {
    foreach ($entry in $policy) {
        $key = $hklm.OpenSubKey($entry.path)
        $label = "HKLM:\$($entry.path)"
        $actual = $null
        $desired = $null
        try {
            if ($entry.name) {
                $label += "\$($entry.name)"
                if ($null -ne $key -and $key.GetValueNames() -contains $entry.name) {
                    $actual = @{
                        type = $key.GetValueKind($entry.name).ToString()
                        data = $key.GetValue($entry.name, $null, 'DoNotExpandEnvironmentNames')
                    }
                }
                if ($entry.type) {
                    $desired = @{ type = $entry.type; data = $entry.data }
                }
            }
            elseif ($null -ne $key) {
                $actual = 'Exclusion list exists'
            }
        }
        finally {
            if ($null -ne $key) { $key.Dispose() }
        }

        if ($null -eq $desired) {
            if ($null -eq $actual) { continue }
        }
        elseif ($null -ne $actual -and $actual.type -eq $desired.type -and $actual.data -ceq $desired.data) {
            continue
        }
        $before[$label] = $actual
        $after[$label] = $desired
        $pending.Add($entry)
    }

    $Ansible.Diff = @{ before = $before; after = $after }
    $Ansible.Changed = $pending.Count -gt 0
    if ($Ansible.CheckMode) { return }

    foreach ($entry in $pending) {
        if (-not $entry.name) {
            $hklm.DeleteSubKeyTree($entry.path, $false)
            continue
        }
        $key = if ($entry.type) { $hklm.CreateSubKey($entry.path) } else { $hklm.OpenSubKey($entry.path, $true) }
        try {
            if ($entry.type) {
                $key.SetValue($entry.name, $entry.data, [Microsoft.Win32.RegistryValueKind]$entry.type)
            }
            elseif ($null -ne $key) {
                $key.DeleteValue($entry.name, $false)
            }
        }
        finally {
            if ($null -ne $key) { $key.Dispose() }
        }
    }
}
finally {
    $hklm.Dispose()
}
