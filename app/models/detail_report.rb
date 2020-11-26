class DetailReport < ApplicationRecord
  belongs_to :support_program
  validates :ordered_date, presence: true
  validates :ordered_price, presence: true,
                              length: { maximum: 16 }
  validates :actual_kickoff_date, presence: true
  validates :actual_complete_date, presence: true
  validates :service_detail, presence: true,
                               length: { maximum: 6400 }
  validates :results, presence: true,
                        length: { maximum: 6400 }
  validates :evaluation, presence:true,
                           length: { maximum: 16 }
  validates :evaluation_details, presence:true,
                                   length: { maximum: 6400 }
  # enum planed_or_argent: {planed:0 , argent:1}
end
