# gpm
a *general purpose minifier*

Minification of hypertext mostly serves bandwidth saving purposes. This "gpm" tries to combine several webpage parts like .CSS, .JS and .html into 1 resulting https access on webserver's side.


Saving bandwidth includes filtering unnecessary parts of the source file, which in my case mostly means comments or commented out components not necessary on production use.


## The PowerShell Script part

*gpm/ps1/compress-toClipboard.ps1*

Only tested on a Windows desktop. Filters out comments, placing results into the clipboard for pasting elsewhere. Not a necessary part of *gpm*, but included into this repository.
