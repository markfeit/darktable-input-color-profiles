# Darktable Input Color Profile Manager

**NOTE:** darktable now has [built-in color calibration](https://docs.darktable.org/usermanual/3.8/en/module-reference/processing-modules/color-calibration/#extracting-settings-using-a-color-checker).  Use that instead.

The Makefiles in this directory build ICC color profiles from TIF
images of color calibration cards supported by ArgyllCMS and install
them into your Darktable configuration.


## Installation

Prerequisites:
 * ArgyllCMS
 * EXIFTool
 * GNU Make
 * POSIX shell and utilities


## Preparing a Profile

Shoot an image of your calibration card, prefereably in raw format.

Open the image in darktable.

Remove all history except orientation.

Crop and rotate the image so just the color patches of your
calibration card are visible.

Apply spot white balance from the Neutral 8 area of your calibration
card (on X-Rite cards, this will be row 4, column 2).

Set the `Input Color Profile`:
  * `Profile` to Linear `Rec709 RGB`
  * `Gamut Clipping` to `Off`

Set the `Output Color Profile`:
  * `Output Intent` to `Perceptual`
  * `Output Profile` to `Linear Rec709 RGB`

Set the `Color Picker` (Left Pane):
  * Set pull-downs to `Area, Mean, Lab`
  * Click the eyedropper
  * Read the white square of the calibration card (Lower left on X-Rite)
  * Adjust exposure so L value is about 90; repeat as necessary.
  
Export the file:
  * 16-bit, uncompressed TIF
  * Max dimension 1000 px
  *  Profile: Image Settings

Exit darktable.

Create a subdirectory for the new profile and put the

Clone the `Makefile` from the `sample` directory into the new profile
directory and adjust the contents as necessary.

Run `make install` in the subdirectory.  There are also `uninstall`
and `clean` targets; these are also available in the top-level
`Makefile` to operate on all profiles.

Start darktable.  The new profile will be available for use.
