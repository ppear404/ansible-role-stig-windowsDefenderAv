# Defender Antivirus V2R10 control map

The DISA source is `files/U_MS_Defender_Antivirus_V2R10_STIG.zip`, member
`U_MS_Defender_Antivirus_V2R10_Manual_STIG/U_MS_Defender_Antivirus_STIG_V2R10_Manual-xccdf.xml`.
The Evaluate-STIG 1.2610.1 archive contains byte-identical XCCDF under `StigContent/`
and matching `Get-V<number>` functions in
`Modules/Scan-MicrosoftDefenderAntivirus_Checks/Scan-MicrosoftDefenderAntivirus_Checks.psm1`.
The settings below apply to Defender-managed Windows Server 2025 using normal
policy registry paths. The evaluator uses alternate Policy Manager paths for
Intune-managed devices where the benchmark provides an Intune check.

| Vuln ID | Rule ID | Applicability and policy criteria |
| --- | --- | --- |
| V-213426 | SV-213426r1260200_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender` / `PUAProtection` → dword 1. |
| V-213427 | SV-213427r961197_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender` / `DisableRoutinelyTakingAction` → dword 0 (absence also passes). |
| V-213428 | SV-213428r1192794_rule | Windows 10 policy. On Server 2025, validate active Defender and record the evaluator’s legacy value check. |
| V-213429 | SV-213429r1207390_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Exclusions` / `Exclusions_Paths` → absent and policy exclusion list removed. |
| V-213430 | SV-213430r1207392_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Exclusions` / `Exclusions_Processes` → absent and policy exclusion list removed. |
| V-213431 | SV-213431r1207394_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Exclusions` / `DisableAutoExclusions` → dword 0. |
| V-213432 | SV-213432r961092_rule | Unclassified. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet` / `LocalSettingOverrideSpynetReporting` → dword 0 (absence also passes). |
| V-213433 | SV-213433r1192798_rule | Unclassified. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet` / `DisableBlockAtFirstSeen` → dword 0. |
| V-213434 | SV-213434r1134051_rule | Unclassified. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet` / `SpynetReporting` → dword 2 (accepted values 1, 2). |
| V-213435 | SV-213435r961092_rule | Unclassified. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet` / `SubmitSamplesConsent` → dword 1. |
| V-213436 | SV-213436r1192799_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\NIS` / `DisableProtocolRecognition` → dword 0 (absence also passes). |
| V-213437 | SV-213437r960921_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection` / `LocalSettingOverrideDisableOnAccessProtection` → dword 0 (absence also passes). |
| V-213438 | SV-213438r960921_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection` / `LocalSettingOverrideRealtimeScanDirection` → dword 0 (absence also passes). |
| V-213439 | SV-213439r961089_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection` / `LocalSettingOverrideDisableIOAVProtection` → dword 0 (absence also passes). |
| V-213440 | SV-213440r961092_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection` / `LocalSettingOverrideDisableBehaviorMonitoring` → dword 0 (absence also passes). |
| V-213441 | SV-213441r1192800_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection` / `LocalSettingOverrideDisableRealtimeMonitoring` → dword 0 (absence also passes). |
| V-213442 | SV-213442r1260202_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection` / `RealtimeScanDirection` → dword 0. |
| V-213443 | SV-213443r1260204_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection` / `DisableOnAccessProtection` → dword 0 (absence also passes). |
| V-213444 | SV-213444r1260206_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection` / `DisableIOAVProtection` → dword 0 (absence also passes). |
| V-213445 | SV-213445r1260208_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection` / `DisableRealtimeMonitoring` → dword 0 (absence also passes). |
| V-213446 | SV-213446r1260210_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection` / `DisableBehaviorMonitoring` → dword 0 (absence also passes). |
| V-213447 | SV-213447r1192804_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection` / `DisableScanOnRealtimeEnable` → dword 0 (absence also passes). |
| V-213448 | SV-213448r1271016_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Scan` / `DisableArchiveScanning` → dword 0 (absence also passes). |
| V-213449 | SV-213449r1260214_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Scan` / `DisableRemovableDriveScanning` → dword 0. |
| V-213450 | SV-213450r1260216_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Scan` / `ScheduleDay` → dword 1 (accepted values 0, 1, 2, 3, 4, 5, 6, 7). |
| V-213451 | SV-213451r1260219_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Scan` / `DisableEmailScanning` → dword 0. |
| V-213452 | SV-213452r1192806_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Signature Updates` / `ASSignatureDue` → dword 7 (accepted values 1, 2, 3, 4, 5, 6, 7). |
| V-213453 | SV-213453r1192807_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Signature Updates` / `AVSignatureDue` → dword 7 (accepted values 1, 2, 3, 4, 5, 6, 7). |
| V-213454 | SV-213454r961161_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Signature Updates` / `ScheduleDay` → dword 0. |
| V-213455 | SV-213455r1271018_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Threats\ThreatSeverityDefaultAction` / `5` → string '2' (accepted values 2, 3). |
| V-213456 | SV-213456r961092_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules` / `BE9BA2D9-53EA-4CDC-84E5-9B1EEEE46550` → string '1'. |
| V-213457 | SV-213457r961092_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules` / `D4F940AB-401B-4EFC-AADC-AD5F3C50688A` → string '1'. |
| V-213458 | SV-213458r961092_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules` / `3B576869-A4EC-4529-8536-B80A7769E899` → string '1'. |
| V-213459 | SV-213459r961092_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules` / `75668C1F-73B5-4CF0-BB93-3ECF5CB7CC84` → string '1'. |
| V-213460 | SV-213460r961092_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules` / `D3E037E1-3EB8-44C8-A917-57927947596D` → string '1'. |
| V-213461 | SV-213461r961092_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules` / `5BEB7EFE-FD9A-4556-801D-275E5FFC04CC` → string '1'. |
| V-213462 | SV-213462r961092_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules` / `92E97FA1-2EDF-4476-BDD6-9DD0B4DDDC7B` → string '1'. |
| V-213463 | SV-213463r1260221_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Network Protection` / `EnableNetworkProtection` → dword 1. |
| V-213464 | SV-213464r961086_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Threats\ThreatSeverityDefaultAction` / `4` → string '2' (accepted values 2, 3). |
| V-213465 | SV-213465r961086_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Threats\ThreatSeverityDefaultAction` / `2` → string '2' (accepted values 2, 3). |
| V-213466 | SV-213466r961086_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Threats\ThreatSeverityDefaultAction` / `1` → string '2' (accepted values 2, 3). |
| V-278647 | SV-278647r1192808_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules` / `7674ba52-37eb-4a4f-a9a1-f0f9a1619a2c` → string '1'. |
| V-278648 | SV-278648r1192809_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules` / `9e6c4e1f-7d60-472f-ba1a-a39ef669e4b2` → string '1'. |
| V-278649 | SV-278649r1192810_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules` / `b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4` → string '1'. |
| V-278650 | SV-278650r1192811_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules` / `c1db55ab-c21a-4637-bb3f-a12568109d35` → string '1'. |
| V-278651 | SV-278651r1192812_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules` / `d1e49aac-8f56-4280-b9ba-993a6d77406c` → string '2'. |
| V-278652 | SV-278652r1192813_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules` / `e6db77e5-3df2-4cf1-b95a-636979351e5b` → string '2'. |
| V-278653 | SV-278653r1192814_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules` / `01443614-cd74-433a-b99e-2ecdc07bfc25` → string '2'. |
| V-278654 | SV-278654r1192815_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules` / `26190899-1602-49e8-8b27-eb1d0a1ce869` → string '1'. |
| V-278655 | SV-278655r1192816_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules` / `56a863a9-875e-4185-98a7-b882c64b5ce5` → string '1'. |
| V-278656 | SV-278656r1192817_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender` / `DisableLocalAdminMerge` → dword 1. |
| V-278659 | SV-278659r1192819_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender` / `RandomizeScheduleTaskTimes` → dword 1. |
| V-278660 | SV-278660r1192820_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Family options` / `UILockdown` → dword 1. |
| V-278661 | SV-278661r1192821_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\MpEngine` / `EnableFileHashComputation` → dword 1. |
| V-278662 | SV-278662r1192822_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\MpEngine` / `MpBafsExtendedTimeout` → dword 50. |
| V-278668 | SV-278668r1192823_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection` / `DisableScriptScanning` → dword 0. |
| V-278669 | SV-278669r1192824_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection` / `OobeEnableRtpAndSigUpdate` → dword 1. |
| V-278672 | SV-278672r1192825_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Network Protection` / `AllowNetworkProtectionOnWinServer` → dword 1. |
| V-278674 | SV-278674r1192826_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Features` / `PassiveRemediation` → dword 1. |
| V-278675 | SV-278675r1192827_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Reporting` / `EnableDynamicSignatureDroppedEventReporting` → dword 1. |
| V-278676 | SV-278676r1192828_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Scan` / `QuickScanIncludeExclusions` → dword 1. |
| V-278677 | SV-278677r1192829_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\NIS` / `EnableConvertWarnToBlock` → dword 1. |
| V-278678 | SV-278678r1192830_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\NIS` / `AllowSwitchToAsyncInspection` → dword 1. |
| V-278679 | SV-278679r1192831_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Scan` / `DisablePackedExeScanning` → dword 0. |
| V-278680 | SV-278680r1192832_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Scan` / `DisableHeuristics` → dword 0. |
| V-278863 | SV-278863r1192833_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\MpEngine` / `MpCloudBlockLevel` → dword 2. |
| V-278658 | SV-278658r1207388_rule | Windows Server 2025. `HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender` / `HideExclusionsFromLocalAdmins` → dword 1. |
