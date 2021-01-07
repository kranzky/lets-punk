# frozen_string_literal: true

# route: GET /status
PUNK.route('status') { perform GetStatus, args }
