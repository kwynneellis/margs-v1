// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "controllers"
import "bootstrap"
import "@hotwired/turbo-rails"

import CalculateBookingController from "./controllers/calculate_booking_controller.js"
Stimulus.register("calculate-booking", CalculateBookingController)
