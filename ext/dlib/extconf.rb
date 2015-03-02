require 'fileutils'
require 'mkmf'

DLIB_VERSION = '18.13'
DLIB_SRCDIR = File.expand_path("../../dlib-#{DLIB_VERSION}", __FILE__)

dir_config('libjpeg')
dir_config('libpng')

have_header('jpeglib.h') or abort
have_library('jpeg', 'jpeg_std_error') or abort

have_header('png.h') or abort
have_library('png', 'png_sig_cmp') or abort

$defs << '-DDLIB_JPEG_SUPPORT'
$defs << '-DDLIB_PNG_SUPPORT'
$defs << '-DDLIB_NO_GUI_SUPPORT'
$CPPFLAGS << " -I#{DLIB_SRCDIR}"

have_func('rb_get_kwargs')

create_makefile('dlib')
