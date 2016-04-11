/*
 * Properties.h
 *
 *  Created on: Mar 23, 2016
 *      Author: shoops
 */

#ifndef ENISI_Properties
#define ENISI_Properties

#include <sstream>

#include "repast_hpc/Properties.h"

namespace ENISI
{

class Properties: public repast::Properties
{
public:
  enum Type {
    config,
    run,
    model
  };

private:
  static std::map< Type, Properties * > INSTANCES;


  Properties();

public:
  Properties(const Type & type,
             const std::string& file,
             int argc, char** argv,
             boost::mpi::communicator* comm = 0,
             int maxPropFileSize = MAX_PROP_FILE_SIZE);

  virtual ~Properties();

  static const Properties * instance(const Type & type);

  std::string getValue(const std::string & name) const;

  template < class CType >
  bool getValue(const std::string & key, CType & value) const
  {
    value = CType();
    std::string Key = key;

    bool found = false;

    while (true)
      {
        std::string Value = getProperty(Key);

        if (Value.empty() || Value == Key)
          {
            break;
          }

        found = true;

        std::istringstream in;
        in.imbue(std::locale::classic());
        in.str(Value);
        in >> value;

        // Check if the Value is the key of another property.
        Key = Value;
      }

    return found;
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
