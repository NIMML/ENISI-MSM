/*
 * Projection.h
 *
 *  Created on: Apr 5, 2016
 *      Author: shoops
 */

#ifndef COMPARTMENT_PROJECTION_H_
#define COMPARTMENT_PROJECTION_H_

#include "repast_hpc/SharedDiscreteSpace.h"

#include "compartment/Compartment.h"

namespace ENISI
{

template<typename AgentType, typename GPTransformer, typename Adder>
class Projection: public repast::SharedDiscreteSpace< AgentType, GPTransformer, Adder >
{
  private:
    Compartment * mpCompartment;

  protected:

  public:
    /**
     * Creates a projection with specified name.
     *
     * @param name the name of the projection. This must be unique
     * across projections
     */
    Projection(std::string name,
               repast::GridDimensions gridDims,
               std::vector<int> processDims,
               int buffer,
               boost::mpi::communicator* world) :
      repast::SharedDiscreteSpace< AgentType, GPTransformer, Adder >(name, gridDims, processDims, buffer, world),
      mpCompartment(NULL)
    {}

    virtual ~Projection()
    {}


    /**
     * Given a set of agents, gets the agents that this projection implementation must 'push' to
     * other processes. Generally spaces must push agents that are in 'buffer zones' and graphs
     * must push local agents that are vertices to master edges where the other vertex is non-
     * local. The results are returned per-process in the agentsToPush map.
     */
    virtual void getAgentsToPush(std::set<repast::AgentId>& agentsToTest,
                                 std::map<int, std::set<repast::AgentId> >& agentsToPush)
    {
      if (mpCompartment != NULL)
        {
          mpCompartment->getBorderAgentsToPush(agentsToPush);
        }

      repast::SharedDiscreteSpace< AgentType, GPTransformer, Adder >::getAgentsToPush(agentsToTest, agentsToPush);
    }

    void addCompartment(Compartment * pCompartment)
    {
      mpCompartment = pCompartment;
    }

};

} /* namespace ENISI */

#endif /* COMPARTMENT_PROJECTION_H_ */
