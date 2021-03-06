#include <boost/preprocessor/stringize.hpp>
#include <string>

std::string libname()
{
  return std::string(BOOST_PP_STRINGIZE(LIBNAME));
}

std::string shared_or_static()
{
  return std::string(BOOST_PP_STRINGIZE(SHARED_OR_STATIC));
}

std::string debug_or_release()
{
  return std::string(BOOST_PP_STRINGIZE(DEBUG_OR_RELEASE));
}

std::string single_or_multi()
{
  return std::string(BOOST_PP_STRINGIZE(SINGLE_OR_MULTI));
}
