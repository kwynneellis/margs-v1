# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this app is

A holiday rental property website ("Marg's") built with Rails 7. It's a single-property site — the root route hardcodes `properties#show, id: 1`. Guests submit enquiries; the owner manages bookings, recommendations, and property details via an admin-only UI.

## Stack

- Ruby 3.2.2, Rails 7.0.1, PostgreSQL
- Bootstrap 5.2 + SCSS (via `sassc-rails`)
- Stimulus (Hotwire) for JS — controllers live in `app/javascript/controllers/`
- Devise for authentication — all routes are authenticated by default; public exceptions are explicitly `skip_before_action :authenticate_user!`
- `simple_form` for forms, `font-awesome-sass` for icons
- `letter_opener` intercepts emails in development (no real delivery)
- `simple_calendar` gem included but currently not rendered

## Commands

```bash
# Start the app (Rails server only — no JS build step needed for dev)
bin/rails server

# Or with JS watch mode
foreman start -f Procfile.dev

# Database
bin/rails db:create db:migrate db:seed

# Run all tests
bin/rails test

# Run a single test file
bin/rails test test/models/enquiry_test.rb

# Run a single test by line number
bin/rails test test/models/enquiry_test.rb:10
```

## Architecture

### Authentication & authorization

`ApplicationController` requires authentication for everything. Controllers grant public access per-action with `skip_before_action :authenticate_user!`. The `User` model has an `admin` boolean — check this to gate admin-only actions (currently done informally, not via a formal policy layer).

### Enquiry flow

The enquiry form URL is deliberately obscure: `/properties/:property_id/get-in-touch-2317` (routes to `enquiries#new`). On successful save, `Enquiry` fires two emails via `EnquiryMailer`: a thank-you to the guest and a notification to the property owner (`margatekipndip@gmail.com`). Validation lives in the model, including a `nights_of_stay` virtual attribute that derives nights from check-in/check-out dates.

### Recommendations

Local area recommendations with a category, embedded map URL, title/subtitle/description. Nested under properties. Public index, authenticated create/edit/destroy.

### Bookings

Admin-managed date-based blocks (name, start_time, end_time). Used to show availability. Nested under properties.

### JS

The main Stimulus controller is `calculate_booking_controller.js` — it calculates price totals live from date inputs using `priceValue` and `cleaningFeeValue` data attributes passed from the view.

### Emails

`EnquiryMailer` has both HTML and text templates in `app/views/enquiry_mailer/`. BCC to `k.wynneellis@gmail.com` on all mail. In development, `letter_opener` opens emails in the browser instead of sending.
