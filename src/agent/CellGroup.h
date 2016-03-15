#ifndef ENISI_MSM_AGENT_CELLGROUP_H
#define ENISI_MSM_AGENT_CELLGROUP_H

#include "agent/ENISIAgent.h"

namespace ENISI {

class Compartment;
class CellGroupImpl;

class CellGroup : public Agent
{
public:
  typedef std::map<int, std::vector<std::pair<int, int> > > Transfers;

  /**
   * Destructor
   */
  ~CellGroup();

  /**
   * Specific Constructor
   * @param Compartment * pCompartment
   */
  CellGroup(Compartment * pCompartment);

  /**
   *
   */
  const Transfers & getTransfers();

  /**
   *
   */
  void clearTransfers();

  /**
   *
   */
  void setTransfers(const Transfers &);

  /**
   *
   */
  bool isPointInBounds(const repast::Point<int> &);

  /**
   *
   */
  const repast::GridDimensions & getDimensions() const;

protected:
  /**
   *
   */
  bool moveCellAcrossBorder(int, const repast::Point<int> &);

  /**
   *
   */
  std::vector<double> randomMove(const double &, const repast::Point<int> &);

  /**
   *
   */
  void transferStateTo(int, const repast::Point<int> &, unsigned int = 1);

  /**
   *
   */
  Compartment * mpCompartment;

private:
  /**
   *
   */
  CellGroupImpl * _p_impl;
};

class TransferGroup : public CellGroup
{
public:
  /**
   * Specific Constructor
   * @param Compartment * pCompartment
   */
  TransferGroup(Compartment * pCompartment);

  /**
   *
   */
  virtual void act();

  /**
   *
   */
  virtual std::string classname();
};

} // namespace ENISI

#endif
