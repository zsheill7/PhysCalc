//
//  PagingMenuControllerOptions.swift
//  PagingMenuControllerDemo
//
//  Created by Yusuke Kita on 6/9/16.
//  Copyright © 2016 kitasuke. All rights reserved.
//

import Foundation
import PagingMenuController

struct MenuItemUsers: MenuItemViewCustomizable {}
struct MenuItemRepository: MenuItemViewCustomizable {}
struct MenuItemGists: MenuItemViewCustomizable {}
struct MenuItemOrganization: MenuItemViewCustomizable {}

struct PagingMenuOptions1: PagingMenuControllerCustomizable {
    let kinematicsViewController = KinematicsViewController.instantiateFromStoryboard()
    let energyViewController = EnergyViewController.instantiateFromStoryboard()
    let momentumViewController = MomentumViewController.instantiateFromStoryboard()
    let rotationViewController = RotationViewController.instantiateFromStoryboard()
    let gravitationViewController = GravitationViewController.instantiateFromStoryboard()
    
    var componentType: ComponentType {
        return .all(menuOptions: MenuOptions(), pagingControllers: [kinematicsViewController, energyViewController, momentumViewController, rotationViewController, gravitationViewController])
    }
    var lazyLoadingPage: LazyLoadingPage {
        return .all
    }
    
    struct MenuOptions: MenuViewCustomizable {
        var displayMode: MenuDisplayMode {
            return .standard(widthMode: .flexible, centerItem: false, scrollingMode: .pagingEnabled)
        }
     
        
        var focusMode: MenuFocusMode {
            return .underline(height: 3, color: UIColor.blue, horizontalPadding: 10, verticalPadding: 0)
        }
        
        
        var height: CGFloat {
            return 60
        }
        var itemsOptions: [MenuItemViewCustomizable] {
            return [MenuItemKinematics(), MenuItemEnergy(), MenuItemMomentum(), MenuItemRotation(), MenuItemGravitation()]
        }
        
        var backgroundColor: UIColor {
            return UIColor(white: 1, alpha: 0.5)
        }
    }
    
    struct MenuItemKinematics: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: "Kinematics")
            /*let description = MenuItemText(text: String(describing: self))
            return .multilineText(title: title, description: description)*/
            return .text(title: title)
        }
    }
    struct MenuItemEnergy: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: "Energy")
            /*let description = MenuItemText(text: String(describing: self))
            return .multilineText(title: title, description: description)*/
            return .text(title: title)
        }
    }
    struct MenuItemMomentum: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: "Momentum")
            return .text(title: title)
            /*let description = MenuItemText(text: String(describing: self))
            return .multilineText(title: title, description: description)*/
        }
    }
    struct MenuItemRotation: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: "Rotation")
            return .text(title: title)
           /* let description = MenuItemText(text: String(describing: self))
            return .multilineText(title: title, description: description)*/
        }
    }
    struct MenuItemGravitation: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: "Gravitation")
            return .text(title: title)
            /*let description = MenuItemText(text: String(describing: self))
            return .multilineText(title: title, description: description)*/
        }
    }
}
/*
struct PagingMenuOptions2: PagingMenuControllerCustomizable {
    let KinematicsViewController = KinematicsViewController.instantiateFromStoryboard()
    let EnergyViewController = EnergyViewController.instantiateFromStoryboard()
    let MomentumViewController = MomentumViewController.instantiateFromStoryboard()
    let RotationViewController = RotationViewController.instantiateFromStoryboard()
    
    var componentType: ComponentType {
        return .all(menuOptions: MenuOptions(), pagingControllers: [KinematicsViewController, EnergyViewController, MomentumViewController, RotationViewController])
    }
    var menuControllerSet: MenuControllerSet {
        return .single
    }
    
    struct MenuOptions: MenuViewCustomizable {
        var displayMode: MenuDisplayMode {
            return .segmentedControl
        }
        var itemsOptions: [MenuItemViewCustomizable] {
            return [MenuItemUsers(), MenuItemRepository(), MenuItemGists(), MenuItemOrganization()]
        }
    }
}

struct PagingMenuOptions3: PagingMenuControllerCustomizable {
    let KinematicsViewController = KinematicsViewController.instantiateFromStoryboard()
    let EnergyViewController = EnergyViewController.instantiateFromStoryboard()
    let MomentumViewController = MomentumViewController.instantiateFromStoryboard()
    let RotationViewController = RotationViewController.instantiateFromStoryboard()
    
    var componentType: ComponentType {
        return .all(menuOptions: MenuOptions(), pagingControllers: [KinematicsViewController, EnergyViewController, MomentumViewController, RotationViewController])
    }
    var lazyLoadingPage: LazyLoadingPage {
        return .three
    }
    
    struct MenuOptions: MenuViewCustomizable {
        var displayMode: MenuDisplayMode {
            return .infinite(widthMode: .fixed(width: 80), scrollingMode: .scrollEnabled)
        }
        var itemsOptions: [MenuItemViewCustomizable] {
            return [MenuItemUsers(), MenuItemRepository(), MenuItemGists(), MenuItemOrganization()]
        }
    }
}

struct PagingMenuOptions4: PagingMenuControllerCustomizable {
    var componentType: ComponentType {
        return .menuView(menuOptions: MenuOptions())
    }
    
    struct MenuOptions: MenuViewCustomizable {
        var displayMode: MenuDisplayMode {
            return .segmentedControl
        }
        var focusMode: MenuFocusMode {
            return .underline(height: 3, color: UIColor.blue, horizontalPadding: 10, verticalPadding: 0)
        }
        var itemsOptions: [MenuItemViewCustomizable] {
            return [MenuItemUsers(), MenuItemRepository(), MenuItemGists(), MenuItemOrganization()]
        }
    }
}

struct PagingMenuOptions5: PagingMenuControllerCustomizable {
    var componentType: ComponentType {
        return .menuView(menuOptions: MenuOptions())
    }
    
    struct MenuOptions: MenuViewCustomizable {
        var displayMode: MenuDisplayMode {
            return .infinite(widthMode: .flexible, scrollingMode: .pagingEnabled)
        }
        var focusMode: MenuFocusMode {
            return .roundRect(radius: 12, horizontalPadding: 8, verticalPadding: 8, selectedColor: UIColor.lightGray)
        }
        var itemsOptions: [MenuItemViewCustomizable] {
            return [MenuItemUsers(), MenuItemRepository(), MenuItemGists(), MenuItemOrganization()]
        }
    }
}

struct PagingMenuOptions6: PagingMenuControllerCustomizable {
    let KinematicsViewController = KinematicsViewController.instantiateFromStoryboard()
    let EnergyViewController = EnergyViewController.instantiateFromStoryboard()
    let MomentumViewController = MomentumViewController.instantiateFromStoryboard()
    let RotationViewController = RotationViewController.instantiateFromStoryboard()
    
    var componentType: ComponentType {
        return .pagingController(pagingControllers: [KinematicsViewController, EnergyViewController, MomentumViewController, RotationViewController])
    }
    var defaultPage: Int {
        return 1
    }
}*/
