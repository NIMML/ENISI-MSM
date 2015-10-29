#ifndef ENISI_MSM_SILOWRITER_H
#define ENISI_MSM_SILOWRITER_H

#include <stdexcept>
#include <iostream>
#include <silo.h>
#include <math.h>
#include <vector>

class SiloWriter
{
public:
  SiloWriter() : currentCycle(0) { }
  ~SiloWriter() { write(); }

  static SiloWriter& writer() {
    static SiloWriter *writer = new SiloWriter();
    return *writer;
  }

  void writeCycleCoordinates(const int &cycle, 
      const std::vector<float> &xCoord, 
      const std::vector<float> &yCoord) 

  {
    x = xCoord;
    y = yCoord;
    write();
    currentCycle = cycle;
  }

  void addCycleCoordinates(const int &cycle, 
      const float &xCoord, const float &yCoord, const float &color = 0)
  {
    if (cycle == currentCycle)
    {
      x.push_back(xCoord);
      y.push_back(yCoord);
      colors.push_back(color);
    }
    else 
    {
      writeCycleCoordinates(cycle, x, y);
    }
  }

  void write() 
  {
    if ( !x.size() || !y.size() )
      return;

    if (x.size() != y.size()) 
    { 
      throw std::invalid_argument("Number of X and Y coordinates don't match");
    }

    /* Create a unique filename for the new Silo file*/
    char filename[100];
    sprintf(filename, "./output/silo/enisi_msm_%04d.silo", currentCycle);

    /* Open the Silo file */
    dbfile = DBCreate(filename, DB_CLOBBER, DB_LOCAL, 
	"ENISI MSM simulation time step", DB_HDF5);

    float *coords[] = {&x[0], &y[0]};

    if (x.size() != y.size()) 
    { 
      throw std::invalid_argument("Number of X and Y coordinates don't match");
    }

    int npts = x.size();
    int ndims = 2;

    const char *meshName = "enisipointmesh";
    /* Write a point mesh. */
    DBPutPointmesh(dbfile, meshName, ndims, coords, npts,
	DB_FLOAT, NULL);

    /* Write color values. */
    if ( colors.size() ) 
    {
      float *var = &colors[0];
      DBPutPointvar1(dbfile, "enisipointvar", meshName, var, npts,
	  DB_FLOAT, NULL);
    }

    /* Close the Silo file */
    DBClose(dbfile);

    /* Empty for next collection */
    x.clear();
    y.clear();
    colors.clear();
  }

private:
  int currentCycle;
  std::vector<float> colors; 
  std::vector<float> x; 
  std::vector<float> y;
  DBfile *dbfile;
};

#endif
