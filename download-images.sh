#!/bin/bash
#
# Download acoustic guitar images from manufacturer websites.
#
# INSTRUCTIONS:
#   1. Run this script from the repo root:  bash download-images.sh
#   2. Each image will be saved to images/ as a .jpg file.
#   3. The SVG placeholders will be replaced automatically.
#   4. If a download fails, open the SOURCE URL in your browser,
#      right-click the guitar photo, "Save image as..." into images/
#      using the FILENAME shown below.
#
# All images are beautiful wood acoustic guitars (no electrics).
# Sources: Fender, Yamaha, Ibanez, Gretsch official product pages.
#

set -euo pipefail
cd "$(dirname "$0")"
mkdir -p images

echo "=== Acoustic Guitar Image Downloader ==="
echo ""
echo "This script provides the URLs you need. Due to manufacturer"
echo "website protections, you may need to download some manually."
echo ""

# --------------------------------------------------------------------------
# IMAGE MAP - each entry: local filename, source page, description
# --------------------------------------------------------------------------
# Visit the SOURCE PAGE in your browser, right-click the main product
# image, and save it to the images/ directory with the given filename.
# Then convert or rename it to .jpg.
# --------------------------------------------------------------------------

cat << 'INFO'
======================================================================
 IMAGE DOWNLOAD GUIDE
======================================================================

1. HERO BACKGROUND (images/hero.jpg) - 1920x1080 or larger
   Source: Yamaha FG9 series (flagship handcrafted acoustic)
   URL:    https://usa.yamaha.com/products/musical_instruments/guitars_basses/ac_guitars/fg_series/fg_9/index.html
   Alt:    https://usa.yamaha.com/products/musical_instruments/guitars_basses/ac_guitars/l_series/ll_series.html
   Look for: A wide, atmospheric shot of a beautiful wood acoustic guitar

2. CLASSICAL (images/classical.jpg) - 600x400 minimum
   Source: Yamaha CG series (nylon string classical)
   URL:    https://usa.yamaha.com/products/musical_instruments/guitars_basses/ac_guitars/cg_series/index.html
   Alt:    https://www.ibanez.com/usa/products/model/ga/ (Ibanez GA classical)
   Look for: Warm wood body, wide neck, nylon strings visible

3. STEEL STRING (images/steel-string.jpg) - 600x400 minimum
   Source: Fender CD-60S Dreadnought (natural wood finish)
   URL:    https://www.fender.com/en-US/acoustic-guitars/dreadnought/cd-60s-dreadnought/0970110021.html
   Alt:    https://www.fender.com/collections/acoustic-guitars
   Look for: Classic dreadnought shape, natural spruce top

4. 12-STRING (images/12-string.jpg) - 600x400 minimum
   Source: Gretsch Rancher 12-string or Ibanez PF1512
   URL:    https://www.ibanez.com/usa/products/model/pf/ (look for 12-string models)
   Alt:    https://www.gretschguitars.com/gear/build/acoustic (12-string Rancher)
   Look for: Double-course strings clearly visible, wood body

5. BARITONE (images/baritone.jpg) - 600x400 minimum
   Source: Ibanez AVD10 BVS or Fender baritone acoustic
   URL:    https://www.ibanez.com/usa/products/model/artwood/
   Alt:    https://www.fender.com/collections/acoustic-guitars (filter baritone)
   Look for: Longer body/scale, deep wood tones

6. PORTUGUESE (images/portuguese.jpg) - 600x400 minimum
   Source: (Not made by these brands - use a search image)
   Suggestion: Search "guitarra portuguesa" on an image site
   Look for: Pear-shaped body, fan headstock, ornate decoration

7. RESONATOR (images/resonator.jpg) - 600x400 minimum
   Source: Gretsch G9221 Bobtail or similar
   URL:    https://www.gretschguitars.com/gear/build/acoustic (resonator models)
   Alt:    Search for Gretsch Bobtail resonator guitar image
   Look for: Metal cone/coverplate, wood body, distinctive resonator design

8. TRAVEL (images/travel.jpg) - 600x400 minimum
   Source: Ibanez EWP or Fender travel acoustic
   URL:    https://www.ibanez.com/usa/products/model/ewp/
   Alt:    https://www.fender.com/collections/beginner-acoustic-guitars
   Look for: Compact body, natural wood, small size

9. ARCHTOP (images/archtop.jpg) - 600x400 minimum
   Source: Ibanez Artcore or Gretsch archtop
   URL:    https://www.ibanez.com/usa/products/model/artstar/
   Alt:    https://www.gretschguitars.com/gear/build/hollow-body
   Look for: Carved arched top, f-holes, warm wood finish

======================================================================
 AFTER DOWNLOADING
======================================================================

Once you've saved the images as .jpg files in the images/ directory,
update the file references:

  - In css/styles.css: change 'hero.svg' to 'hero.jpg'
  - In _includes/types.html: change each '.svg' to '.jpg'

Or run this one-liner to do it automatically:

  sed -i 's/\.svg"/.jpg"/g' _includes/types.html
  sed -i "s/hero\.svg/hero.jpg/g" css/styles.css

Then delete the .svg placeholders:

  rm images/*.svg

======================================================================
INFO

echo "Done! Open the URLs above in your browser to download the images."
