require 'ostruct'
require 'RMagick'
require 'active_record'

require_relative 'airpic/entities/card.rb'
require_relative 'airpic/entities/order.rb'
require_relative 'airpic/entities/stamp.rb'
require_relative 'airpic/entities/user.rb'
require_relative 'airpic/entities/recipient.rb'

require_relative 'airpic/repositories/repositories.rb'
require_relative 'airpic/repositories/cards.rb'
require_relative 'airpic/repositories/orders.rb'
require_relative 'airpic/repositories/recipients.rb'
require_relative 'airpic/repositories/stamps.rb'
require_relative 'airpic/repositories/users.rb'

require_relative 'airpic/use_cases/use_case.rb'
require_relative 'airpic/use_cases/sign_in.rb'
require_relative 'airpic/use_cases/sign_out.rb'
require_relative 'airpic/use_cases/store_photo.rb'
require_relative 'airpic/use_cases/verify_mms_sender.rb'
require_relative 'airpic/use_cases/verify_recipient.rb'
require_relative 'airpic/use_cases/print_stamp.rb'
require_relative 'airpic/use_cases/process_photo.rb'
