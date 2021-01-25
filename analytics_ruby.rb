
require 'segment/analytics'

Analytics = Segment::Analytics.new({
    write_key: '<write_key>',
    on_error: Proc.new { |status, msg| print msg }
})

Analytics.identify(
    user_id: 'test-user-id-1',
    traits: {
        email: 'bob.dole@mail.com',
        first_name: 'Bob',
        last_name: 'Dole'
    }
)

Analytics.track(
    user_id: 'test-user-id-1',
    event: 'Item Purchased',
    properties: { revenue: 39.95, shipping: '2-day'})

puts 'done'
