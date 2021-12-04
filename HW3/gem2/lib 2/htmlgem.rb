
  def writen_file
    File.write('foo.txt', 'bar')
  end
  puts writen_file