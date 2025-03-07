c.tabs.show = "never"

c.auto_save.session = True

c.colors.webpage.preferred_color_scheme = 'dark'
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.algorithm = 'lightness-hsl'
c.colors.webpage.darkmode.contrast = -.022
c.colors.webpage.darkmode.threshold.text = 150
c.colors.webpage.darkmode.threshold.background = 100
c.colors.webpage.darkmode.policy.images = 'always'
c.colors.webpage.darkmode.grayscale.images = 0.35

config.load_autoconfig(False)

config.source('./themes/onedark.py')
