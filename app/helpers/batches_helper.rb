module BatchesHelper
  def backend_performance_chart(runs, options)
    data_table = GoogleVisualr::DataTable.new
    data_table.new_column 'string', 'Size'

    # get the backends
    backends = runs.select(:backend).order('backend ASC').uniq.pluck(:backend)
    backends.each do |backend|
      data_table.new_column 'number', backend
    end

    # get number of message sizes
    message_sizes = runs.select(:msg_size).order('msg_size ASC').uniq.pluck(:msg_size)

    # build hash with [msg_size][backend] = seconds
    results = {}
    runs.each do |run|
      results[run.msg_size] ||= {}
      results[run.msg_size][run.backend] = (1_000_000.to_f / run.seconds.to_f).round
    end

    # build data table
    message_sizes.each do |msg_size|
      row = [msg_size.to_s]
      backends.each do |backend|
        row << results[msg_size][backend]
      end
      data_table.add_row row
    end

    GoogleVisualr::Interactive::LineChart.new(data_table, options)
  end

  def backend_concurrency_chart(runs, options)
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
      results[run.msg_size][run.threads] = (1_000_000.to_f / run.seconds.to_f).round
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
    batch.runs.select(:backend).uniq.pluck(:backend).sort
  end

  def batch_attributes(batch)
    methods = [:host, :processor, :cores, :notes]
    attributes = []
    methods.each do |method|
      attributes << "#{method.capitalize}" + ": #{batch.send(method)}" if batch.send(method)
    end
    attributes.compact
  end
end
