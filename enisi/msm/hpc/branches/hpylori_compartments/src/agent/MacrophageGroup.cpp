#include "MacrophageGroup.h"

MacrophageGroup::MacrophageGroup(
    const boost::uintmax_t macrophageCount, CellLayer * p_layer)
  : CoordinateMap(p_layer)
{
  for (boost::uintmax_t i = 0; i < macrophageCount; i++) 
  {
    const repast::GridDimensions * p_dimensions = getDimensions();

    repast::Point<double> extents = p_dimensions->extents();
    repast::Point<double> origin = p_dimensions->origin();

    double xStart = origin.getX();
    double yStart = origin.getY();

    double xEnd = origin.getX() + extents.getX();
    double yEnd = origin.getY() + extents.getY();

    double xCoord = repast::Random::instance()
      ->createUniDoubleGenerator(xStart, xEnd).next();

    double yCoord = repast::Random::instance()
      ->createUniDoubleGenerator(yStart, yEnd).next();

    repast::Point<int> initialLoc(xCoord, yCoord);

    std::vector<double> moveTo = randomMove(1, initialLoc);
    repast::Point<int> newLoc(moveTo[0], moveTo[1]);

    addCellAt(MacrophageState::BASE, newLoc);
  }
}

void MacrophageGroup::act() 
{ 
  coordMapConstIter end = coordMapEnd();

  for(coordMapConstIter it = coordMapBegin(); it != end; it++) 
  {
    repast::Point<int> loc = it->first;
    const StateCount count = it->second;

    for (unsigned int i = 0; i < MacrophageState::KEEP_AT_END; ++i)
    {
      for (unsigned int j = 0; j < count.state[i]; ++j)
      {
	MacrophageState::State state = static_cast<MacrophageState::State>(i);
	act(state, loc);
      }
    }
  }
}

void MacrophageGroup::act(
    MacrophageState::State state, const repast::Point<int> & loc __attribute__((unused)))
{
 if (state == MacrophageState::DEAD) return;

  //double IL6  = Cytokines::instance().get("IL6", loc);
  //double TGFb = Cytokines::instance().get("TGFb", loc);
  //double IL12 = Cytokines::instance().get("IL12", loc);

  //TcellState::State newState = state;

  //if (IL6 + TGFb + IL12 > 1.0) 
  //{
    //[> set initial concentrations <]
    //TcellODE & odeModel = TcellODE::getInstance();
    //odeModel.setInitialConcentration("IL6", IL6);
    //odeModel.setInitialConcentration("TGFb", TGFb);
    //odeModel.setInitialConcentration("IL12", IL12);
    
    //[> run time course <]
    //odeModel.runTimeCourse();
    
    //double IFNg = odeModel.getConcentration("IFNg");
    //double IL17 = odeModel.getConcentration("IL17");
    //double IL10 = odeModel.getConcentration("IL10");

//[>    std::cout << "CD4+ T Cell at (" << loc.getX() << ", " << loc.getY() << ")\n";<]
    ////std::cout << "Inputs Cytokines:\n";
    ////std::cout << "IL12 : " << IL12 << "\n";
    ////std::cout << "IL6 : " << IL6 << "\n";
    ////std::cout << "TGFb : " << TGFb << "\n";
    ////std::cout << "Outputs Cytokines:\n";
    ////std::cout << "IFNg : " << IFNg << "\n";
    ////std::cout << "IL17 : " << IL17 << "\n";
    //[>std::cout << "IL10 : " << IL10 << "\n";<]

    //[> get output cytokines <]
    //Cytokines::CytoMap & cytoMap = Cytokines::instance().map();
    //cytoMap["IFNg"]->setValueAtCoord(IFNg, loc);
    //cytoMap["IL17"]->setValueAtCoord(IL17, loc);
    //cytoMap["IL10"]->setValueAtCoord(IL10, loc);

    //if (IL17 > 0.5) {
      //newState = TcellState::TH17;
    //} else if (IFNg > 0.5) {
      //newState = TcellState::TH1;
    //} else if (IL10 > 0.5) {
      //newState = TcellState::TREG;
    //}
  //}

  //std::vector<double> moveTo = randomMove(1, loc);
  //repast::Point<int> newLoc(moveTo[0], moveTo[1]);

  //delCellAt(state, loc);
  /*addCellAt(newState, newLoc);*/
}

