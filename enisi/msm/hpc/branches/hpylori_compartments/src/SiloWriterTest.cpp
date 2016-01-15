#include "gmock/gmock.h"
#include "SiloWriter.h"

#define NPTS 100

using namespace testing;

TEST(ASiloWriter, DISABLED_Generates2DPointMeshWithColors)
{
  SiloWriter writer;
  for (int cycle = 0; cycle <= 100; cycle++) 
  {
    std::vector<float> x(NPTS);
    std::vector<float> y(NPTS);
    /* Create some points to save. */
    for (int i = 0; i < NPTS; i++)
    {
      float t = ((float)i) / ((float)(NPTS-1));
      float angle = 3.14159 * (10.+ ((float)cycle/10.)) * t;
      float xCoord = t * cos(angle);
      float yCoord = t * sin(angle);
      x[i] = xCoord;
      y[i] = yCoord;

      float color = (float) i;
      writer.addCycleCoordinates(cycle, xCoord, yCoord, color);
    }
  }
}

TEST(ASiloWriter, DISABLED_Generates3DPointMeshWithColors)
{
  const char *filename = "./output/silo/test_3d_point_mesh_with_colors.silo"; 

  DBfile *dbfile = NULL;
  /* Open the Silo file */
  dbfile = DBCreate(filename, DB_CLOBBER, DB_LOCAL, 
      "Test 3D point mesh with colors.", DB_HDF5);

  /* Create some points to save. */
  int i, ndims = 3;
  float x[NPTS], y[NPTS], z[NPTS];

  float *coords[] = {(float*) x, (float*) y, (float*) z};

  for (i = 0; i < NPTS; ++i)
  {
    float t = ((float) i) / ((float) (NPTS-1));
    float angle = 3.14159 * 10. * t;
    x[i] = t * cos(angle);
    y[i] = t * sin(angle);
    z[i] = t;
  }
  /* Write a point mesh. */
  DBPutPointmesh(dbfile, "pointmesh", ndims, coords, NPTS,
      DB_FLOAT, NULL);
}
