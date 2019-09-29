export module testmodule;

import std;

export int
foo()
{
  std::cout << "Got here!" << std::endl;
  return 4;
}
