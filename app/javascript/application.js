// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "bootstrap"
import "controllers"

import { Application } from "@hotwired/stimulus"
window.Stimulus = Application.start()

import CalculateBookingController from "./controllers/calculate_booking_controller.js"
Stimulus.register("calculate-booking", CalculateBookingController)
