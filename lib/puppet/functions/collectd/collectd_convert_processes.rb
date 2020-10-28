# This is an autogenerated function, ported from the original legacy version.
# It /should work/ as is, but will not have all the benefits of the modern
# function API. You should see the function docs to learn how to add function
# signatures for type safety and to document this function using puppet-strings.
#
# https://puppet.com/docs/puppet/latest/custom_functions_ruby.html
#
# ---- original file header ----

# ---- original file header ----
#
# @summary
#       Converts the array from the old style to define process or processmatch in the
#    processes plugin into a create_resources compatible hash which
#    can be used with the new style define.
#
#    Example:
#      [ { 'name' => 'foo', 'regex' => '.*' } , { 'name' => 'bar', 'regex' => '[0-9]+' },  "alone" ]
#    will be converted to
#      { 'foo' => { 'regex' => '.*' } , 'bar' => { 'regex' => '[0-9]+' }, 'alone' => {} }
#
#
Puppet::Functions.create_function(:'collectd::collectd_convert_processes') do
  # @param args
  #   The original array of arguments. Port this to individually managed params
  #   to get the full benefit of the modern function API.
  #
  # @return [Data type]
  #   Describe what the function returns here
  #
  dispatch :default_impl do
    # Call the method named 'default_impl' when this is matched
    # Port this to match individual params for better type safety
    repeated_param 'Any', :args
  end


  def default_impl(*args)
    
  if args.size != 1
    raise(Puppet::ParseError, 'convert_process_array(): Needs exactly one argument')
  end

  if args[0].is_a?(Hash)
    return args[0] # Keep normal hiera hash as-is
  end

  parray = args[0]
  unless parray.is_a?(Array)
    raise(Puppet::ParseError, 'convert_process_array(): Needs an array as argument')
  end

  phash = {}

  parray.each do |p|
    if p.is_a?(String)
      phash[p] = {}
    elsif p.is_a?(Hash)
      name = p.delete('name')
      phash[name] = p
    else
      raise(Puppet::ParseError, 'convert_process_array(): array element must be string or hash')
    end
  end
  return phash

  end
end