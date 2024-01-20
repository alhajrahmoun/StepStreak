// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import Bridge__NavigationController from "./bridge/navigation_controller"
application.register("bridge--navigation", Bridge__NavigationController)

import Bridge__SyncController from "./bridge/sync_controller"
application.register("bridge--sync", Bridge__SyncController)

import Bridge__TokenController from "./bridge/token_controller"
application.register("bridge--token", Bridge__TokenController)

import NavigationController from "./navigation_controller"
application.register("navigation", NavigationController)

import ReloadController from "./reload_controller"
application.register("reload", ReloadController)

import TimeZoneController from "./time_zone_controller"
application.register("time-zone", TimeZoneController)