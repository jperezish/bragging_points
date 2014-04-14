module PoolsHelper
  def format_bragging_points(pool)
    if pool.bragging_points == 0
      "No"
    else
      number_with_precision(pool.bragging_points, precision: 0, delimiter: ",")
    end
  end
end


