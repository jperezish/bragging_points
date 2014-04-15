def pool_attributes(overrides={})
  {
    name: "Pool of Death!",
    status: "not started",
    bragging_points: "25"
  }.merge(overrides)
end