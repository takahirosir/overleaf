#!/bin/bash

# Define the collections/bundles that contain the required packages
collections=(
  collection-langchinese # Contains ctex and gbt7714 bundles/packages
  collection-basic       # Contains fontenc, keyval, graphicx, longtable, url, hyperref, geometry, fancyhdr
  collection-latexextra  # Contains subfig, makecell, multirow, acronym, siunitx, caption, bicaption, tocbibind, titletoc, listings
  collection-fontsextra  # Contains newtxmath
  graphics               # Specific bundle name for graphicx
  algorithms             # Contains algorithmic and algorithm
  unicode-math           # Contains unicode-math, lm-math
  mathtools              # Contains mathtools, mdwmath, eucal
  xcolor                 # Specific bundle name for xcolor
  xfrac                  # Specific bundle name for xfrac
  enumitem               # Specific bundle name for enumitem
  ieeetran          # Specific bundle name for IEEEtrantools
)

# Path to the tlmgr executable (adjust for your specific installation if needed)
TLMGR_PATH="/usr/local/texlive/2025/bin/x86_64-linux/tlmgr"

# Update tlmgr itself
echo "Updating tlmgr self..."
"$TLMGR_PATH" update --self || { echo "tlmgr self update failed. Exiting."; exit 1; }

# Install the collections
for col in "${collections[@]}"; do
  echo "Attempting to install collection/bundle: $col"
  "$TLMGR_PATH" install "$col"
  if [ $? -ne 0 ]; then
    echo "Warning: Installation of $col failed. Continuing with other collections."
    # Optional: Add specific error handling or logging here
  fi
done

echo "Installation script finished. Not all warnings are necessarily errors if subsequent installations pick up missing dependencies."
