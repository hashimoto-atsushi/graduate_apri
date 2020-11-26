json.extract! detail_report, :id, :support_program_id, :ordered_date, :ordered_price, :actual_kickoff_date, :actual_complete_date, :service_detail, :photo, :results, :evaluation, :evaluation_details, :created_at, :updated_at
json.url detail_report_url(detail_report, format: :json)
