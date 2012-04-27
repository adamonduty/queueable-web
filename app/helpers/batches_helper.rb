module BatchesHelper
  def backend_line_chart(runs, options)
    data_table = GoogleVisualr::DataTable.new
    data_table.new_column 'string', 'Size'

    # get number of threads
    threads = runs.select(:threads).order('threads ASC').uniq.pluck(:threads)
    threads.each do |thread|
      data_table.new_column 'number', "#{thread}-thread"
    end

    # get number of message sizes
    message_sizes = runs.select(:msg_size).order('msg_size ASC').uniq.pluck(:msg_size)

    # build hash with [msg_size][thread] = seconds
    results = {}
    runs.each do |run|
      results[run.msg_size] ||= {}
      results[run.msg_size][run.threads] = run.seconds.to_f
    end

    # build data table
    message_sizes.each do |msg_size|
      row = [msg_size.to_s]
      threads.each do |thread|
        row << results[msg_size][thread]
      end
      data_table.add_row row
    end

    GoogleVisualr::Interactive::LineChart.new(data_table, options)
  end

  def list_backends(batch)
    batch.runs.select(:backend).uniq.pluck(:backend)
  end
end
