require 'mkmf'

unless system('yaz-config')
  raise 'yaz does not appear to be installed'
end

unless have_header('yaz/zoom.h')
  raise 'yaz zoom header not available'
end

$CFLAGS << " #{`yaz-config --cflags`} "
$LDFLAGS << " #{`yaz-config --libs`} "

create_makefile("zoom")

