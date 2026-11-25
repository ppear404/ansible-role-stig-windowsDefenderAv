# Microsoft Defender Antivirus DISA STIG

This role applies the Defender Antivirus V2R10 benchmark to Windows Server 2025
endpoints that use Defender as their primary antivirus. It manages 66 controls
through the local computer policy registry and checks that Defender is active.
V-213428 specifies a Windows 10 policy and receives runtime coverage on Server
2025. See the [control map](tests/control-map.md) for the Vuln IDs, Rule IDs,
applicability, source files, and expected settings.

Requires the repository's `ansible.windows` collection, a Windows administrator
connection, and permission to use Windows `runas` with SYSTEM. The development
playbook uses SYSTEM so it can evaluate and manage exclusion policy after
visibility is restricted. Apply this role only where Ansible owns these policy
values. A domain GPO or Intune policy managing the same setting can take
precedence and should be reconciled at its source.

## Role variables

| Variable | Default | Purpose |
| --- | --- | --- |
| `stig_win_defender_antivirus_unclassified` | `false` | Enable the four unclassified MAPS controls on systems approved to use MAPS and submit safe samples. |
| `stig_win_defender_antivirus_exceptions` | `[]` | Vuln IDs deliberately excluded from remediation. Record the reason and evidence for each exception in the site security plan. |

The role selects a weekly Sunday scan, quarantines threats at all four alert
levels, and applies V-278658 after the other registry controls. Individual
remediations have Vuln ID and category tags. The ASR and server network
protection prerequisites also run when their dependent controls are selected.

## Development workflow

Run from the repository root. The examples use the unclassified configuration
on `pdc`. Repeat with `--limit sdc` for that controller.

```sh
ansible-playbook -i inventory/hosts.yml playbooks/role_stig_winDefenderAntivirus.yml --limit pdc --list-hosts
ansible-playbook -i inventory/hosts.yml roles/stig_winDefenderAntivirus/tests/evaluate.yml --limit pdc -e defender_eval_phase=baseline
ansible-playbook -i inventory/hosts.yml playbooks/role_stig_winDefenderAntivirus.yml --limit pdc -e '{"stig_win_defender_antivirus_unclassified":true}' --check --diff
ansible-playbook -i inventory/hosts.yml playbooks/role_stig_winDefenderAntivirus.yml --limit pdc -e '{"stig_win_defender_antivirus_unclassified":true}'
ansible-playbook -i inventory/hosts.yml roles/stig_winDefenderAntivirus/tests/evaluate.yml --limit pdc -e defender_eval_phase=after
```

Repeat the apply command to check idempotence. The assessment uses the bundled
Evaluate-STIG 1.2610.1 with `-SelectSTIG MSDefender`, fetches the checklist under
`tests/evidence/<phase>/<host>/`, and reports Defender runtime health and
preferences. Set `defender_eval_scan_type=Classified` when assessing a classified
system. Compare baseline and final checklists by Vuln ID and review the runtime
output for active protection, signature age, ASR actions, and network
protection.
