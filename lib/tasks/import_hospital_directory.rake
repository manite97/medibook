namespace :import do
  desc "Import hospital_directory.csv into hospital_directories table"
  task hospital_directory: :environment do
    require 'csv'

    csv_path = Rails.root.join('hospital_directory.csv')
    unless File.exist?(csv_path)
      puts "CSV file not found: #{csv_path}"
      exit 1
    end

    puts "Starting import from #{csv_path}"

    # Read headers once to build normalized header -> column mapping
    csv = CSV.read(csv_path, headers: true, encoding: 'bom|utf-8')
    headers = csv.headers
    if headers.nil?
      puts "No headers found in CSV"
      exit 1
    end

    # Normalize headers: make downcase, replace non-alnum with underscore
    header_to_col = {}
    headers.each do |h|
      next if h.nil?
      col = h.to_s.downcase.strip.gsub(/[^0-9a-z]+/i, '_').gsub(/__+/, '_').gsub(/^_|_$/, '')
      header_to_col[h] = col
    end

    total = csv.size
    puts "Found #{total} rows. Beginning import..."

    processed = 0
    ActiveRecord::Base.transaction do
      csv.each_with_index do |row, idx|
        # Build attrs for model
        attrs = {}
        header_to_col.each do |orig, col|
          attrs[col] = row[orig]
        end

        # Convert known integer-ish columns
        %w[sr_no number_doctor num_mediconsultant_or_expert total_num_beds number_private_wards num_bed_for_eco_weaker_sec state_id district_id].each do |k|
          if attrs.key?(k)
            raw = attrs[k].to_s.strip
            attrs[k] = raw == '' ? nil : raw.gsub(/[\s,]/, '').to_i
          end
        end

        # Find by sr_no if present else by hospital_name+address (best-effort)
        record = nil
        if attrs['sr_no'].present?
          record = HospitalDirectory.find_or_initialize_by(sr_no: attrs['sr_no'])
        else
          record = HospitalDirectory.find_or_initialize_by(
            hospital_name: attrs['hospital_name'],
            address_original_first_line: attrs['address_original_first_line']
          )
        end

        # Only assign attributes that exist as columns (protect from extra headers)
        permitted = attrs.slice(*HospitalDirectory.column_names)
        record.assign_attributes(permitted)
        record.save!(validate: false)

        processed += 1
        if (idx + 1) % 1000 == 0
          puts "Imported #{idx + 1}/#{total} rows..."
        end
      end
    end

    puts "Import completed. #{processed} records processed."
  end
end
