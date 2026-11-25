# Public publication preparation

Use the prepared `.release/stig_win_defender_antivirus-public.tar.gz` from
the workspace root to initialize a fresh public repository. The archive
contains a standalone role, sanitized examples, the control map, MIT-0
license, and third-party notices. The workspace copy retains the development
inventory dependencies and private validation evidence.

Review `PUBLICATION_MANIFEST.json` in the archive for included-file hashes
and excluded material. Create the public repository from the extracted
snapshot with a fresh Git history.

```sh
tar -xzf .release/stig_win_defender_antivirus-public.tar.gz
cd stig_win_defender_antivirus
git init -b main
git add .
git commit -m "Initial public release"
```
