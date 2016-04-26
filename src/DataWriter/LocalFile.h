/*
 * LocalFile.h
 *
 *  Created on: Apr 8, 2016
 *      Author: shoops
 */

#ifndef DATAWRITER_LOCALFILE_H_
#define DATAWRITER_LOCALFILE_H_

#include <fstream>
#include <map>

namespace ENISI
{

class LocalFile
{
private:
  static std::map< std::string, LocalFile * > INSTANCES;

public:
  static LocalFile * instance(const std::string & name,
                              const std::string extension = "tsv");

  static std::ofstream & debug();

  static void close();

  LocalFile(const std::string & name,
            const std::string extension = "tsv");

  std::ofstream & stream();

  virtual ~LocalFile();

private:
  std::ofstream mOstream;
};

} /* namespace ENISI */

#endif /* DATAWRITER_LOCALFILE_H_ */
