#!/usr/bin/env bash
rm -f items.txt
rm -f {3zb2,baseq2,jump,openffa,opentdm,tdm}/{config.cfg,.conhistory,.syshistory,q2config.cfg,debug.log}
rm -rf {3zb2,baseq2,jump,openffa,opentdm,tdm}/demos
rm -rf {3zb2,baseq2,jump,openffa,opentdm,tdm}/logs
rm -rf jump/{27910,ent,global,jumpdemo,mapsent,p}

# Remove all symlinks
find . -type l -delete

# Remove executable permissions from all files recursively
find . -type f -exec chmod -x {} +

# Add executable permissions to specific files
find . -type f \( -name "gamex86_64.so" -o -name "*.exe" -o -name "*.sh" -o -name "*.bat" \) -exec chmod +x {} +

# Add executable permissions to specific paths (non-recursive)
[ -f "./clean.sh" ] && chmod +x "./clean.sh"
[ -f "./q2pro" ] && chmod +x "./q2pro"
[ -f "./q2pro.sh" ] && chmod +x "./q2pro.sh"
[ -f "./q2proded" ] && chmod +x "./q2proded"

echo "[*] Done."

