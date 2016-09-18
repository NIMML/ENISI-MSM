#ifndef ENISI_Cytokine
#define ENISI_Cytokine

#include <string>

namespace ENISI
{

class Cytokine
{
private:
  Cytokine();

public:
  Cytokine(const std::string & name);

  ~Cytokine();

  const std::string & getName() const;
  const double & getInitialValue() const;
  const double & getDiffusion() const;
  const double & getDegradation() const;
  const size_t & getIndex() const;
  void setIndex(const size_t & index);

private:
  std::string mName;
  double mInitialValue;
  double mDiffusion;
  double mDegradation;
  size_t mIndex;

};

} // namespace ENISI

#endif // ENISI_Cytokine
