/*
 * Properties.h
 *
 *  Created on: Mar 23, 2016
 *      Author: shoops
 */

#ifndef ENISI_Properties
#define ENISI_Properties

#include "repast_hpc/Properties.h"

namespace ENISI
{

class Properties: public repast::Properties
{
private:
  static repast::Properties * pInstance;

  Properties();

public:
  Properties(const std::string& file, int argc, char** argv, boost::mpi::communicator* comm = 0, int maxPropFileSize = MAX_PROP_FILE_SIZE);

  virtual ~Properties();

  static const repast::Properties * instance();

  static std::string getValue(const std::string & name);

  template < class CType >
  static bool getValue(const std::string & name, CType & value)
  {
    value = std::numeric_limits<CType>::quiet_NaN();

    if (pInstance == NULL) return false;

    std::istringstream in;

    in.imbue(std::locale::classic());
    in.str(pInstance->getProperty(name));

    in >> value;

    return !isnan(value);
  }

  template <class CType>
  static CType toEnum(const std::string & value,
                      const char ** enumNames,
                      const CType & enumDefault)
  {
    if (value.empty()) return enumDefault;

    for (int i = 0; *enumNames; i++, enumNames++)
      if (value == *enumNames) return static_cast< CType >(i);

    return enumDefault;
  }

};

} // namespace ENISI

#endif // ENISI_Properties
