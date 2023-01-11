$Theme = @{
    light = @{
        palette = @{
            primary = @{
                main = '#3b3b3b'
            }
            background = @{
                default = '#ffffff'
            }
        }
        typography = @{
            h5 = @{
                fontWeight    = 500
                fontSize      = 26
                letterSpacing = 0.5
            }
        }
        shape      = @{
            borderRadius = 0
        }
        mixins     = @{
            toolbar = @{
                minHeight = 48
            }
        }
        overrides  = @{
            MuiDrawer         = @{
                paper = @{
                    backgroundColor = '#3b3b3b'
                }
            }
            MuiButton         = @{
                label     = @{
                    textTransform = 'none'
                }
                contained = @{
                    
                    boxShadow  = 'none'
                    '&:active' = @{
                    boxShadow = 'none'
                    }
                }
            }
            MuiTabs           = @{
                root      = @{
                    marginLeft = 1
                }
                indicator = @{
                    height               = 3
                    borderTopLeftRadius  = 3
                    borderTopRightRadius = 3
                    backgroundColor      = '#000'
                }
            }
            MuiTab            = @{
                root = @{
                    textTransform = 'none'
                    margin        = '0 16px'
                    minWidth      = 0
                    padding       = 0
                }
            }
            MuiIconButton     = @{
                root = @{
                    padding = 1
                }
            }
            MuiTooltip        = @{
                tooltip = @{
                    borderRadius = 4
                }
            }
            MuiDivider        = @{
                root = @{
                    backgroundColor = 'rgb(255,255,255,0.15)'
                }
            }
            MuiListItemButton = @{
                root = @{
                    '&.Mui-selected' = @{
                        color = '#4fc3f7'
                    }
                }
            }
            MuiListItemText   = @{
                primary = @{
                    color      = 'rgba(255, 255, 255, 0.7) '
                    fontSize   = 14
                    fontWeight = 500
                }
            }
            MuiListItemIcon   = @{
                root = @{
                    color       = 'white'
                    minWidth    = 'auto'
                    marginRight = 2
                    '& svg'     = @{
                        fontSize = 20
                    }
                }
            }
            MuiAvatar         = @{
                root = @{
                    width  = 32
                    height = 32
                }
            }
        }        
    }
    dark = @{
        palette = @{
            primary = @{
                main = '#3b3b3b'
            }
            background = @{
                default = '#575757'
            }
        }
    }    
}