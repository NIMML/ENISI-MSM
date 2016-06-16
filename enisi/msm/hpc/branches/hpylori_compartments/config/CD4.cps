<?xml version="1.0" encoding="UTF-8"?>
<!-- generated with COPASI 4.16 (Build 104) (http://www.copasi.org) at 2016-06-16 17:33:30 UTC -->
<?oxygen RNGSchema="http://www.copasi.org/static/schema/CopasiML.rng" type="xml"?>
<COPASI xmlns="http://www.copasi.org/static/schema" versionMajor="4" versionMinor="16" versionDevel="104" copasiSourcesModified="0">
  <ListOfFunctions>
    <Function key="Function_13" name="Mass action (irreversible)" type="MassAction" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
   <rdf:Description rdf:about="#Function_13">
   <CopasiMT:is rdf:resource="urn:miriam:obo.sbo:SBO:0000041" />
   </rdf:Description>
   </rdf:RDF>
      </MiriamAnnotation>
      <Comment>
        <b xmlns="http://www.w3.org/1999/xhtml">
mass action rate law for first order irreversible reactions
</b>
<p>
Reaction scheme where the products are created from the reactants and the change of a product quantity is proportional to the product of reactant activities. The reaction scheme does not include any reverse process that creates the reactants from the products. The change of a product quantity is proportional to the quantity of one reactant.
</p>
      </Comment>
      <Expression>
        k1*PRODUCT&lt;substrate_i&gt;
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_81" name="k1" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_79" name="substrate" order="1" role="substrate"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_14" name="Mass action (reversible)" type="MassAction" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
   <rdf:Description rdf:about="#Function_14">
   <CopasiMT:is rdf:resource="urn:miriam:obo.sbo:SBO:0000042" />
   </rdf:Description>
   </rdf:RDF>
      </MiriamAnnotation>
      <Comment>
        <b xmlns="http://www.w3.org/1999/xhtml">
mass action rate law for reversible reactions
</b>
<p>
Reaction scheme where the products are created from the reactants and the change of a product quantity is proportional to the product of reactant activities. The reaction scheme does include a reverse process that creates the reactants from the products.
</p>
      </Comment>
      <Expression>
        k1*PRODUCT&lt;substrate_i&gt;-k2*PRODUCT&lt;product_j&gt;
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_62" name="k1" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_39" name="substrate" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_67" name="k2" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_71" name="product" order="3" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_40" name="2 Reactants, 1 Inhibitor" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_40">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-19T11:07:35Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vf*r1*r2*(K^n/(I^n+K^n))-Vr*p
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_264" name="Vf" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_254" name="r1" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_258" name="r2" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_266" name="K" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_268" name="n" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_270" name="I" order="5" role="modifier"/>
        <ParameterDescription key="FunctionParameter_272" name="Vr" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_274" name="p" order="7" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_41" name="1 Reactant, 1 Activator" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_41">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-19T11:27:45Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vf*r1*(1+A^n/(A^n+K^n))-Vr*p
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_275" name="Vf" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_271" name="r1" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_267" name="A" order="2" role="modifier"/>
        <ParameterDescription key="FunctionParameter_246" name="n" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_276" name="K" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_278" name="Vr" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_280" name="p" order="6" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_42" name="2 Reactants, 2 Inhibitors" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_42">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-22T10:17:11Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vf*r1*r2*(K1^n1/(I1^n1+K1^n1))*(K2^n2/(I2^n2+K2^n2))-Vr*p
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_281" name="Vf" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_277" name="r1" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_265" name="r2" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_273" name="K1" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_283" name="n1" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_285" name="I1" order="5" role="modifier"/>
        <ParameterDescription key="FunctionParameter_287" name="K2" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_289" name="n2" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_291" name="I2" order="8" role="modifier"/>
        <ParameterDescription key="FunctionParameter_293" name="Vr" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_295" name="p" order="10" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_43" name="2 Reactants, 2 Inhibitors, 1  Activator" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_43">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-22T10:18:49Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vf*r1*r2*(K1^n1/(I1^n1+K1^n1))*(K2^n2/(I2^n2+K2^n2))*(1+A^n3/(A^n3+K3^n3))-Vr*p
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_296" name="Vf" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_284" name="K1" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_269" name="n1" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_279" name="I1" order="3" role="modifier"/>
        <ParameterDescription key="FunctionParameter_298" name="K2" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_300" name="n2" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_302" name="I2" order="6" role="modifier"/>
        <ParameterDescription key="FunctionParameter_304" name="A" order="7" role="modifier"/>
        <ParameterDescription key="FunctionParameter_306" name="n3" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_308" name="K3" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_310" name="Vr" order="10" role="constant"/>
        <ParameterDescription key="FunctionParameter_312" name="p" order="11" role="product"/>
        <ParameterDescription key="FunctionParameter_292" name="r1" order="12" role="substrate"/>
        <ParameterDescription key="FunctionParameter_288" name="r2" order="13" role="substrate"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_44" name="1 Reactant, 1 Inhibitor, 3  Activators" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_44">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-22T10:41:46Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vf*r1*(K^n/(I^n+K^n))*((A1^n1/(A1^n1+K1^n1))+(A2^n2/(A2^n2+K2^n2))+(A3^n3/(A3^n3+K3^n3)))-Vr*p
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_313" name="Vf" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_309" name="r1" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_305" name="K" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_301" name="n" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_297" name="I" order="4" role="modifier"/>
        <ParameterDescription key="FunctionParameter_282" name="A1" order="5" role="modifier"/>
        <ParameterDescription key="FunctionParameter_290" name="n1" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_314" name="K1" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_316" name="A2" order="8" role="modifier"/>
        <ParameterDescription key="FunctionParameter_318" name="n2" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_320" name="K2" order="10" role="constant"/>
        <ParameterDescription key="FunctionParameter_322" name="A3" order="11" role="modifier"/>
        <ParameterDescription key="FunctionParameter_324" name="n3" order="12" role="constant"/>
        <ParameterDescription key="FunctionParameter_326" name="K3" order="13" role="constant"/>
        <ParameterDescription key="FunctionParameter_328" name="Vr" order="14" role="constant"/>
        <ParameterDescription key="FunctionParameter_330" name="p" order="15" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_45" name="1 Reactant, 3 Inhibitors, 3  Activators" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_45">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-22T13:54:50Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vf*r1*(K1^n1/(I1^n1+K1^n1))*(K2^n2/(I2^n2+K2^n2))*(K3^n3/(I3^n3+K3^n3))*((A1^n4/(A1^n4+K4^n4))+(A2^n5/(A2^n5+K5^n5))+(A3^n6/(A3^n6+K6^n6)))-Vr*p
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_331" name="Vf" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_327" name="r1" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_323" name="K1" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_319" name="n1" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_315" name="I1" order="4" role="modifier"/>
        <ParameterDescription key="FunctionParameter_286" name="K2" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_299" name="n2" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_307" name="I2" order="7" role="modifier"/>
        <ParameterDescription key="FunctionParameter_332" name="K3" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_334" name="n3" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_336" name="I3" order="10" role="modifier"/>
        <ParameterDescription key="FunctionParameter_338" name="A1" order="11" role="modifier"/>
        <ParameterDescription key="FunctionParameter_340" name="n4" order="12" role="constant"/>
        <ParameterDescription key="FunctionParameter_342" name="K4" order="13" role="constant"/>
        <ParameterDescription key="FunctionParameter_344" name="A2" order="14" role="modifier"/>
        <ParameterDescription key="FunctionParameter_346" name="n5" order="15" role="constant"/>
        <ParameterDescription key="FunctionParameter_348" name="K5" order="16" role="constant"/>
        <ParameterDescription key="FunctionParameter_350" name="A3" order="17" role="modifier"/>
        <ParameterDescription key="FunctionParameter_352" name="n6" order="18" role="constant"/>
        <ParameterDescription key="FunctionParameter_354" name="K6" order="19" role="constant"/>
        <ParameterDescription key="FunctionParameter_356" name="Vr" order="20" role="constant"/>
        <ParameterDescription key="FunctionParameter_358" name="p" order="21" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_46" name="1 Reactant, 2 Inhibitors, 1  Activator" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_46">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-22T14:04:49Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vf*r1*(K1^n1/(I1^n1+K1^n1))*(K2^n2/(I2^n2+K2^n2))*(1+A^n3/(A^n3+K3^n3))-Vr*p
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_359" name="Vf" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_355" name="r1" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_351" name="K1" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_347" name="n1" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_343" name="I1" order="4" role="modifier"/>
        <ParameterDescription key="FunctionParameter_339" name="K2" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_335" name="n2" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_311" name="I2" order="7" role="modifier"/>
        <ParameterDescription key="FunctionParameter_262" name="A" order="8" role="modifier"/>
        <ParameterDescription key="FunctionParameter_317" name="n3" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_325" name="K3" order="10" role="constant"/>
        <ParameterDescription key="FunctionParameter_360" name="Vr" order="11" role="constant"/>
        <ParameterDescription key="FunctionParameter_362" name="p" order="12" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_47" name="1 Reactant, 2 Activators" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_47">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-22T14:49:35Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vf*r1*(A1^n1/(A1^n1+K1^n1))*(A2^n2/(A2^n2+K2^n2))-Vr*p
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_363" name="Vf" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_329" name="r1" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_294" name="A1" order="2" role="modifier"/>
        <ParameterDescription key="FunctionParameter_333" name="n1" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_341" name="K1" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_349" name="A2" order="5" role="modifier"/>
        <ParameterDescription key="FunctionParameter_357" name="n2" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_365" name="K2" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_367" name="Vr" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_369" name="p" order="9" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_48" name="1 Reactant, 3 Inhibitors, 2  Activators" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_48">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-22T14:55:41Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vf*r1*(K1^n1/(I1^n1+K1^n1))*(K2^n2/(I2^n2+K2^n2))*(K3^n3/(I3^n3+K3^n3))*((A1^n4/(A1^n4+K4^n4))+(A2^n5/(A2^n5+K5^n5)))-Vr*p
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_370" name="Vf" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_366" name="r1" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_353" name="K1" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_337" name="n1" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_321" name="I1" order="4" role="modifier"/>
        <ParameterDescription key="FunctionParameter_371" name="K2" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_373" name="n2" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_375" name="I2" order="7" role="modifier"/>
        <ParameterDescription key="FunctionParameter_377" name="K3" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_379" name="n3" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_381" name="I3" order="10" role="modifier"/>
        <ParameterDescription key="FunctionParameter_383" name="A1" order="11" role="modifier"/>
        <ParameterDescription key="FunctionParameter_385" name="n4" order="12" role="constant"/>
        <ParameterDescription key="FunctionParameter_387" name="K4" order="13" role="constant"/>
        <ParameterDescription key="FunctionParameter_389" name="A2" order="14" role="modifier"/>
        <ParameterDescription key="FunctionParameter_391" name="n5" order="15" role="constant"/>
        <ParameterDescription key="FunctionParameter_393" name="K5" order="16" role="constant"/>
        <ParameterDescription key="FunctionParameter_395" name="Vr" order="17" role="constant"/>
        <ParameterDescription key="FunctionParameter_397" name="p" order="18" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_49" name="1 Reactant, 1 Inhibitor, 4  Activators" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_49">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-22T16:09:29Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vf*r1*(K^n/(I^n+K^n))*((A1^n1/(A1^n1+K1^n1))+(A2^n2/(A2^n2+K2^n2))+(A3^n3/(A3^n3+K3^n3))+(A4^n4/(A4^n4+K4^n4)))-Vr*p
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_398" name="Vf" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_394" name="r1" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_390" name="K" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_386" name="n" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_382" name="I" order="4" role="modifier"/>
        <ParameterDescription key="FunctionParameter_378" name="A1" order="5" role="modifier"/>
        <ParameterDescription key="FunctionParameter_374" name="n1" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_361" name="K1" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_345" name="A2" order="8" role="modifier"/>
        <ParameterDescription key="FunctionParameter_368" name="n2" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_400" name="K2" order="10" role="constant"/>
        <ParameterDescription key="FunctionParameter_402" name="A3" order="11" role="modifier"/>
        <ParameterDescription key="FunctionParameter_404" name="n3" order="12" role="constant"/>
        <ParameterDescription key="FunctionParameter_406" name="K3" order="13" role="constant"/>
        <ParameterDescription key="FunctionParameter_408" name="A4" order="14" role="modifier"/>
        <ParameterDescription key="FunctionParameter_410" name="n4" order="15" role="constant"/>
        <ParameterDescription key="FunctionParameter_412" name="K4" order="16" role="constant"/>
        <ParameterDescription key="FunctionParameter_414" name="Vr" order="17" role="constant"/>
        <ParameterDescription key="FunctionParameter_416" name="p" order="18" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_50" name="2 Reactants, 1 Inhibitor, 1  Activator" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_50">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-22T16:33:10Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vf*r1*r2*(K^n/(I^n+K^n))*(1+A^n1/(A^n1+K1^n1))-Vr*p
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_417" name="Vf" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_413" name="r1" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_409" name="r2" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_405" name="K" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_401" name="n" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_364" name="I" order="5" role="modifier"/>
        <ParameterDescription key="FunctionParameter_372" name="A" order="6" role="modifier"/>
        <ParameterDescription key="FunctionParameter_380" name="n1" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_388" name="K1" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_396" name="Vr" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_419" name="p" order="10" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_51" name="1 Reactant, 2 Inhibitors, 2  Activators" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_51">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-26T16:03:02Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vf*r1*(K1^n1/(I1^n1+K1^n1))*(K2^n2/(I2^n2+K2^n2))*((A1^n3/(A1^n3+K3^n3))+(A2^n4/(A2^n4+K4^n4)))-Vr*p
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_420" name="Vf" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_392" name="r1" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_376" name="K1" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_399" name="n1" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_407" name="I1" order="4" role="modifier"/>
        <ParameterDescription key="FunctionParameter_415" name="K2" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_422" name="n2" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_424" name="I2" order="7" role="modifier"/>
        <ParameterDescription key="FunctionParameter_426" name="A1" order="8" role="modifier"/>
        <ParameterDescription key="FunctionParameter_428" name="n3" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_430" name="K3" order="10" role="constant"/>
        <ParameterDescription key="FunctionParameter_432" name="A2" order="11" role="modifier"/>
        <ParameterDescription key="FunctionParameter_434" name="n4" order="12" role="constant"/>
        <ParameterDescription key="FunctionParameter_436" name="K4" order="13" role="constant"/>
        <ParameterDescription key="FunctionParameter_438" name="Vr" order="14" role="constant"/>
        <ParameterDescription key="FunctionParameter_440" name="p" order="15" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_52" name="1 Reactant, 2 Inhibitors, 3 Activators" type="UserDefined" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_52">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-06-16T11:22:47Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vf*r1*(K1^n1/(I1^n1+K1^n1))*(K2^n2/(I2^n2+K2^n2))*((A1^n3/(A1^n3+K3^n3))+(A2^n4/(A2^n4+K4^n4))+(A3^n5/(A3^n5+K5^n5)))-Vr*p
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_441" name="Vf" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_437" name="r1" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_433" name="K1" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_429" name="n1" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_425" name="I1" order="4" role="modifier"/>
        <ParameterDescription key="FunctionParameter_421" name="K2" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_403" name="n2" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_384" name="I2" order="7" role="modifier"/>
        <ParameterDescription key="FunctionParameter_442" name="A1" order="8" role="modifier"/>
        <ParameterDescription key="FunctionParameter_444" name="n3" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_446" name="K3" order="10" role="constant"/>
        <ParameterDescription key="FunctionParameter_448" name="A2" order="11" role="modifier"/>
        <ParameterDescription key="FunctionParameter_450" name="n4" order="12" role="constant"/>
        <ParameterDescription key="FunctionParameter_452" name="K4" order="13" role="constant"/>
        <ParameterDescription key="FunctionParameter_454" name="A3" order="14" role="modifier"/>
        <ParameterDescription key="FunctionParameter_456" name="n5" order="15" role="constant"/>
        <ParameterDescription key="FunctionParameter_458" name="K5" order="16" role="constant"/>
        <ParameterDescription key="FunctionParameter_460" name="Vr" order="17" role="constant"/>
        <ParameterDescription key="FunctionParameter_462" name="p" order="18" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_53" name="1 Reactant, 1 inhibitor, 1 activator" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_53">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2011-03-27T18:46:43Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vf*r1*(K^n/(I^n+K^n))*((A1^n1/(A1^n1+K1^n1)))-Vr*p
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_463" name="Vf" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_459" name="r1" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_455" name="K" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_451" name="n" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_447" name="I" order="4" role="modifier"/>
        <ParameterDescription key="FunctionParameter_443" name="A1" order="5" role="modifier"/>
        <ParameterDescription key="FunctionParameter_303" name="n1" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_423" name="K1" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_431" name="Vr" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_439" name="p" order="9" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_54" name="Pool coupling" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_54">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-01-17T10:13:49Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

      </MiriamAnnotation>
      <Expression>
        V*(pool^n/(pool^n+ext^n+0.001) - k*ext)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_464" name="V" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_427" name="pool" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_418" name="n" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_449" name="ext" order="3" role="product"/>
        <ParameterDescription key="FunctionParameter_457" name="k" order="4" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_55" name="1 Reactant, 4 inhibitors, 3 activators" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_55">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-10-14T16:41:56Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vf*r1*(K1^n1/(I1^n1+K1^n1))*(K2^n2/(I2^n2+K2^n2))*(K3^n1/(I3^n3+K3^n3))*(K4^n4/(I4^n4+K4^n4))*((A1^n3/(A1^n3+K5^n3))+(A2^n4/(A2^n4+K6^n4))+(A3^n5/(A3^n5+K7^n5)))-Vr*p
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_461" name="Vf" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_445" name="r1" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_435" name="K1" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_466" name="n1" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_468" name="I1" order="4" role="modifier"/>
        <ParameterDescription key="FunctionParameter_470" name="K2" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_472" name="n2" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_474" name="I2" order="7" role="modifier"/>
        <ParameterDescription key="FunctionParameter_476" name="K3" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_478" name="I3" order="9" role="modifier"/>
        <ParameterDescription key="FunctionParameter_480" name="n3" order="10" role="constant"/>
        <ParameterDescription key="FunctionParameter_482" name="K4" order="11" role="constant"/>
        <ParameterDescription key="FunctionParameter_484" name="n4" order="12" role="constant"/>
        <ParameterDescription key="FunctionParameter_486" name="I4" order="13" role="modifier"/>
        <ParameterDescription key="FunctionParameter_488" name="A1" order="14" role="modifier"/>
        <ParameterDescription key="FunctionParameter_492" name="A2" order="15" role="modifier"/>
        <ParameterDescription key="FunctionParameter_496" name="A3" order="16" role="modifier"/>
        <ParameterDescription key="FunctionParameter_498" name="n5" order="17" role="constant"/>
        <ParameterDescription key="FunctionParameter_490" name="K5" order="18" role="constant"/>
        <ParameterDescription key="FunctionParameter_502" name="Vr" order="19" role="constant"/>
        <ParameterDescription key="FunctionParameter_504" name="p" order="20" role="product"/>
        <ParameterDescription key="FunctionParameter_494" name="K6" order="21" role="constant"/>
        <ParameterDescription key="FunctionParameter_500" name="K7" order="22" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
  </ListOfFunctions>
  <Model key="Model_4" name="CD4+ T Cell Differentiation model" simulationType="time" timeUnit="h" volumeUnit="l" areaUnit="m²" lengthUnit="m" quantityUnit="mol" type="deterministic" avogadroConstant="6.02214e+23">
    <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:vCard="http://www.w3.org/2001/vcard-rdf/3.0#">
  <rdf:Description rdf:about="#Model_4">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-19T10:29:26Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
    <dcterms:creator>
      <rdf:Description>
        <vCard:EMAIL>acarbo@vbi.vt.edu</vCard:EMAIL>
        <vCard:N>
          <rdf:Description>
            <vCard:Family>Carbo</vCard:Family>
            <vCard:Given>Adria</vCard:Given>
          </rdf:Description>
        </vCard:N>
        <vCard:ORG>
          <rdf:Description>
            <vCard:Orgname>VBI</vCard:Orgname>
          </rdf:Description>
        </vCard:ORG>
      </rdf:Description>
    </dcterms:creator>
    <dcterms:creator>
      <rdf:Description>
        <vCard:EMAIL>jbassaga@vbi.vt.edu</vCard:EMAIL>
        <vCard:N>
          <rdf:Description>
            <vCard:Family>Bassaganya-Riera</vCard:Family>
            <vCard:Given>Josep</vCard:Given>
          </rdf:Description>
        </vCard:N>
        <vCard:ORG>
          <rdf:Description>
            <vCard:Orgname>VBI</vCard:Orgname>
          </rdf:Description>
        </vCard:ORG>
      </rdf:Description>
    </dcterms:creator>
    <dcterms:creator>
      <rdf:Description>
        <vCard:EMAIL>shoops@vbi.vt.edu</vCard:EMAIL>
        <vCard:N>
          <rdf:Description>
            <vCard:Family>Hoops</vCard:Family>
            <vCard:Given>Stefan</vCard:Given>
          </rdf:Description>
        </vCard:N>
        <vCard:ORG>
          <rdf:Description>
            <vCard:Orgname>VBI</vCard:Orgname>
          </rdf:Description>
        </vCard:ORG>
      </rdf:Description>
    </dcterms:creator>
  </rdf:Description>
</rdf:RDF>

    </MiriamAnnotation>
    <Comment>
      <body xmlns="http://www.w3.org/1999/xhtml" />

CD4+ T cell computational model

Version 1.4

Steady state corrected. There was a problem in the internalization of IL-17 in its mathematical function.
    </Comment>
    <ListOfCompartments>
      <Compartment key="Compartment_1" name="default" simulationType="fixed" dimensionality="3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Compartment_1">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-19T10:55:00Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Compartment>
      <Compartment key="Compartment_3" name="T Helper Cell" simulationType="fixed" dimensionality="3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Compartment_3">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-19T10:30:48Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Compartment>
    </ListOfCompartments>
    <ListOfMetabolites>
      <Metabolite key="Metabolite_1" name="eIFNg" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-04T12:13:18Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <InitialExpression>
          &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[IFNg_pool],Reference=InitialConcentration&gt;
        </InitialExpression>
      </Metabolite>
      <Metabolite key="Metabolite_3" name="eIL12" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_3">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-25T11:36:12Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <InitialExpression>
          &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[IL12_pool],Reference=InitialConcentration&gt;
        </InitialExpression>
      </Metabolite>
      <Metabolite key="Metabolite_5" name="eIL21" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_5">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-04T12:14:15Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <InitialExpression>
          &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[IL21_pool],Reference=InitialConcentration&gt;
        </InitialExpression>
      </Metabolite>
      <Metabolite key="Metabolite_7" name="eIL23" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_7">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-04T12:14:27Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <InitialExpression>
          &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[IL23_pool],Reference=InitialConcentration&gt;
        </InitialExpression>
      </Metabolite>
      <Metabolite key="Metabolite_9" name="eIL4" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_9">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-04T12:14:47Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <InitialExpression>
          &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[IL4_pool],Reference=InitialConcentration&gt;
        </InitialExpression>
      </Metabolite>
      <Metabolite key="Metabolite_11" name="eTGFb" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_11">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-04T13:15:39Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <InitialExpression>
          &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[TGFb_pool],Reference=InitialConcentration&gt;
        </InitialExpression>
      </Metabolite>
      <Metabolite key="Metabolite_13" name="eIL2" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_13">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-04T12:13:47Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <InitialExpression>
          &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[IL2_pool],Reference=InitialConcentration&gt;
        </InitialExpression>
      </Metabolite>
      <Metabolite key="Metabolite_15" name="eIL6" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_15">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-04T12:14:54Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <InitialExpression>
          &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[IL6_pool],Reference=InitialConcentration&gt;
        </InitialExpression>
      </Metabolite>
      <Metabolite key="Metabolite_17" name="eIL17" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_17">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-04T12:07:26Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <InitialExpression>
          &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[IL17_pool],Reference=InitialConcentration&gt;
        </InitialExpression>
      </Metabolite>
      <Metabolite key="Metabolite_19" name="eIL10" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_19">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-04T12:13:31Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <InitialExpression>
          &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[IL10_pool],Reference=InitialConcentration&gt;
        </InitialExpression>
      </Metabolite>
      <Metabolite key="Metabolite_21" name="eIL18" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_21">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-04T12:35:05Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <InitialExpression>
          &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[IL18_pool],Reference=InitialConcentration&gt;
        </InitialExpression>
      </Metabolite>
      <Metabolite key="Metabolite_23" name="anti-IL4" simulationType="fixed" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_23">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-07-12T16:31:23Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_25" name="anti-IFNg" simulationType="fixed" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_25">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-07-12T16:31:17Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_27" name="pIL4" simulationType="fixed" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_27">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2011-02-03T12:20:44Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_29" name="IL18_pool" simulationType="fixed" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_29">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-01-17T10:12:03Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_31" name="IL12_pool" simulationType="fixed" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_31">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-01-17T10:13:01Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_33" name="IFNg_pool" simulationType="fixed" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_33">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-01-17T10:18:38Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_35" name="IL21_pool" simulationType="fixed" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_35">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-01-17T10:21:04Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_37" name="IL23_pool" simulationType="fixed" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_37">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-01-17T10:32:58Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_39" name="IL17_pool" simulationType="fixed" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_39">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-01-17T10:34:14Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_41" name="IL10_pool" simulationType="fixed" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_41">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-01-17T10:36:32Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_43" name="IL6_pool" simulationType="fixed" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_43">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-01-17T10:39:38Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_45" name="IL2_pool" simulationType="fixed" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_45">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-01-17T10:40:51Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_47" name="TGFb_pool" simulationType="fixed" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_47">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-01-17T10:42:16Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_49" name="IL4_pool" simulationType="fixed" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_49">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-01-17T10:43:14Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_51" name="pIL10" simulationType="fixed" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_51">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-02-18T11:35:36Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_189" name="dIFNg" simulationType="assignment" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_189">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-06-16T12:55:22Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIFNg],Reference=Concentration&gt;-&lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIFNg],Reference=InitialConcentration&gt;
        </Expression>
      </Metabolite>
      <Metabolite key="Metabolite_191" name="dIL12" simulationType="assignment" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_191">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-06-16T12:56:21Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL12],Reference=Concentration&gt;-&lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL12],Reference=InitialConcentration&gt;
        </Expression>
      </Metabolite>
      <Metabolite key="Metabolite_193" name="dIL21" simulationType="assignment" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_193">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-06-16T12:56:48Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL21],Reference=Concentration&gt;-&lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL21],Reference=InitialConcentration&gt;
        </Expression>
      </Metabolite>
      <Metabolite key="Metabolite_197" name="dIL23" simulationType="assignment" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_197">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-06-16T12:57:13Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL23],Reference=Concentration&gt;-&lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL23],Reference=InitialConcentration&gt;
        </Expression>
      </Metabolite>
      <Metabolite key="Metabolite_199" name="dIL4" simulationType="assignment" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_199">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-06-16T12:58:02Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL4],Reference=Concentration&gt;-&lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL4],Reference=InitialConcentration&gt;
        </Expression>
      </Metabolite>
      <Metabolite key="Metabolite_201" name="dTGFb" simulationType="assignment" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_201">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-06-16T12:58:24Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eTGFb],Reference=Concentration&gt;-&lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eTGFb],Reference=InitialConcentration&gt;
        </Expression>
      </Metabolite>
      <Metabolite key="Metabolite_203" name="dIL2" simulationType="assignment" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_203">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-06-16T12:58:50Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL2],Reference=Concentration&gt;-&lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL2],Reference=InitialConcentration&gt;
        </Expression>
      </Metabolite>
      <Metabolite key="Metabolite_205" name="dIL6" simulationType="assignment" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_205">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-06-16T12:58:11Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL6],Reference=Concentration&gt;-&lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL6],Reference=InitialConcentration&gt;
        </Expression>
      </Metabolite>
      <Metabolite key="Metabolite_207" name="dIL17" simulationType="assignment" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_207">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-06-16T12:59:14Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL17],Reference=Concentration&gt;-&lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL17],Reference=InitialConcentration&gt;
        </Expression>
      </Metabolite>
      <Metabolite key="Metabolite_209" name="dIL10" simulationType="assignment" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_209">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-06-16T12:59:03Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL10],Reference=Concentration&gt;-&lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL10],Reference=InitialConcentration&gt;
        </Expression>
      </Metabolite>
      <Metabolite key="Metabolite_211" name="dIL18" simulationType="assignment" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_211">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-06-16T12:59:22Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL18],Reference=Concentration&gt;-&lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL18],Reference=InitialConcentration&gt;
        </Expression>
      </Metabolite>
      <Metabolite key="Metabolite_53" name="IL6-IL6R" simulationType="reactions" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_53">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-01-17T10:03:28Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_55" name="IL6R" simulationType="reactions" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_55">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-04T13:21:22Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_57" name="IL6" simulationType="reactions" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_57">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-01-17T10:54:13Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_59" name="TGFb-TGFbR" simulationType="reactions" compartment="Compartment_3">
      </Metabolite>
      <Metabolite key="Metabolite_61" name="TGFbR" simulationType="reactions" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_61">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-04T13:17:49Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_63" name="TGFb" simulationType="reactions" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_63">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-04T13:17:30Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_65" name="IL2-IL2R" simulationType="reactions" compartment="Compartment_3">
      </Metabolite>
      <Metabolite key="Metabolite_67" name="IL2R" simulationType="reactions" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_67">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-04T13:21:13Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_69" name="IL2" simulationType="reactions" compartment="Compartment_3">
      </Metabolite>
      <Metabolite key="Metabolite_71" name="IL4-IL4R" simulationType="reactions" compartment="Compartment_3">
      </Metabolite>
      <Metabolite key="Metabolite_73" name="IL4R" simulationType="reactions" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_73">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-04T13:21:17Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_75" name="IL4" simulationType="reactions" compartment="Compartment_3">
      </Metabolite>
      <Metabolite key="Metabolite_77" name="IFNg-IFNgR" simulationType="reactions" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_77">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-06-16T13:04:37Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_79" name="IFNgR" simulationType="reactions" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_79">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-04T13:20:41Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_81" name="IL12-IL12R" simulationType="reactions" compartment="Compartment_3">
      </Metabolite>
      <Metabolite key="Metabolite_83" name="IL12R" simulationType="reactions" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_83">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-04T13:20:49Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_85" name="IL12" simulationType="reactions" compartment="Compartment_3">
      </Metabolite>
      <Metabolite key="Metabolite_87" name="IL18-IL18R" simulationType="reactions" compartment="Compartment_3">
      </Metabolite>
      <Metabolite key="Metabolite_89" name="IL18R" simulationType="reactions" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_89">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-04T13:20:57Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_91" name="IL18" simulationType="reactions" compartment="Compartment_3">
      </Metabolite>
      <Metabolite key="Metabolite_93" name="IL21" simulationType="reactions" compartment="Compartment_3">
      </Metabolite>
      <Metabolite key="Metabolite_95" name="IL21-IL21R" simulationType="reactions" compartment="Compartment_3">
      </Metabolite>
      <Metabolite key="Metabolite_97" name="IL21R" simulationType="reactions" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_97">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-04T13:21:02Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_99" name="IL23R" simulationType="reactions" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_99">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-04T13:24:33Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_101" name="IL23-IL23R" simulationType="reactions" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_101">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2011-01-21T14:01:33Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_103" name="IL10R" simulationType="reactions" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_103">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-04T13:20:46Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_105" name="IL10-IL10R" simulationType="reactions" compartment="Compartment_3">
      </Metabolite>
      <Metabolite key="Metabolite_107" name="IRAK1" simulationType="fixed" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_107">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-04T13:15:47Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_109" name="IRAK1-P" simulationType="reactions" compartment="Compartment_3">
      </Metabolite>
      <Metabolite key="Metabolite_111" name="p50/p65 dimer" simulationType="reactions" compartment="Compartment_3">
      </Metabolite>
      <Metabolite key="Metabolite_113" name="STAT4" simulationType="fixed" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_113">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-04T13:16:40Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_115" name="STAT4-P" simulationType="reactions" compartment="Compartment_3">
      </Metabolite>
      <Metabolite key="Metabolite_117" name="IFNg" simulationType="reactions" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_117">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-02-18T11:38:05Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_119" name="JAK1" simulationType="fixed" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_119">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-04T13:19:02Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_121" name="JAK1-P" simulationType="reactions" compartment="Compartment_3">
      </Metabolite>
      <Metabolite key="Metabolite_123" name="STAT1" simulationType="fixed" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_123">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-04T13:17:08Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_125" name="STAT1-P" simulationType="reactions" compartment="Compartment_3">
      </Metabolite>
      <Metabolite key="Metabolite_127" name="p40/p19 dimer" simulationType="reactions" compartment="Compartment_3">
      </Metabolite>
      <Metabolite key="Metabolite_129" name="IL17" simulationType="reactions" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_129">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-04T11:25:23Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_131" name="IL10" simulationType="reactions" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_131">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-04T11:10:52Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_133" name="RORgt" simulationType="fixed" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_133">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-04T13:17:01Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_135" name="RORgt-ligand" simulationType="reactions" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_135">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2011-02-06T18:18:34Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_137" name="STAT3-P" simulationType="reactions" compartment="Compartment_3">
      </Metabolite>
      <Metabolite key="Metabolite_139" name="STAT3" simulationType="fixed" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_139">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-04T13:17:11Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_141" name="STAT5-P" simulationType="reactions" compartment="Compartment_3">
      </Metabolite>
      <Metabolite key="Metabolite_143" name="STAT5" simulationType="fixed" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_143">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-04T13:17:18Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_145" name="FOXP3" simulationType="fixed" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_145">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-04T13:19:28Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_147" name="SOCS1" simulationType="fixed" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_147">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-04T13:17:05Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_149" name="SOCS1-JAKs" simulationType="reactions" compartment="Compartment_3">
      </Metabolite>
      <Metabolite key="Metabolite_151" name="Tbet-P" simulationType="reactions" compartment="Compartment_3">
      </Metabolite>
      <Metabolite key="Metabolite_153" name="Tbet" simulationType="fixed" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_153">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-04T13:17:27Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_155" name="GATA3" simulationType="fixed" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_155">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-06-16T11:49:47Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_157" name="GATA3-P" simulationType="reactions" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_157">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-02-18T11:37:41Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_159" name="STAT6-P" simulationType="reactions" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_159">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2011-03-27T18:43:25Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_161" name="STAT6" simulationType="fixed" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_161">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-04T13:17:22Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_163" name="PPARg" simulationType="reactions" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_163">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-06-16T12:18:17Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_165" name="L-PPARg" simulationType="reactions" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_165">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-19T11:06:19Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_167" name="Ligand" simulationType="fixed" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_167">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-19T11:06:19Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_169" name="acetylated FOXP3" simulationType="reactions" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_169">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2011-03-17T20:19:31Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_171" name="p19" simulationType="fixed" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_171">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-04T13:16:01Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_173" name="p40" simulationType="fixed" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_173">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-04T13:16:03Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_175" name="p50" simulationType="fixed" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_175">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-25T11:16:58Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_177" name="p65" simulationType="fixed" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_177">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-25T11:17:11Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_179" name="IL17R" simulationType="reactions" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_179">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-04T13:20:54Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_181" name="IL17-IL17R" simulationType="reactions" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_181">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-01-17T10:49:06Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_183" name="pIFNg" simulationType="fixed" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_183">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-04T13:16:12Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_185" name="pIL21" simulationType="fixed" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_185">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-04T13:16:15Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_187" name="pIL17" simulationType="fixed" compartment="Compartment_3">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_187">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-04T13:16:18Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </Metabolite>
    </ListOfMetabolites>
    <ListOfModelValues>
      <ModelValue key="ModelValue_0" name="Hill Coeficient" simulationType="fixed">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_0">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-25T11:26:39Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1" name="BActin" simulationType="fixed">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-12-13T11:42:17Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_2" name="FOXP3R" simulationType="assignment">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_2">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-12-13T11:40:46Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[acetylated FOXP3],Reference=Concentration&gt;/&lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[BActin],Reference=InitialValue&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_3" name="IL17R" simulationType="assignment">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_3">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-12-13T11:41:49Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL17],Reference=Concentration&gt;/&lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[BActin],Reference=InitialValue&gt;
        </Expression>
      </ModelValue>
    </ListOfModelValues>
    <ListOfReactions>
      <Reaction key="Reaction_0" name="re2" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_0">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-19T11:07:16Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_21" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_89" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_87" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_159" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4816" name="Vf" value="0.1"/>
          <Constant key="Parameter_4817" name="K" value="0.138094"/>
          <Constant key="Parameter_4818" name="n" value="0.1"/>
          <Constant key="Parameter_4819" name="Vr" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_40">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_264">
              <SourceParameter reference="Parameter_4816"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_254">
              <SourceParameter reference="Metabolite_21"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_258">
              <SourceParameter reference="Metabolite_89"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_266">
              <SourceParameter reference="Parameter_4817"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_268">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_270">
              <SourceParameter reference="Metabolite_159"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_272">
              <SourceParameter reference="Parameter_4819"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_274">
              <SourceParameter reference="Metabolite_87"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1" name="re3" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-19T11:31:54Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_107" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_109" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_87" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4820" name="Vf" value="0.1"/>
          <Constant key="Parameter_4821" name="K" value="2.01676"/>
          <Constant key="Parameter_4822" name="Vr" value="0.1"/>
          <Constant key="Parameter_4823" name="n" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_41">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_275">
              <SourceParameter reference="Parameter_4820"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_271">
              <SourceParameter reference="Metabolite_107"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_267">
              <SourceParameter reference="Metabolite_87"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_246">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_276">
              <SourceParameter reference="Parameter_4821"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_278">
              <SourceParameter reference="Parameter_4822"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_280">
              <SourceParameter reference="Metabolite_109"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_2" name="re6" reversible="false" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_2">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-19T10:59:27Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_85" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_3" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4824" name="k1" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_13">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Parameter_4824"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_79">
              <SourceParameter reference="Metabolite_85"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_3" name="re8" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_3">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-19T11:37:46Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_3" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_83" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_81" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_159" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_165" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4825" name="Vf" value="0.1"/>
          <Constant key="Parameter_4826" name="K1" value="2.94611"/>
          <Constant key="Parameter_4827" name="K2" value="0.743847"/>
          <Constant key="Parameter_4828" name="Vr" value="0.1"/>
          <Constant key="Parameter_4829" name="n1" value="0.1"/>
          <Constant key="Parameter_4830" name="n2" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_42">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_281">
              <SourceParameter reference="Parameter_4825"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_277">
              <SourceParameter reference="Metabolite_3"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_265">
              <SourceParameter reference="Metabolite_83"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_273">
              <SourceParameter reference="Parameter_4826"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_283">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_285">
              <SourceParameter reference="Metabolite_159"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_287">
              <SourceParameter reference="Parameter_4827"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_289">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_291">
              <SourceParameter reference="Metabolite_165"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_293">
              <SourceParameter reference="Parameter_4828"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_295">
              <SourceParameter reference="Metabolite_81"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_4" name="re9" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_4">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-22T09:42:07Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_175" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_177" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_111" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_165" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_169" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_109" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4831" name="Vf" value="0.1"/>
          <Constant key="Parameter_4832" name="K1" value="0.1"/>
          <Constant key="Parameter_4833" name="K2" value="98.9482"/>
          <Constant key="Parameter_4834" name="K3" value="0.0539426"/>
          <Constant key="Parameter_4835" name="Vr" value="0.1"/>
          <Constant key="Parameter_4836" name="n1" value="0.1"/>
          <Constant key="Parameter_4837" name="n2" value="0.1"/>
          <Constant key="Parameter_4838" name="n3" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_43">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_296">
              <SourceParameter reference="Parameter_4831"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_284">
              <SourceParameter reference="Parameter_4832"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_269">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_279">
              <SourceParameter reference="Metabolite_165"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_298">
              <SourceParameter reference="Parameter_4833"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_300">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_302">
              <SourceParameter reference="Metabolite_169"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_304">
              <SourceParameter reference="Metabolite_109"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_306">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_308">
              <SourceParameter reference="Parameter_4834"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_310">
              <SourceParameter reference="Parameter_4835"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_312">
              <SourceParameter reference="Metabolite_111"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_292">
              <SourceParameter reference="Metabolite_175"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_288">
              <SourceParameter reference="Metabolite_177"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_5" name="re10" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_5">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-19T10:58:00Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_113" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_115" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_95" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_157" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_81" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_101" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4839" name="Vf" value="0.1"/>
          <Constant key="Parameter_4840" name="K1" value="0.125481"/>
          <Constant key="Parameter_4841" name="K2" value="0.896854"/>
          <Constant key="Parameter_4842" name="K3" value="0.031433"/>
          <Constant key="Parameter_4843" name="K4" value="66.6168"/>
          <Constant key="Parameter_4846" name="Vr" value="0.1"/>
          <Constant key="Parameter_4845" name="n1" value="0.1"/>
          <Constant key="Parameter_4847" name="n2" value="0.1"/>
          <Constant key="Parameter_4844" name="n3" value="0.1"/>
          <Constant key="Parameter_4848" name="n4" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_51">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_420">
              <SourceParameter reference="Parameter_4839"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_392">
              <SourceParameter reference="Metabolite_113"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_376">
              <SourceParameter reference="Parameter_4840"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_399">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_407">
              <SourceParameter reference="Metabolite_95"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_415">
              <SourceParameter reference="Parameter_4841"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_422">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_424">
              <SourceParameter reference="Metabolite_157"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_426">
              <SourceParameter reference="Metabolite_81"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_428">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_430">
              <SourceParameter reference="Parameter_4842"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_432">
              <SourceParameter reference="Metabolite_101"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_434">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_436">
              <SourceParameter reference="Parameter_4843"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_438">
              <SourceParameter reference="Parameter_4846"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_440">
              <SourceParameter reference="Metabolite_115"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_6" name="re11" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_6">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-19T11:22:52Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_79" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_77" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_149" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4849" name="Vf" value="0.1"/>
          <Constant key="Parameter_4850" name="K" value="0.263953"/>
          <Constant key="Parameter_4851" name="Vr" value="0.1"/>
          <Constant key="Parameter_4852" name="n" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_40">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_264">
              <SourceParameter reference="Parameter_4849"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_254">
              <SourceParameter reference="Metabolite_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_258">
              <SourceParameter reference="Metabolite_79"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_266">
              <SourceParameter reference="Parameter_4850"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_268">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_270">
              <SourceParameter reference="Metabolite_149"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_272">
              <SourceParameter reference="Parameter_4851"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_274">
              <SourceParameter reference="Metabolite_77"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_7" name="re12" reversible="false" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_7">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-19T11:00:50Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_117" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4853" name="k1" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_13">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Parameter_4853"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_79">
              <SourceParameter reference="Metabolite_117"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_8" name="re13" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_8">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-22T10:41:42Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_123" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_125" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_165" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_95" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_77" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_121" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4854" name="Vf" value="0.1"/>
          <Constant key="Parameter_4855" name="K" value="0.1"/>
          <Constant key="Parameter_4856" name="n1" value="2"/>
          <Constant key="Parameter_4857" name="K1" value="5.04432"/>
          <Constant key="Parameter_4858" name="n2" value="2"/>
          <Constant key="Parameter_4859" name="K2" value="0.0705365"/>
          <Constant key="Parameter_4860" name="n3" value="2"/>
          <Constant key="Parameter_4861" name="K3" value="14.9778"/>
          <Constant key="Parameter_4862" name="Vr" value="0.1"/>
          <Constant key="Parameter_4863" name="n" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_44">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_313">
              <SourceParameter reference="Parameter_4854"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_309">
              <SourceParameter reference="Metabolite_123"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_305">
              <SourceParameter reference="Parameter_4855"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_301">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_297">
              <SourceParameter reference="Metabolite_165"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_282">
              <SourceParameter reference="Metabolite_95"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_290">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_314">
              <SourceParameter reference="Parameter_4857"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_316">
              <SourceParameter reference="Metabolite_77"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_318">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_320">
              <SourceParameter reference="Parameter_4859"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_322">
              <SourceParameter reference="Metabolite_121"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_324">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_326">
              <SourceParameter reference="Parameter_4861"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_328">
              <SourceParameter reference="Parameter_4862"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_330">
              <SourceParameter reference="Metabolite_125"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_9" name="re14" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_9">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-19T11:45:40Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_183" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_117" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_25" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_137" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_165" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_115" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_111" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_151" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4864" name="Vf" value="0.1"/>
          <Constant key="Parameter_4865" name="K1" value="0.501917"/>
          <Constant key="Parameter_4871" name="n1" value="0.1"/>
          <Constant key="Parameter_4870" name="K2" value="0.812366"/>
          <Constant key="Parameter_4869" name="n2" value="0.1"/>
          <Constant key="Parameter_4866" name="n3" value="0.1"/>
          <Constant key="Parameter_4867" name="K3" value="0.1"/>
          <Constant key="Parameter_4868" name="n4" value="0.1"/>
          <Constant key="Parameter_4872" name="K4" value="0.001477"/>
          <Constant key="Parameter_4873" name="n5" value="0.1"/>
          <Constant key="Parameter_4876" name="K5" value="100"/>
          <Constant key="Parameter_4875" name="Vr" value="0.1"/>
          <Constant key="Parameter_4874" name="n6" value="0.1"/>
          <Constant key="Parameter_4877" name="K6" value="0.230841"/>
        </ListOfConstants>
        <KineticLaw function="Function_45">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_331">
              <SourceParameter reference="Parameter_4864"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_327">
              <SourceParameter reference="Metabolite_183"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_323">
              <SourceParameter reference="Parameter_4865"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_319">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_315">
              <SourceParameter reference="Metabolite_25"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_286">
              <SourceParameter reference="Parameter_4870"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_299">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_307">
              <SourceParameter reference="Metabolite_137"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_332">
              <SourceParameter reference="Parameter_4867"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_334">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_336">
              <SourceParameter reference="Metabolite_165"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_338">
              <SourceParameter reference="Metabolite_115"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_340">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_342">
              <SourceParameter reference="Parameter_4872"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_344">
              <SourceParameter reference="Metabolite_111"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_346">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_348">
              <SourceParameter reference="Parameter_4876"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_350">
              <SourceParameter reference="Metabolite_151"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_352">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_354">
              <SourceParameter reference="Parameter_4877"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_356">
              <SourceParameter reference="Parameter_4875"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_358">
              <SourceParameter reference="Metabolite_117"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_10" name="re15" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_10">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-22T11:27:03Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_153" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_151" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_59" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_137" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_115" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_125" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_151" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4878" name="Vf" value="0.1"/>
          <Constant key="Parameter_4879" name="K1" value="0.916783"/>
          <Constant key="Parameter_4880" name="K2" value="1.33537"/>
          <Constant key="Parameter_4881" name="K3" value="3.58849"/>
          <Constant key="Parameter_4882" name="K4" value="0.727962"/>
          <Constant key="Parameter_4883" name="K5" value="6.97805"/>
          <Constant key="Parameter_4884" name="Vr" value="0.1"/>
          <Constant key="Parameter_4885" name="n1" value="2"/>
          <Constant key="Parameter_4886" name="n2" value="2"/>
          <Constant key="Parameter_4887" name="n3" value="2"/>
          <Constant key="Parameter_4888" name="n4" value="2"/>
          <Constant key="Parameter_4889" name="n5" value="2"/>
        </ListOfConstants>
        <KineticLaw function="Function_52">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_441">
              <SourceParameter reference="Parameter_4878"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_437">
              <SourceParameter reference="Metabolite_153"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_433">
              <SourceParameter reference="Parameter_4879"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_429">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_425">
              <SourceParameter reference="Metabolite_59"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_421">
              <SourceParameter reference="Parameter_4880"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_403">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_384">
              <SourceParameter reference="Metabolite_137"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_442">
              <SourceParameter reference="Metabolite_115"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_444">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_446">
              <SourceParameter reference="Parameter_4881"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_448">
              <SourceParameter reference="Metabolite_125"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_450">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_452">
              <SourceParameter reference="Parameter_4882"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_454">
              <SourceParameter reference="Metabolite_151"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_456">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_458">
              <SourceParameter reference="Parameter_4883"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_460">
              <SourceParameter reference="Parameter_4884"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_462">
              <SourceParameter reference="Metabolite_151"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_11" name="re16" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_11">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-19T11:24:16Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_119" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_121" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_165" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_149" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_77" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4890" name="Vf" value="0.1"/>
          <Constant key="Parameter_4891" name="K1" value="0.1"/>
          <Constant key="Parameter_4892" name="K2" value="0.004433"/>
          <Constant key="Parameter_4915" name="n2" value="0.1"/>
          <Constant key="Parameter_4916" name="K3" value="99.987"/>
          <Constant key="Parameter_4917" name="Vr" value="0.1"/>
          <Constant key="Parameter_4918" name="n1" value="0.1"/>
          <Constant key="Parameter_4919" name="n3" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_46">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_359">
              <SourceParameter reference="Parameter_4890"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_355">
              <SourceParameter reference="Metabolite_119"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_351">
              <SourceParameter reference="Parameter_4891"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_347">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_343">
              <SourceParameter reference="Metabolite_165"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_339">
              <SourceParameter reference="Parameter_4892"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_335">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_311">
              <SourceParameter reference="Metabolite_149"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_262">
              <SourceParameter reference="Metabolite_77"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_317">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_325">
              <SourceParameter reference="Parameter_4916"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_360">
              <SourceParameter reference="Parameter_4917"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_362">
              <SourceParameter reference="Metabolite_121"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_12" name="re17" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_12">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-22T14:49:48Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_147" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_149" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_125" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_151" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4920" name="Vf" value="0.1"/>
          <Constant key="Parameter_4921" name="K1" value="7.83763"/>
          <Constant key="Parameter_4922" name="K2" value="0.667462"/>
          <Constant key="Parameter_4923" name="Vr" value="0.1"/>
          <Constant key="Parameter_4924" name="n1" value="0.1"/>
          <Constant key="Parameter_4925" name="n2" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_47">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_363">
              <SourceParameter reference="Parameter_4920"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_329">
              <SourceParameter reference="Metabolite_147"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_294">
              <SourceParameter reference="Metabolite_125"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_333">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_341">
              <SourceParameter reference="Parameter_4921"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_349">
              <SourceParameter reference="Metabolite_151"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_357">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_365">
              <SourceParameter reference="Parameter_4922"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_367">
              <SourceParameter reference="Parameter_4923"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_369">
              <SourceParameter reference="Metabolite_149"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_13" name="re18" reversible="false" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_13">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-19T11:03:58Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_75" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_9" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4926" name="k1" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_13">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Parameter_4926"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_79">
              <SourceParameter reference="Metabolite_75"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_14" name="re19" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_14">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-19T11:21:55Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_9" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_73" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_71" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_149" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4927" name="Vf" value="0.1"/>
          <Constant key="Parameter_4928" name="K" value="13.0657"/>
          <Constant key="Parameter_4929" name="Vr" value="0.1"/>
          <Constant key="Parameter_4804" name="n" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_40">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_264">
              <SourceParameter reference="Parameter_4927"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_254">
              <SourceParameter reference="Metabolite_9"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_258">
              <SourceParameter reference="Metabolite_73"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_266">
              <SourceParameter reference="Parameter_4928"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_268">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_270">
              <SourceParameter reference="Metabolite_149"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_272">
              <SourceParameter reference="Parameter_4929"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_274">
              <SourceParameter reference="Metabolite_71"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_15" name="re20" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_15">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-22T14:52:53Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_27" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_75" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_125" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_23" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_75" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_157" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_141" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4805" name="Vf" value="0.1"/>
          <Constant key="Parameter_4806" name="n1" value="2"/>
          <Constant key="Parameter_4807" name="K1" value="0.210399"/>
          <Constant key="Parameter_4808" name="n2" value="2"/>
          <Constant key="Parameter_4809" name="K2" value="56.3452"/>
          <Constant key="Parameter_4810" name="n3" value="2"/>
          <Constant key="Parameter_4811" name="K3" value="98.0373"/>
          <Constant key="Parameter_4812" name="Vr" value="0.1"/>
          <Constant key="Parameter_4813" name="n4" value="2"/>
          <Constant key="Parameter_4814" name="K4" value="0.21"/>
          <Constant key="Parameter_4930" name="n5" value="2"/>
          <Constant key="Parameter_4931" name="K5" value="4.32731"/>
        </ListOfConstants>
        <KineticLaw function="Function_52">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_441">
              <SourceParameter reference="Parameter_4805"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_437">
              <SourceParameter reference="Metabolite_27"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_433">
              <SourceParameter reference="Parameter_4807"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_429">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_425">
              <SourceParameter reference="Metabolite_125"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_421">
              <SourceParameter reference="Parameter_4809"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_403">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_384">
              <SourceParameter reference="Metabolite_23"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_442">
              <SourceParameter reference="Metabolite_75"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_444">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_446">
              <SourceParameter reference="Parameter_4811"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_448">
              <SourceParameter reference="Metabolite_157"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_450">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_452">
              <SourceParameter reference="Parameter_4814"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_454">
              <SourceParameter reference="Metabolite_141"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_456">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_458">
              <SourceParameter reference="Parameter_4931"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_460">
              <SourceParameter reference="Parameter_4812"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_462">
              <SourceParameter reference="Metabolite_75"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_16" name="re23" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_16">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-22T14:55:16Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_155" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_157" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_151" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_137" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_59" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_159" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_165" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4697" name="Vf" value="0.1"/>
          <Constant key="Parameter_4696" name="K1" value="0.199351"/>
          <Constant key="Parameter_4695" name="K2" value="9.61521"/>
          <Constant key="Parameter_4694" name="K3" value="0.214012"/>
          <Constant key="Parameter_4693" name="K4" value="0.321065"/>
          <Constant key="Parameter_4692" name="K5" value="0.1"/>
          <Constant key="Parameter_4691" name="Vr" value="0.1"/>
          <Constant key="Parameter_4690" name="n1" value="0.1"/>
          <Constant key="Parameter_4689" name="n2" value="0.1"/>
          <Constant key="Parameter_4688" name="n3" value="0.1"/>
          <Constant key="Parameter_4687" name="n4" value="0.1"/>
          <Constant key="Parameter_4686" name="n5" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_48">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_370">
              <SourceParameter reference="Parameter_4697"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_366">
              <SourceParameter reference="Metabolite_155"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_353">
              <SourceParameter reference="Parameter_4696"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_337">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_321">
              <SourceParameter reference="Metabolite_151"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_371">
              <SourceParameter reference="Parameter_4695"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_373">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_375">
              <SourceParameter reference="Metabolite_137"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_377">
              <SourceParameter reference="Parameter_4694"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_379">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_381">
              <SourceParameter reference="Metabolite_59"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_383">
              <SourceParameter reference="Metabolite_159"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_385">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_387">
              <SourceParameter reference="Parameter_4693"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_389">
              <SourceParameter reference="Metabolite_165"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_391">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_393">
              <SourceParameter reference="Parameter_4692"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_395">
              <SourceParameter reference="Parameter_4691"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_397">
              <SourceParameter reference="Metabolite_157"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_17" name="re24" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_17">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-19T11:27:40Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_161" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_159" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_77" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_71" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4685" name="Vf" value="0.1"/>
          <Constant key="Parameter_4684" name="K" value="0.1"/>
          <Constant key="Parameter_4683" name="Vr" value="0.1"/>
          <Constant key="Parameter_4682" name="n" value="0.1"/>
          <Constant key="Parameter_4681" name="n1" value="0.004304"/>
          <Constant key="Parameter_4680" name="K1" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_53">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_463">
              <SourceParameter reference="Parameter_4685"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_459">
              <SourceParameter reference="Metabolite_161"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_455">
              <SourceParameter reference="Parameter_4684"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_451">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_447">
              <SourceParameter reference="Metabolite_77"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_443">
              <SourceParameter reference="Metabolite_71"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_303">
              <SourceParameter reference="Parameter_4681"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_423">
              <SourceParameter reference="Parameter_4680"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_431">
              <SourceParameter reference="Parameter_4683"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_439">
              <SourceParameter reference="Metabolite_159"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_18" name="re25" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_18">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-22T15:42:51Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_13" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_67" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_65" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4679" name="k1" value="0.1"/>
          <Constant key="Parameter_4678" name="k2" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_14">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_62">
              <SourceParameter reference="Parameter_4679"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_39">
              <SourceParameter reference="Metabolite_13"/>
              <SourceParameter reference="Metabolite_67"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_67">
              <SourceParameter reference="Parameter_4678"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_71">
              <SourceParameter reference="Metabolite_65"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_19" name="re26" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_19">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-19T11:31:32Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_143" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_141" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_65" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4677" name="Vf" value="0.1"/>
          <Constant key="Parameter_4676" name="K" value="0.374591"/>
          <Constant key="Parameter_4675" name="Vr" value="0.1"/>
          <Constant key="Parameter_4674" name="n" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_41">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_275">
              <SourceParameter reference="Parameter_4677"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_271">
              <SourceParameter reference="Metabolite_143"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_267">
              <SourceParameter reference="Metabolite_65"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_246">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_276">
              <SourceParameter reference="Parameter_4676"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_278">
              <SourceParameter reference="Parameter_4675"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_280">
              <SourceParameter reference="Metabolite_141"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_20" name="re27" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_20">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-22T15:48:48Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_145" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_169" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_157" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_137" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_53" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_125" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_59" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_141" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_165" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4673" name="Vf" value="0.1"/>
          <Constant key="Parameter_4672" name="K1" value="0.358755"/>
          <Constant key="Parameter_4671" name="K2" value="0.354892"/>
          <Constant key="Parameter_4670" name="K3" value="1.31281"/>
          <Constant key="Parameter_4669" name="K4" value="0.01"/>
          <Constant key="Parameter_4668" name="K5" value="0.000679025"/>
          <Constant key="Parameter_4667" name="K6" value="0.00011324"/>
          <Constant key="Parameter_4666" name="K7" value="1.93254e-07"/>
          <Constant key="Parameter_4665" name="Vr" value="0.1"/>
          <Constant key="Parameter_4664" name="n1" value="2"/>
          <Constant key="Parameter_4663" name="n2" value="2"/>
          <Constant key="Parameter_4662" name="n3" value="2"/>
          <Constant key="Parameter_4661" name="n4" value="2"/>
          <Constant key="Parameter_4660" name="n5" value="2"/>
        </ListOfConstants>
        <KineticLaw function="Function_55">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_461">
              <SourceParameter reference="Parameter_4673"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_445">
              <SourceParameter reference="Metabolite_145"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_435">
              <SourceParameter reference="Parameter_4672"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_466">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_468">
              <SourceParameter reference="Metabolite_157"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_470">
              <SourceParameter reference="Parameter_4671"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_472">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_474">
              <SourceParameter reference="Metabolite_137"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_476">
              <SourceParameter reference="Parameter_4670"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_478">
              <SourceParameter reference="Metabolite_53"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_480">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_482">
              <SourceParameter reference="Parameter_4669"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_484">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_486">
              <SourceParameter reference="Metabolite_125"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_488">
              <SourceParameter reference="Metabolite_59"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_492">
              <SourceParameter reference="Metabolite_141"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_496">
              <SourceParameter reference="Metabolite_165"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_498">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_490">
              <SourceParameter reference="Parameter_4668"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_502">
              <SourceParameter reference="Parameter_4665"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_504">
              <SourceParameter reference="Metabolite_169"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_494">
              <SourceParameter reference="Parameter_4667"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_500">
              <SourceParameter reference="Parameter_4666"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_21" name="re28" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_21">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-22T16:07:08Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_11" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_61" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_59" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4659" name="k1" value="0.1"/>
          <Constant key="Parameter_4658" name="k2" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_14">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_62">
              <SourceParameter reference="Parameter_4659"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_39">
              <SourceParameter reference="Metabolite_11"/>
              <SourceParameter reference="Metabolite_61"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_67">
              <SourceParameter reference="Parameter_4658"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_71">
              <SourceParameter reference="Metabolite_59"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_22" name="re29" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_22">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-22T16:07:33Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_15" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_55" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_53" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4657" name="k1" value="0.1"/>
          <Constant key="Parameter_4656" name="k2" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_14">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_62">
              <SourceParameter reference="Parameter_4657"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_39">
              <SourceParameter reference="Metabolite_15"/>
              <SourceParameter reference="Metabolite_55"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_67">
              <SourceParameter reference="Parameter_4656"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_71">
              <SourceParameter reference="Metabolite_53"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_23" name="re30" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_23">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-22T16:08:29Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_139" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_137" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_165" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_95" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_101" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_105" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_53" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4655" name="Vf" value="0.1"/>
          <Constant key="Parameter_4654" name="K" value="0.1"/>
          <Constant key="Parameter_4653" name="K1" value="0.636796"/>
          <Constant key="Parameter_4652" name="K2" value="39.018"/>
          <Constant key="Parameter_4651" name="K3" value="2.26986"/>
          <Constant key="Parameter_4650" name="K4" value="0.137545"/>
          <Constant key="Parameter_4649" name="Vr" value="0.1"/>
          <Constant key="Parameter_4648" name="n" value="0.1"/>
          <Constant key="Parameter_4647" name="n1" value="0.1"/>
          <Constant key="Parameter_4646" name="n2" value="0.1"/>
          <Constant key="Parameter_4645" name="n3" value="0.1"/>
          <Constant key="Parameter_4644" name="n4" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_49">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_398">
              <SourceParameter reference="Parameter_4655"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_394">
              <SourceParameter reference="Metabolite_139"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_390">
              <SourceParameter reference="Parameter_4654"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_386">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_382">
              <SourceParameter reference="Metabolite_165"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_378">
              <SourceParameter reference="Metabolite_95"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_374">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_361">
              <SourceParameter reference="Parameter_4653"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_345">
              <SourceParameter reference="Metabolite_101"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_368">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_400">
              <SourceParameter reference="Parameter_4652"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_402">
              <SourceParameter reference="Metabolite_105"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_404">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_406">
              <SourceParameter reference="Parameter_4651"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_408">
              <SourceParameter reference="Metabolite_53"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_410">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_412">
              <SourceParameter reference="Parameter_4650"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_414">
              <SourceParameter reference="Parameter_4649"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_416">
              <SourceParameter reference="Metabolite_137"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_24" name="re31" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_24">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-22T16:13:49Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_133" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_135" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_169" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_165" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_137" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_59" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4643" name="Vf" value="0.2249"/>
          <Constant key="Parameter_4642" name="K1" value="9722.09"/>
          <Constant key="Parameter_4641" name="K2" value="0.703778"/>
          <Constant key="Parameter_4640" name="Vr" value="0.1"/>
          <Constant key="Parameter_4639" name="n1" value="0.1"/>
          <Constant key="Parameter_4638" name="n2" value="0.1"/>
          <Constant key="Parameter_4637" name="n3" value="0.1"/>
          <Constant key="Parameter_4636" name="K3" value="1.24123"/>
          <Constant key="Parameter_4635" name="n4" value="0.1"/>
          <Constant key="Parameter_4634" name="K4" value="997.263"/>
        </ListOfConstants>
        <KineticLaw function="Function_51">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_420">
              <SourceParameter reference="Parameter_4643"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_392">
              <SourceParameter reference="Metabolite_133"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_376">
              <SourceParameter reference="Parameter_4642"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_399">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_407">
              <SourceParameter reference="Metabolite_169"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_415">
              <SourceParameter reference="Parameter_4641"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_422">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_424">
              <SourceParameter reference="Metabolite_165"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_426">
              <SourceParameter reference="Metabolite_137"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_428">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_430">
              <SourceParameter reference="Parameter_4636"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_432">
              <SourceParameter reference="Metabolite_59"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_434">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_436">
              <SourceParameter reference="Parameter_4634"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_438">
              <SourceParameter reference="Parameter_4640"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_440">
              <SourceParameter reference="Metabolite_135"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_25" name="re32" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_25">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-22T16:39:27Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_5" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_97" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_95" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_141" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_181" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4633" name="Vf" value="0.1"/>
          <Constant key="Parameter_4632" name="K" value="0.240705"/>
          <Constant key="Parameter_4631" name="K1" value="8.14189"/>
          <Constant key="Parameter_4630" name="Vr" value="0.1"/>
          <Constant key="Parameter_4629" name="n" value="0.1"/>
          <Constant key="Parameter_4628" name="n1" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_50">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_417">
              <SourceParameter reference="Parameter_4633"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_413">
              <SourceParameter reference="Metabolite_5"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_409">
              <SourceParameter reference="Metabolite_97"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_405">
              <SourceParameter reference="Parameter_4632"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_401">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_364">
              <SourceParameter reference="Metabolite_141"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_372">
              <SourceParameter reference="Metabolite_181"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_380">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_388">
              <SourceParameter reference="Parameter_4631"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_396">
              <SourceParameter reference="Parameter_4630"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_419">
              <SourceParameter reference="Metabolite_95"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_26" name="re33" reversible="false" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_26">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-19T11:00:32Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_93" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_5" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4627" name="k1" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_13">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Parameter_4627"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_79">
              <SourceParameter reference="Metabolite_93"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_27" name="re34" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_27">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-19T11:03:33Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_7" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_127" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4626" name="k1" value="0.1"/>
          <Constant key="Parameter_4625" name="k2" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_14">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_62">
              <SourceParameter reference="Parameter_4626"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_39">
              <SourceParameter reference="Metabolite_7"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_67">
              <SourceParameter reference="Parameter_4625"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_71">
              <SourceParameter reference="Metabolite_127"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_28" name="re35" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_28">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-19T11:22:26Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_127" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_99" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_101" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_151" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4624" name="Vf" value="0.1"/>
          <Constant key="Parameter_4623" name="K" value="4.66107"/>
          <Constant key="Parameter_4622" name="Vr" value="0.1"/>
          <Constant key="Parameter_4621" name="n" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_40">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_264">
              <SourceParameter reference="Parameter_4624"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_254">
              <SourceParameter reference="Metabolite_127"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_258">
              <SourceParameter reference="Metabolite_99"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_266">
              <SourceParameter reference="Parameter_4623"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_268">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_270">
              <SourceParameter reference="Metabolite_151"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_272">
              <SourceParameter reference="Parameter_4622"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_274">
              <SourceParameter reference="Metabolite_101"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_29" name="re36" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_29">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-19T11:04:43Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_173" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_171" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_127" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_165" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_53" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4620" name="Vf" value="0.1"/>
          <Constant key="Parameter_4619" name="K" value="0.1"/>
          <Constant key="Parameter_4618" name="K1" value="25.5354"/>
          <Constant key="Parameter_4617" name="Vr" value="0.1"/>
          <Constant key="Parameter_4616" name="n" value="0.1"/>
          <Constant key="Parameter_4615" name="n1" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_50">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_417">
              <SourceParameter reference="Parameter_4620"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_413">
              <SourceParameter reference="Metabolite_173"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_409">
              <SourceParameter reference="Metabolite_171"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_405">
              <SourceParameter reference="Parameter_4619"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_401">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_364">
              <SourceParameter reference="Metabolite_165"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_372">
              <SourceParameter reference="Metabolite_53"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_380">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_388">
              <SourceParameter reference="Parameter_4618"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_396">
              <SourceParameter reference="Parameter_4617"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_419">
              <SourceParameter reference="Metabolite_127"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_30" name="re37" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_30">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-22T16:38:22Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_185" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_93" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_137" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4614" name="Vf" value="0.1"/>
          <Constant key="Parameter_4613" name="K" value="0.118892"/>
          <Constant key="Parameter_4612" name="Vr" value="0.1"/>
          <Constant key="Parameter_4611" name="n" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_41">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_275">
              <SourceParameter reference="Parameter_4614"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_271">
              <SourceParameter reference="Metabolite_185"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_267">
              <SourceParameter reference="Metabolite_137"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_246">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_276">
              <SourceParameter reference="Parameter_4613"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_278">
              <SourceParameter reference="Parameter_4612"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_280">
              <SourceParameter reference="Metabolite_93"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_31" name="re38" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_31">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-22T16:57:38Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_19" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_103" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_105" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4610" name="k1" value="0.1"/>
          <Constant key="Parameter_4609" name="k2" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_14">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_62">
              <SourceParameter reference="Parameter_4610"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_39">
              <SourceParameter reference="Metabolite_19"/>
              <SourceParameter reference="Metabolite_103"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_67">
              <SourceParameter reference="Parameter_4609"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_71">
              <SourceParameter reference="Metabolite_105"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_32" name="re42" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_32">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-22T17:01:32Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_163" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_167" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_165" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_77" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_71" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4608" name="Vf" value="0.1"/>
          <Constant key="Parameter_4607" name="K" value="0.1"/>
          <Constant key="Parameter_4606" name="K1" value="0.1"/>
          <Constant key="Parameter_4605" name="Vr" value="0.1"/>
          <Constant key="Parameter_4604" name="n" value="0.1"/>
          <Constant key="Parameter_4603" name="n1" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_50">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_417">
              <SourceParameter reference="Parameter_4608"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_413">
              <SourceParameter reference="Metabolite_163"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_409">
              <SourceParameter reference="Metabolite_167"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_405">
              <SourceParameter reference="Parameter_4607"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_401">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_364">
              <SourceParameter reference="Metabolite_77"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_372">
              <SourceParameter reference="Metabolite_71"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_380">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_388">
              <SourceParameter reference="Parameter_4606"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_396">
              <SourceParameter reference="Parameter_4605"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_419">
              <SourceParameter reference="Metabolite_165"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_33" name="re44" reversible="false" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_33">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-19T11:04:08Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_63" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_11" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4602" name="k1" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_13">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Parameter_4602"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_79">
              <SourceParameter reference="Metabolite_63"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_34" name="re45" reversible="false" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_34">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-19T11:00:17Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_69" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_13" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4601" name="k1" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_13">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Parameter_4601"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_79">
              <SourceParameter reference="Metabolite_69"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_35" name="re46" reversible="false" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_35">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-19T11:04:02Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_57" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_15" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4600" name="k1" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_13">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Parameter_4600"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_79">
              <SourceParameter reference="Metabolite_57"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_36" name="re48" reversible="false" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_36">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-05T11:53:11Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_131" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_19" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4599" name="k1" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_13">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Parameter_4599"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_79">
              <SourceParameter reference="Metabolite_131"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_37" name="re49" reversible="false" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_37">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-05T11:53:12Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_129" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_17" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4598" name="k1" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_13">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Parameter_4598"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_79">
              <SourceParameter reference="Metabolite_129"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_38" name="re50" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_38">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-02-22T17:00:10Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_17" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_179" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_181" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4597" name="k1" value="0.184881"/>
          <Constant key="Parameter_4596" name="k2" value="0.1896"/>
        </ListOfConstants>
        <KineticLaw function="Function_14">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_62">
              <SourceParameter reference="Parameter_4597"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_39">
              <SourceParameter reference="Metabolite_17"/>
              <SourceParameter reference="Metabolite_179"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_67">
              <SourceParameter reference="Parameter_4596"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_71">
              <SourceParameter reference="Metabolite_181"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_39" name="re47" reversible="false" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_39">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2010-05-04T12:34:41Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_91" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_21" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4595" name="k1" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_13">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Parameter_4595"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_79">
              <SourceParameter reference="Metabolite_91"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_40" name="re51" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_40">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2011-01-21T13:58:19Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_187" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_129" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_165" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_101" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_135" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_115" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4594" name="Vf" value="0.225095"/>
          <Constant key="Parameter_4593" name="n" value="0.1"/>
          <Constant key="Parameter_4592" name="K" value="0.1"/>
          <Constant key="Parameter_4591" name="Vr" value="0.1"/>
          <Constant key="Parameter_4590" name="n1" value="0.1"/>
          <Constant key="Parameter_4589" name="K1" value="1.62893"/>
          <Constant key="Parameter_4588" name="n2" value="0.1"/>
          <Constant key="Parameter_4587" name="K2" value="0.526832"/>
          <Constant key="Parameter_4586" name="n3" value="0.1"/>
          <Constant key="Parameter_4585" name="K3" value="5.47889"/>
        </ListOfConstants>
        <KineticLaw function="Function_44">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_313">
              <SourceParameter reference="Parameter_4594"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_309">
              <SourceParameter reference="Metabolite_187"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_305">
              <SourceParameter reference="Parameter_4592"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_301">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_297">
              <SourceParameter reference="Metabolite_165"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_282">
              <SourceParameter reference="Metabolite_101"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_290">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_314">
              <SourceParameter reference="Parameter_4589"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_316">
              <SourceParameter reference="Metabolite_135"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_318">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_320">
              <SourceParameter reference="Parameter_4587"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_322">
              <SourceParameter reference="Metabolite_115"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_324">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_326">
              <SourceParameter reference="Parameter_4585"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_328">
              <SourceParameter reference="Parameter_4591"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_330">
              <SourceParameter reference="Metabolite_129"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_41" name="IL18 pool" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_41">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-01-17T10:13:46Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_29" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_21" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4584" name="V" value="0.1"/>
          <Constant key="Parameter_4583" name="n" value="0.1"/>
          <Constant key="Parameter_4582" name="k" value="0.5"/>
        </ListOfConstants>
        <KineticLaw function="Function_54">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_464">
              <SourceParameter reference="Parameter_4584"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_427">
              <SourceParameter reference="Metabolite_29"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_418">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_449">
              <SourceParameter reference="Metabolite_21"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_457">
              <SourceParameter reference="Parameter_4582"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_42" name="IL12 pool" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_42">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-01-17T10:15:57Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_31" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_3" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4581" name="V" value="0.1"/>
          <Constant key="Parameter_4580" name="n" value="0.1"/>
          <Constant key="Parameter_4579" name="k" value="0.5"/>
        </ListOfConstants>
        <KineticLaw function="Function_54">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_464">
              <SourceParameter reference="Parameter_4581"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_427">
              <SourceParameter reference="Metabolite_31"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_418">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_449">
              <SourceParameter reference="Metabolite_3"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_457">
              <SourceParameter reference="Parameter_4579"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_43" name="IFNg pool" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_43">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-01-17T10:18:51Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_33" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4578" name="V" value="0.1"/>
          <Constant key="Parameter_4577" name="n" value="2"/>
          <Constant key="Parameter_4576" name="k" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_54">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_464">
              <SourceParameter reference="Parameter_4578"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_427">
              <SourceParameter reference="Metabolite_33"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_418">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_449">
              <SourceParameter reference="Metabolite_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_457">
              <SourceParameter reference="Parameter_4576"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_44" name="IL21 pool" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_44">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-01-17T10:21:26Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_35" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_5" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4575" name="V" value="0.1"/>
          <Constant key="Parameter_4574" name="n" value="0.1"/>
          <Constant key="Parameter_4573" name="k" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_54">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_464">
              <SourceParameter reference="Parameter_4575"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_427">
              <SourceParameter reference="Metabolite_35"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_418">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_449">
              <SourceParameter reference="Metabolite_5"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_457">
              <SourceParameter reference="Parameter_4573"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_45" name="IL23 pool" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_45">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-01-17T10:21:24Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_37" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_7" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4572" name="V" value="0.1"/>
          <Constant key="Parameter_4571" name="n" value="0.1"/>
          <Constant key="Parameter_4570" name="k" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_54">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_464">
              <SourceParameter reference="Parameter_4572"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_427">
              <SourceParameter reference="Metabolite_37"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_418">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_449">
              <SourceParameter reference="Metabolite_7"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_457">
              <SourceParameter reference="Parameter_4570"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_46" name="IL17 pool" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_46">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-01-17T10:34:45Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_39" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_129" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4569" name="V" value="0.1"/>
          <Constant key="Parameter_4568" name="n" value="2"/>
          <Constant key="Parameter_4567" name="k" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_54">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_464">
              <SourceParameter reference="Parameter_4569"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_427">
              <SourceParameter reference="Metabolite_39"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_418">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_449">
              <SourceParameter reference="Metabolite_129"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_457">
              <SourceParameter reference="Parameter_4567"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_47" name="IL10 pool" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_47">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-01-17T10:36:48Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_41" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_19" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4566" name="V" value="0.1"/>
          <Constant key="Parameter_4565" name="n" value="0.1"/>
          <Constant key="Parameter_4564" name="k" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_54">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_464">
              <SourceParameter reference="Parameter_4566"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_427">
              <SourceParameter reference="Metabolite_41"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_418">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_449">
              <SourceParameter reference="Metabolite_19"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_457">
              <SourceParameter reference="Parameter_4564"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_48" name="IL6 pool" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_48">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-01-17T10:39:52Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_43" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_15" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4563" name="V" value="0.1"/>
          <Constant key="Parameter_4562" name="n" value="2"/>
          <Constant key="Parameter_4561" name="k" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_54">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_464">
              <SourceParameter reference="Parameter_4563"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_427">
              <SourceParameter reference="Metabolite_43"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_418">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_449">
              <SourceParameter reference="Metabolite_15"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_457">
              <SourceParameter reference="Parameter_4561"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_49" name="IL2 pool" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_49">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-01-17T10:41:25Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_45" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_13" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4560" name="V" value="0.1"/>
          <Constant key="Parameter_4559" name="n" value="0.1"/>
          <Constant key="Parameter_4558" name="k" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_54">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_464">
              <SourceParameter reference="Parameter_4560"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_427">
              <SourceParameter reference="Metabolite_45"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_418">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_449">
              <SourceParameter reference="Metabolite_13"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_457">
              <SourceParameter reference="Parameter_4558"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_50" name="TGFb pool" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_50">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-01-17T10:42:31Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_47" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_11" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4557" name="V" value="0.1"/>
          <Constant key="Parameter_4556" name="n" value="0.1"/>
          <Constant key="Parameter_4555" name="k" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_54">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_464">
              <SourceParameter reference="Parameter_4557"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_427">
              <SourceParameter reference="Metabolite_47"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_418">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_449">
              <SourceParameter reference="Metabolite_11"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_457">
              <SourceParameter reference="Parameter_4555"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_51" name="IL4 pool" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_51">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-01-17T10:43:50Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_49" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_9" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4554" name="V" value="0.1"/>
          <Constant key="Parameter_4553" name="n" value="0.1"/>
          <Constant key="Parameter_4552" name="k" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_54">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_464">
              <SourceParameter reference="Parameter_4554"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_427">
              <SourceParameter reference="Metabolite_49"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_418">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_449">
              <SourceParameter reference="Metabolite_9"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_457">
              <SourceParameter reference="Parameter_4552"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_52" name="re52" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_52">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-02-18T11:35:22Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_51" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_131" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_101" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_165" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_95" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_157" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_141" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4551" name="Vf" value="0.1"/>
          <Constant key="Parameter_4550" name="K" value="0.508159"/>
          <Constant key="Parameter_4549" name="n" value="0.1"/>
          <Constant key="Parameter_4548" name="n1" value="0.1"/>
          <Constant key="Parameter_4547" name="K1" value="0.1"/>
          <Constant key="Parameter_4546" name="n2" value="0.1"/>
          <Constant key="Parameter_4545" name="K2" value="0.00125893"/>
          <Constant key="Parameter_4544" name="n3" value="0.1"/>
          <Constant key="Parameter_4543" name="K3" value="0.645162"/>
          <Constant key="Parameter_4542" name="n4" value="0.1"/>
          <Constant key="Parameter_4541" name="K4" value="100"/>
          <Constant key="Parameter_4540" name="Vr" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_49">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_398">
              <SourceParameter reference="Parameter_4551"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_394">
              <SourceParameter reference="Metabolite_51"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_390">
              <SourceParameter reference="Parameter_4550"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_386">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_382">
              <SourceParameter reference="Metabolite_101"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_378">
              <SourceParameter reference="Metabolite_165"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_374">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_361">
              <SourceParameter reference="Parameter_4547"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_345">
              <SourceParameter reference="Metabolite_95"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_368">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_400">
              <SourceParameter reference="Parameter_4545"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_402">
              <SourceParameter reference="Metabolite_157"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_404">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_406">
              <SourceParameter reference="Parameter_4543"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_408">
              <SourceParameter reference="Metabolite_141"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_410">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_412">
              <SourceParameter reference="Parameter_4541"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_414">
              <SourceParameter reference="Parameter_4540"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_416">
              <SourceParameter reference="Metabolite_131"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
    </ListOfReactions>
    <ListOfModelParameterSets activeSet="ModelParameterSet_0">
      <ModelParameterSet key="ModelParameterSet_0" name="Initial State">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default]" value="1" type="Compartment" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIFNg]" value="0" type="Species" simulationType="reactions">
            <InitialExpression>
              &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[IFNg_pool],Reference=InitialConcentration&gt;
            </InitialExpression>
          </ModelParameter>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL12]" value="0" type="Species" simulationType="reactions">
            <InitialExpression>
              &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[IL12_pool],Reference=InitialConcentration&gt;
            </InitialExpression>
          </ModelParameter>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL21]" value="0" type="Species" simulationType="reactions">
            <InitialExpression>
              &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[IL21_pool],Reference=InitialConcentration&gt;
            </InitialExpression>
          </ModelParameter>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL23]" value="0" type="Species" simulationType="reactions">
            <InitialExpression>
              &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[IL23_pool],Reference=InitialConcentration&gt;
            </InitialExpression>
          </ModelParameter>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL4]" value="0" type="Species" simulationType="reactions">
            <InitialExpression>
              &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[IL4_pool],Reference=InitialConcentration&gt;
            </InitialExpression>
          </ModelParameter>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eTGFb]" value="6.022141789999999e+23" type="Species" simulationType="reactions">
            <InitialExpression>
              &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[TGFb_pool],Reference=InitialConcentration&gt;
            </InitialExpression>
          </ModelParameter>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL2]" value="0" type="Species" simulationType="reactions">
            <InitialExpression>
              &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[IL2_pool],Reference=InitialConcentration&gt;
            </InitialExpression>
          </ModelParameter>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL6]" value="6.022141789999999e+23" type="Species" simulationType="reactions">
            <InitialExpression>
              &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[IL6_pool],Reference=InitialConcentration&gt;
            </InitialExpression>
          </ModelParameter>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL17]" value="0" type="Species" simulationType="reactions">
            <InitialExpression>
              &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[IL17_pool],Reference=InitialConcentration&gt;
            </InitialExpression>
          </ModelParameter>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL10]" value="0" type="Species" simulationType="reactions">
            <InitialExpression>
              &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[IL10_pool],Reference=InitialConcentration&gt;
            </InitialExpression>
          </ModelParameter>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL18]" value="0" type="Species" simulationType="reactions">
            <InitialExpression>
              &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[IL18_pool],Reference=InitialConcentration&gt;
            </InitialExpression>
          </ModelParameter>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[anti-IL4]" value="6.022141789999999e+23" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[anti-IFNg]" value="6.022141789999999e+23" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[pIL4]" value="6.022141789999999e+23" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[IL18_pool]" value="0" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[IL12_pool]" value="0" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[IFNg_pool]" value="0" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[IL21_pool]" value="0" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[IL23_pool]" value="0" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[IL17_pool]" value="0" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[IL10_pool]" value="0" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[IL6_pool]" value="6.022141789999999e+23" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[IL2_pool]" value="0" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[TGFb_pool]" value="6.022141789999999e+23" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[IL4_pool]" value="0" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[pIL10]" value="6.022141789999999e+23" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[dIFNg]" value="0" type="Species" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[dIL12]" value="0" type="Species" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[dIL21]" value="0" type="Species" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[dIL23]" value="0" type="Species" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[dIL4]" value="0" type="Species" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[dTGFb]" value="0" type="Species" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[dIL2]" value="0" type="Species" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[dIL6]" value="0" type="Species" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[dIL17]" value="0" type="Species" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[dIL10]" value="0" type="Species" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[dIL18]" value="0" type="Species" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL6-IL6R]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL6R]" value="6.022141499732765e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL6]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[TGFb-TGFbR]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[TGFbR]" value="6.022141500000001e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[TGFb]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL2-IL2R]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL2R]" value="6.022141500000001e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL2]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL4-IL4R]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL4R]" value="6.022141500000001e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL4]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IFNg-IFNgR]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IFNgR]" value="6.022141500000001e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL12-IL12R]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL12R]" value="6.022141500000001e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL12]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL18-IL18R]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL18R]" value="6.022141500000001e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL18]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL21]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL21-IL21R]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL21R]" value="6.022141500000001e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL23R]" value="6.022141500000001e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL23-IL23R]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL10R]" value="6.022141500000001e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL10-IL10R]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IRAK1]" value="3.011070895e+23" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IRAK1-P]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[p50/p65 dimer]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[STAT4]" value="6.022141500000001e+23" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[STAT4-P]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IFNg]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[JAK1]" value="3.011070895e+23" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[JAK1-P]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[STAT1]" value="6.022141500000001e+23" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[STAT1-P]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[p40/p19 dimer]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL17]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL10]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[RORgt]" value="6.022141500000001e+23" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[RORgt-ligand]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[STAT3-P]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[STAT3]" value="6.022141500000001e+23" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[STAT5-P]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[STAT5]" value="6.022141500000001e+23" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[FOXP3]" value="6.022141500000001e+23" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[SOCS1]" value="6.022141500000001e+23" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[SOCS1-JAKs]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[Tbet-P]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[Tbet]" value="6.022141500000001e+23" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[GATA3]" value="6.022141500000001e+23" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[GATA3-P]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[STAT6-P]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[STAT6]" value="6.022141789999999e+23" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[PPARg]" value="4.817713432e+22" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[L-PPARg]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[Ligand]" value="6.022141499732765e+23" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[acetylated FOXP3]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[p19]" value="6.022141499732765e+23" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[p40]" value="6.022141499732765e+23" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[p50]" value="3.011070895e+23" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[p65]" value="3.011070895e+23" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL17R]" value="6.022141499732765e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL17-IL17R]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[pIFNg]" value="6.022141499732765e+23" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[pIL21]" value="6.022141500000001e+23" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[pIL17]" value="6.022141500000001e+23" type="Species" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient]" value="2" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[BActin]" value="0.008506077810123313" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[FOXP3R]" value="0" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[IL17R]" value="0" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re2]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re2],ParameterGroup=Parameters,Parameter=Vf" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re2],ParameterGroup=Parameters,Parameter=K" value="0.138094" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re2],ParameterGroup=Parameters,Parameter=n" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re2],ParameterGroup=Parameters,Parameter=Vr" value="0.1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re3]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re3],ParameterGroup=Parameters,Parameter=Vf" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re3],ParameterGroup=Parameters,Parameter=K" value="2.01676" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re3],ParameterGroup=Parameters,Parameter=Vr" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re3],ParameterGroup=Parameters,Parameter=n" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re6]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re6],ParameterGroup=Parameters,Parameter=k1" value="0.1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re8]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re8],ParameterGroup=Parameters,Parameter=Vf" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re8],ParameterGroup=Parameters,Parameter=K1" value="2.94611" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re8],ParameterGroup=Parameters,Parameter=K2" value="0.743847" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re8],ParameterGroup=Parameters,Parameter=Vr" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re8],ParameterGroup=Parameters,Parameter=n1" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re8],ParameterGroup=Parameters,Parameter=n2" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re9]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re9],ParameterGroup=Parameters,Parameter=Vf" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re9],ParameterGroup=Parameters,Parameter=K1" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re9],ParameterGroup=Parameters,Parameter=K2" value="98.9482" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re9],ParameterGroup=Parameters,Parameter=K3" value="0.0539426" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re9],ParameterGroup=Parameters,Parameter=Vr" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re9],ParameterGroup=Parameters,Parameter=n1" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re9],ParameterGroup=Parameters,Parameter=n2" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re9],ParameterGroup=Parameters,Parameter=n3" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re10]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re10],ParameterGroup=Parameters,Parameter=Vf" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re10],ParameterGroup=Parameters,Parameter=K1" value="0.125481" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re10],ParameterGroup=Parameters,Parameter=K2" value="0.896854" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re10],ParameterGroup=Parameters,Parameter=K3" value="0.031433" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re10],ParameterGroup=Parameters,Parameter=K4" value="66.6168" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re10],ParameterGroup=Parameters,Parameter=Vr" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re10],ParameterGroup=Parameters,Parameter=n1" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re10],ParameterGroup=Parameters,Parameter=n2" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re10],ParameterGroup=Parameters,Parameter=n3" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re10],ParameterGroup=Parameters,Parameter=n4" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re11]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re11],ParameterGroup=Parameters,Parameter=Vf" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re11],ParameterGroup=Parameters,Parameter=K" value="0.263953" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re11],ParameterGroup=Parameters,Parameter=Vr" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re11],ParameterGroup=Parameters,Parameter=n" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re12]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re12],ParameterGroup=Parameters,Parameter=k1" value="0.1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re13]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re13],ParameterGroup=Parameters,Parameter=Vf" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re13],ParameterGroup=Parameters,Parameter=K" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re13],ParameterGroup=Parameters,Parameter=n1" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re13],ParameterGroup=Parameters,Parameter=K1" value="5.04432" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re13],ParameterGroup=Parameters,Parameter=n2" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re13],ParameterGroup=Parameters,Parameter=K2" value="0.0705365" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re13],ParameterGroup=Parameters,Parameter=n3" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re13],ParameterGroup=Parameters,Parameter=K3" value="14.9778" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re13],ParameterGroup=Parameters,Parameter=Vr" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re13],ParameterGroup=Parameters,Parameter=n" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re14]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re14],ParameterGroup=Parameters,Parameter=Vf" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re14],ParameterGroup=Parameters,Parameter=K1" value="0.5019169999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re14],ParameterGroup=Parameters,Parameter=n1" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re14],ParameterGroup=Parameters,Parameter=K2" value="0.812366" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re14],ParameterGroup=Parameters,Parameter=n2" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re14],ParameterGroup=Parameters,Parameter=n3" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re14],ParameterGroup=Parameters,Parameter=K3" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re14],ParameterGroup=Parameters,Parameter=n4" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re14],ParameterGroup=Parameters,Parameter=K4" value="0.001477" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re14],ParameterGroup=Parameters,Parameter=n5" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re14],ParameterGroup=Parameters,Parameter=K5" value="100" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re14],ParameterGroup=Parameters,Parameter=Vr" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re14],ParameterGroup=Parameters,Parameter=n6" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re14],ParameterGroup=Parameters,Parameter=K6" value="0.230841" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re15]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re15],ParameterGroup=Parameters,Parameter=Vf" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re15],ParameterGroup=Parameters,Parameter=K1" value="0.916783" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re15],ParameterGroup=Parameters,Parameter=K2" value="1.33537" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re15],ParameterGroup=Parameters,Parameter=K3" value="3.58849" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re15],ParameterGroup=Parameters,Parameter=K4" value="0.727962" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re15],ParameterGroup=Parameters,Parameter=K5" value="6.97805" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re15],ParameterGroup=Parameters,Parameter=Vr" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re15],ParameterGroup=Parameters,Parameter=n1" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re15],ParameterGroup=Parameters,Parameter=n2" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re15],ParameterGroup=Parameters,Parameter=n3" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re15],ParameterGroup=Parameters,Parameter=n4" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re15],ParameterGroup=Parameters,Parameter=n5" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re16]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re16],ParameterGroup=Parameters,Parameter=Vf" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re16],ParameterGroup=Parameters,Parameter=K1" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re16],ParameterGroup=Parameters,Parameter=K2" value="0.004433" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re16],ParameterGroup=Parameters,Parameter=n2" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re16],ParameterGroup=Parameters,Parameter=K3" value="99.98699999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re16],ParameterGroup=Parameters,Parameter=Vr" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re16],ParameterGroup=Parameters,Parameter=n1" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re16],ParameterGroup=Parameters,Parameter=n3" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re17]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re17],ParameterGroup=Parameters,Parameter=Vf" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re17],ParameterGroup=Parameters,Parameter=K1" value="7.83763" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re17],ParameterGroup=Parameters,Parameter=K2" value="0.667462" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re17],ParameterGroup=Parameters,Parameter=Vr" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re17],ParameterGroup=Parameters,Parameter=n1" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re17],ParameterGroup=Parameters,Parameter=n2" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re18]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re18],ParameterGroup=Parameters,Parameter=k1" value="0.1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re19]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re19],ParameterGroup=Parameters,Parameter=Vf" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re19],ParameterGroup=Parameters,Parameter=K" value="13.0657" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re19],ParameterGroup=Parameters,Parameter=Vr" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re19],ParameterGroup=Parameters,Parameter=n" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re20]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re20],ParameterGroup=Parameters,Parameter=Vf" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re20],ParameterGroup=Parameters,Parameter=n1" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re20],ParameterGroup=Parameters,Parameter=K1" value="0.210399" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re20],ParameterGroup=Parameters,Parameter=n2" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re20],ParameterGroup=Parameters,Parameter=K2" value="56.3452" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re20],ParameterGroup=Parameters,Parameter=n3" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re20],ParameterGroup=Parameters,Parameter=K3" value="98.0373" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re20],ParameterGroup=Parameters,Parameter=Vr" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re20],ParameterGroup=Parameters,Parameter=n4" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re20],ParameterGroup=Parameters,Parameter=K4" value="0.21" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re20],ParameterGroup=Parameters,Parameter=n5" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re20],ParameterGroup=Parameters,Parameter=K5" value="4.32731" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re23]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re23],ParameterGroup=Parameters,Parameter=Vf" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re23],ParameterGroup=Parameters,Parameter=K1" value="0.199351" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re23],ParameterGroup=Parameters,Parameter=K2" value="9.615209999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re23],ParameterGroup=Parameters,Parameter=K3" value="0.214012" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re23],ParameterGroup=Parameters,Parameter=K4" value="0.321065" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re23],ParameterGroup=Parameters,Parameter=K5" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re23],ParameterGroup=Parameters,Parameter=Vr" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re23],ParameterGroup=Parameters,Parameter=n1" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re23],ParameterGroup=Parameters,Parameter=n2" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re23],ParameterGroup=Parameters,Parameter=n3" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re23],ParameterGroup=Parameters,Parameter=n4" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re23],ParameterGroup=Parameters,Parameter=n5" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re24]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re24],ParameterGroup=Parameters,Parameter=Vf" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re24],ParameterGroup=Parameters,Parameter=K" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re24],ParameterGroup=Parameters,Parameter=Vr" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re24],ParameterGroup=Parameters,Parameter=n" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re24],ParameterGroup=Parameters,Parameter=n1" value="0.004304" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re24],ParameterGroup=Parameters,Parameter=K1" value="0.1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re25]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re25],ParameterGroup=Parameters,Parameter=k1" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re25],ParameterGroup=Parameters,Parameter=k2" value="0.1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re26]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re26],ParameterGroup=Parameters,Parameter=Vf" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re26],ParameterGroup=Parameters,Parameter=K" value="0.374591" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re26],ParameterGroup=Parameters,Parameter=Vr" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re26],ParameterGroup=Parameters,Parameter=n" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re27]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re27],ParameterGroup=Parameters,Parameter=Vf" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re27],ParameterGroup=Parameters,Parameter=K1" value="0.358755" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re27],ParameterGroup=Parameters,Parameter=K2" value="0.354892" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re27],ParameterGroup=Parameters,Parameter=K3" value="1.31281" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re27],ParameterGroup=Parameters,Parameter=K4" value="0.01" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re27],ParameterGroup=Parameters,Parameter=K5" value="0.000679025" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re27],ParameterGroup=Parameters,Parameter=K6" value="0.00011324" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re27],ParameterGroup=Parameters,Parameter=K7" value="1.93254e-07" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re27],ParameterGroup=Parameters,Parameter=Vr" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re27],ParameterGroup=Parameters,Parameter=n1" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re27],ParameterGroup=Parameters,Parameter=n2" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re27],ParameterGroup=Parameters,Parameter=n3" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re27],ParameterGroup=Parameters,Parameter=n4" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re27],ParameterGroup=Parameters,Parameter=n5" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re28]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re28],ParameterGroup=Parameters,Parameter=k1" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re28],ParameterGroup=Parameters,Parameter=k2" value="0.1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re29]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re29],ParameterGroup=Parameters,Parameter=k1" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re29],ParameterGroup=Parameters,Parameter=k2" value="0.1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re30]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re30],ParameterGroup=Parameters,Parameter=Vf" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re30],ParameterGroup=Parameters,Parameter=K" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re30],ParameterGroup=Parameters,Parameter=K1" value="0.636796" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re30],ParameterGroup=Parameters,Parameter=K2" value="39.018" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re30],ParameterGroup=Parameters,Parameter=K3" value="2.26986" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re30],ParameterGroup=Parameters,Parameter=K4" value="0.137545" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re30],ParameterGroup=Parameters,Parameter=Vr" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re30],ParameterGroup=Parameters,Parameter=n" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re30],ParameterGroup=Parameters,Parameter=n1" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re30],ParameterGroup=Parameters,Parameter=n2" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re30],ParameterGroup=Parameters,Parameter=n3" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re30],ParameterGroup=Parameters,Parameter=n4" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re31]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re31],ParameterGroup=Parameters,Parameter=Vf" value="0.2249" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re31],ParameterGroup=Parameters,Parameter=K1" value="9722.09" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re31],ParameterGroup=Parameters,Parameter=K2" value="0.703778" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re31],ParameterGroup=Parameters,Parameter=Vr" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re31],ParameterGroup=Parameters,Parameter=n1" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re31],ParameterGroup=Parameters,Parameter=n2" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re31],ParameterGroup=Parameters,Parameter=n3" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re31],ParameterGroup=Parameters,Parameter=K3" value="1.24123" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re31],ParameterGroup=Parameters,Parameter=n4" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re31],ParameterGroup=Parameters,Parameter=K4" value="997.263" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re32]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re32],ParameterGroup=Parameters,Parameter=Vf" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re32],ParameterGroup=Parameters,Parameter=K" value="0.240705" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re32],ParameterGroup=Parameters,Parameter=K1" value="8.14189" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re32],ParameterGroup=Parameters,Parameter=Vr" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re32],ParameterGroup=Parameters,Parameter=n" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re32],ParameterGroup=Parameters,Parameter=n1" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re33]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re33],ParameterGroup=Parameters,Parameter=k1" value="0.1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re34]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re34],ParameterGroup=Parameters,Parameter=k1" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re34],ParameterGroup=Parameters,Parameter=k2" value="0.1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re35]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re35],ParameterGroup=Parameters,Parameter=Vf" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re35],ParameterGroup=Parameters,Parameter=K" value="4.66107" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re35],ParameterGroup=Parameters,Parameter=Vr" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re35],ParameterGroup=Parameters,Parameter=n" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re36]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re36],ParameterGroup=Parameters,Parameter=Vf" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re36],ParameterGroup=Parameters,Parameter=K" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re36],ParameterGroup=Parameters,Parameter=K1" value="25.5354" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re36],ParameterGroup=Parameters,Parameter=Vr" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re36],ParameterGroup=Parameters,Parameter=n" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re36],ParameterGroup=Parameters,Parameter=n1" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re37]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re37],ParameterGroup=Parameters,Parameter=Vf" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re37],ParameterGroup=Parameters,Parameter=K" value="0.118892" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re37],ParameterGroup=Parameters,Parameter=Vr" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re37],ParameterGroup=Parameters,Parameter=n" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re38]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re38],ParameterGroup=Parameters,Parameter=k1" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re38],ParameterGroup=Parameters,Parameter=k2" value="0.1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re42]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re42],ParameterGroup=Parameters,Parameter=Vf" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re42],ParameterGroup=Parameters,Parameter=K" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re42],ParameterGroup=Parameters,Parameter=K1" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re42],ParameterGroup=Parameters,Parameter=Vr" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re42],ParameterGroup=Parameters,Parameter=n" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re42],ParameterGroup=Parameters,Parameter=n1" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re44]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re44],ParameterGroup=Parameters,Parameter=k1" value="0.1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re45]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re45],ParameterGroup=Parameters,Parameter=k1" value="0.1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re46]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re46],ParameterGroup=Parameters,Parameter=k1" value="0.1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re48]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re48],ParameterGroup=Parameters,Parameter=k1" value="0.1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re49]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re49],ParameterGroup=Parameters,Parameter=k1" value="0.1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re50]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re50],ParameterGroup=Parameters,Parameter=k1" value="0.184881" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re50],ParameterGroup=Parameters,Parameter=k2" value="0.1896" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re47]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re47],ParameterGroup=Parameters,Parameter=k1" value="0.1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re51]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re51],ParameterGroup=Parameters,Parameter=Vf" value="0.225095" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re51],ParameterGroup=Parameters,Parameter=n" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re51],ParameterGroup=Parameters,Parameter=K" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re51],ParameterGroup=Parameters,Parameter=Vr" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re51],ParameterGroup=Parameters,Parameter=n1" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re51],ParameterGroup=Parameters,Parameter=K1" value="1.62893" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re51],ParameterGroup=Parameters,Parameter=n2" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re51],ParameterGroup=Parameters,Parameter=K2" value="0.526832" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re51],ParameterGroup=Parameters,Parameter=n3" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re51],ParameterGroup=Parameters,Parameter=K3" value="5.47889" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[IL18 pool]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[IL18 pool],ParameterGroup=Parameters,Parameter=V" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[IL18 pool],ParameterGroup=Parameters,Parameter=n" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[IL18 pool],ParameterGroup=Parameters,Parameter=k" value="0.5" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[IL12 pool]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[IL12 pool],ParameterGroup=Parameters,Parameter=V" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[IL12 pool],ParameterGroup=Parameters,Parameter=n" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[IL12 pool],ParameterGroup=Parameters,Parameter=k" value="0.5" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[IFNg pool]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[IFNg pool],ParameterGroup=Parameters,Parameter=V" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[IFNg pool],ParameterGroup=Parameters,Parameter=n" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[IFNg pool],ParameterGroup=Parameters,Parameter=k" value="0.1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[IL21 pool]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[IL21 pool],ParameterGroup=Parameters,Parameter=V" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[IL21 pool],ParameterGroup=Parameters,Parameter=n" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[IL21 pool],ParameterGroup=Parameters,Parameter=k" value="0.1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[IL23 pool]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[IL23 pool],ParameterGroup=Parameters,Parameter=V" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[IL23 pool],ParameterGroup=Parameters,Parameter=n" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[IL23 pool],ParameterGroup=Parameters,Parameter=k" value="0.1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[IL17 pool]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[IL17 pool],ParameterGroup=Parameters,Parameter=V" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[IL17 pool],ParameterGroup=Parameters,Parameter=n" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[IL17 pool],ParameterGroup=Parameters,Parameter=k" value="0.1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[IL10 pool]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[IL10 pool],ParameterGroup=Parameters,Parameter=V" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[IL10 pool],ParameterGroup=Parameters,Parameter=n" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[IL10 pool],ParameterGroup=Parameters,Parameter=k" value="0.1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[IL6 pool]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[IL6 pool],ParameterGroup=Parameters,Parameter=V" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[IL6 pool],ParameterGroup=Parameters,Parameter=n" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[IL6 pool],ParameterGroup=Parameters,Parameter=k" value="0.1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[IL2 pool]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[IL2 pool],ParameterGroup=Parameters,Parameter=V" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[IL2 pool],ParameterGroup=Parameters,Parameter=n" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[IL2 pool],ParameterGroup=Parameters,Parameter=k" value="0.1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[TGFb pool]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[TGFb pool],ParameterGroup=Parameters,Parameter=V" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[TGFb pool],ParameterGroup=Parameters,Parameter=n" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[TGFb pool],ParameterGroup=Parameters,Parameter=k" value="0.1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[IL4 pool]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[IL4 pool],ParameterGroup=Parameters,Parameter=V" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[IL4 pool],ParameterGroup=Parameters,Parameter=n" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[IL4 pool],ParameterGroup=Parameters,Parameter=k" value="0.1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re52]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re52],ParameterGroup=Parameters,Parameter=Vf" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re52],ParameterGroup=Parameters,Parameter=K" value="0.508159" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re52],ParameterGroup=Parameters,Parameter=n" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re52],ParameterGroup=Parameters,Parameter=n1" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re52],ParameterGroup=Parameters,Parameter=K1" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re52],ParameterGroup=Parameters,Parameter=n2" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re52],ParameterGroup=Parameters,Parameter=K2" value="0.00125893" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re52],ParameterGroup=Parameters,Parameter=n3" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re52],ParameterGroup=Parameters,Parameter=K3" value="0.645162" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re52],ParameterGroup=Parameters,Parameter=n4" value="2" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[Hill Coeficient],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re52],ParameterGroup=Parameters,Parameter=K4" value="100" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re52],ParameterGroup=Parameters,Parameter=Vr" value="0.1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
    </ListOfModelParameterSets>
    <StateTemplate>
      <StateTemplateVariable objectReference="Model_4"/>
      <StateTemplateVariable objectReference="Metabolite_1"/>
      <StateTemplateVariable objectReference="Metabolite_3"/>
      <StateTemplateVariable objectReference="Metabolite_5"/>
      <StateTemplateVariable objectReference="Metabolite_9"/>
      <StateTemplateVariable objectReference="Metabolite_11"/>
      <StateTemplateVariable objectReference="Metabolite_13"/>
      <StateTemplateVariable objectReference="Metabolite_15"/>
      <StateTemplateVariable objectReference="Metabolite_19"/>
      <StateTemplateVariable objectReference="Metabolite_21"/>
      <StateTemplateVariable objectReference="Metabolite_127"/>
      <StateTemplateVariable objectReference="Metabolite_129"/>
      <StateTemplateVariable objectReference="Metabolite_75"/>
      <StateTemplateVariable objectReference="Metabolite_93"/>
      <StateTemplateVariable objectReference="Metabolite_117"/>
      <StateTemplateVariable objectReference="Metabolite_7"/>
      <StateTemplateVariable objectReference="Metabolite_17"/>
      <StateTemplateVariable objectReference="Metabolite_131"/>
      <StateTemplateVariable objectReference="Metabolite_109"/>
      <StateTemplateVariable objectReference="Metabolite_111"/>
      <StateTemplateVariable objectReference="Metabolite_115"/>
      <StateTemplateVariable objectReference="Metabolite_121"/>
      <StateTemplateVariable objectReference="Metabolite_125"/>
      <StateTemplateVariable objectReference="Metabolite_135"/>
      <StateTemplateVariable objectReference="Metabolite_137"/>
      <StateTemplateVariable objectReference="Metabolite_141"/>
      <StateTemplateVariable objectReference="Metabolite_149"/>
      <StateTemplateVariable objectReference="Metabolite_151"/>
      <StateTemplateVariable objectReference="Metabolite_157"/>
      <StateTemplateVariable objectReference="Metabolite_159"/>
      <StateTemplateVariable objectReference="Metabolite_163"/>
      <StateTemplateVariable objectReference="Metabolite_169"/>
      <StateTemplateVariable objectReference="Metabolite_91"/>
      <StateTemplateVariable objectReference="Metabolite_65"/>
      <StateTemplateVariable objectReference="Metabolite_57"/>
      <StateTemplateVariable objectReference="Metabolite_59"/>
      <StateTemplateVariable objectReference="Metabolite_81"/>
      <StateTemplateVariable objectReference="Metabolite_103"/>
      <StateTemplateVariable objectReference="Metabolite_95"/>
      <StateTemplateVariable objectReference="Metabolite_71"/>
      <StateTemplateVariable objectReference="Metabolite_99"/>
      <StateTemplateVariable objectReference="Metabolite_77"/>
      <StateTemplateVariable objectReference="Metabolite_63"/>
      <StateTemplateVariable objectReference="Metabolite_53"/>
      <StateTemplateVariable objectReference="Metabolite_69"/>
      <StateTemplateVariable objectReference="Metabolite_85"/>
      <StateTemplateVariable objectReference="Metabolite_87"/>
      <StateTemplateVariable objectReference="Metabolite_179"/>
      <StateTemplateVariable objectReference="Metabolite_181"/>
      <StateTemplateVariable objectReference="Metabolite_67"/>
      <StateTemplateVariable objectReference="Metabolite_55"/>
      <StateTemplateVariable objectReference="Metabolite_73"/>
      <StateTemplateVariable objectReference="Metabolite_79"/>
      <StateTemplateVariable objectReference="Metabolite_105"/>
      <StateTemplateVariable objectReference="Metabolite_61"/>
      <StateTemplateVariable objectReference="Metabolite_89"/>
      <StateTemplateVariable objectReference="Metabolite_165"/>
      <StateTemplateVariable objectReference="Metabolite_83"/>
      <StateTemplateVariable objectReference="Metabolite_97"/>
      <StateTemplateVariable objectReference="Metabolite_101"/>
      <StateTemplateVariable objectReference="Metabolite_189"/>
      <StateTemplateVariable objectReference="Metabolite_191"/>
      <StateTemplateVariable objectReference="Metabolite_193"/>
      <StateTemplateVariable objectReference="Metabolite_197"/>
      <StateTemplateVariable objectReference="Metabolite_199"/>
      <StateTemplateVariable objectReference="Metabolite_201"/>
      <StateTemplateVariable objectReference="Metabolite_203"/>
      <StateTemplateVariable objectReference="Metabolite_205"/>
      <StateTemplateVariable objectReference="Metabolite_207"/>
      <StateTemplateVariable objectReference="Metabolite_209"/>
      <StateTemplateVariable objectReference="Metabolite_211"/>
      <StateTemplateVariable objectReference="ModelValue_2"/>
      <StateTemplateVariable objectReference="ModelValue_3"/>
      <StateTemplateVariable objectReference="Metabolite_23"/>
      <StateTemplateVariable objectReference="Metabolite_25"/>
      <StateTemplateVariable objectReference="Metabolite_27"/>
      <StateTemplateVariable objectReference="Metabolite_29"/>
      <StateTemplateVariable objectReference="Metabolite_31"/>
      <StateTemplateVariable objectReference="Metabolite_33"/>
      <StateTemplateVariable objectReference="Metabolite_35"/>
      <StateTemplateVariable objectReference="Metabolite_37"/>
      <StateTemplateVariable objectReference="Metabolite_39"/>
      <StateTemplateVariable objectReference="Metabolite_41"/>
      <StateTemplateVariable objectReference="Metabolite_43"/>
      <StateTemplateVariable objectReference="Metabolite_45"/>
      <StateTemplateVariable objectReference="Metabolite_47"/>
      <StateTemplateVariable objectReference="Metabolite_49"/>
      <StateTemplateVariable objectReference="Metabolite_51"/>
      <StateTemplateVariable objectReference="Metabolite_107"/>
      <StateTemplateVariable objectReference="Metabolite_113"/>
      <StateTemplateVariable objectReference="Metabolite_119"/>
      <StateTemplateVariable objectReference="Metabolite_123"/>
      <StateTemplateVariable objectReference="Metabolite_133"/>
      <StateTemplateVariable objectReference="Metabolite_139"/>
      <StateTemplateVariable objectReference="Metabolite_143"/>
      <StateTemplateVariable objectReference="Metabolite_145"/>
      <StateTemplateVariable objectReference="Metabolite_147"/>
      <StateTemplateVariable objectReference="Metabolite_153"/>
      <StateTemplateVariable objectReference="Metabolite_155"/>
      <StateTemplateVariable objectReference="Metabolite_161"/>
      <StateTemplateVariable objectReference="Metabolite_167"/>
      <StateTemplateVariable objectReference="Metabolite_171"/>
      <StateTemplateVariable objectReference="Metabolite_173"/>
      <StateTemplateVariable objectReference="Metabolite_175"/>
      <StateTemplateVariable objectReference="Metabolite_177"/>
      <StateTemplateVariable objectReference="Metabolite_183"/>
      <StateTemplateVariable objectReference="Metabolite_185"/>
      <StateTemplateVariable objectReference="Metabolite_187"/>
      <StateTemplateVariable objectReference="Compartment_1"/>
      <StateTemplateVariable objectReference="Compartment_3"/>
      <StateTemplateVariable objectReference="ModelValue_0"/>
      <StateTemplateVariable objectReference="ModelValue_1"/>
    </StateTemplate>
    <InitialState type="initialState">
      0 0 0 0 0 6.022141789999999e+23 0 6.022141789999999e+23 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4.817713432e+22 0 0 0 0 0 0 6.022141500000001e+23 0 0 6.022141500000001e+23 0 0 0 0 0 0 6.022141499732765e+23 0 6.022141500000001e+23 6.022141499732765e+23 6.022141500000001e+23 6.022141500000001e+23 0 6.022141500000001e+23 6.022141500000001e+23 0 6.022141500000001e+23 6.022141500000001e+23 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6.022141789999999e+23 6.022141789999999e+23 6.022141789999999e+23 0 0 0 0 0 0 0 6.022141789999999e+23 0 6.022141789999999e+23 0 6.022141789999999e+23 3.011070895e+23 6.022141500000001e+23 3.011070895e+23 6.022141500000001e+23 6.022141500000001e+23 6.022141500000001e+23 6.022141500000001e+23 6.022141500000001e+23 6.022141500000001e+23 6.022141500000001e+23 6.022141500000001e+23 6.022141789999999e+23 6.022141499732765e+23 6.022141499732765e+23 6.022141499732765e+23 3.011070895e+23 3.011070895e+23 6.022141499732765e+23 6.022141500000001e+23 6.022141500000001e+23 1 1 2 0.008506077810123313 
    </InitialState>
  </Model>
  <ListOfTasks>
    <Task key="Task_12" name="Steady-State" type="steadyState" scheduled="false" updateModel="false">
      <Report reference="Report_8" target="" append="1" confirmOverwrite="0"/>
      <Problem>
        <Parameter name="JacobianRequested" type="bool" value="1"/>
        <Parameter name="StabilityAnalysisRequested" type="bool" value="0"/>
      </Problem>
      <Method name="Enhanced Newton" type="EnhancedNewton">
        <Parameter name="Resolution" type="unsignedFloat" value="1e-09"/>
        <Parameter name="Derivation Factor" type="unsignedFloat" value="0.001"/>
        <Parameter name="Use Newton" type="bool" value="1"/>
        <Parameter name="Use Integration" type="bool" value="1"/>
        <Parameter name="Use Back Integration" type="bool" value="0"/>
        <Parameter name="Accept Negative Concentrations" type="bool" value="0"/>
        <Parameter name="Iteration Limit" type="unsignedInteger" value="50"/>
        <Parameter name="Maximum duration for forward integration" type="unsignedFloat" value="1000000000"/>
        <Parameter name="Maximum duration for backward integration" type="unsignedFloat" value="1000000"/>
      </Method>
    </Task>
    <Task key="Task_11" name="Time-Course" type="timeCourse" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="StepNumber" type="unsignedInteger" value="403"/>
        <Parameter name="StepSize" type="float" value="0.248139"/>
        <Parameter name="Duration" type="float" value="100"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
        <Parameter name="Output Event" type="bool" value="0"/>
        <Parameter name="Continue on Simultaneous Events" type="bool" value="0"/>
      </Problem>
      <Method name="Deterministic (LSODA)" type="Deterministic(LSODA)">
        <Parameter name="Integrate Reduced Model" type="bool" value="0"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="1e-06"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="1e-12"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="10000"/>
      </Method>
    </Task>
    <Task key="Task_10" name="Scan" type="scan" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="Subtask" type="unsignedInteger" value="1"/>
        <ParameterGroup name="ScanItems">
          <ParameterGroup name="ScanItem">
            <Parameter name="Maximum" type="float" value="0.5"/>
            <Parameter name="Minimum" type="float" value="0"/>
            <Parameter name="Number of steps" type="unsignedInteger" value="100"/>
            <Parameter name="Object" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[PPARg],Reference=InitialConcentration"/>
            <Parameter name="Type" type="unsignedInteger" value="1"/>
            <Parameter name="log" type="bool" value="0"/>
          </ParameterGroup>
        </ParameterGroup>
        <Parameter name="Output in subtask" type="bool" value="1"/>
        <Parameter name="Adjust initial conditions" type="bool" value="0"/>
      </Problem>
      <Method name="Scan Framework" type="ScanFramework">
      </Method>
    </Task>
    <Task key="Task_9" name="Optimization" type="optimization" scheduled="false" updateModel="false">
      <Report reference="Report_6" target="" append="1" confirmOverwrite="0"/>
      <Problem>
        <Parameter name="Subtask" type="cn" value="CN=Root,Vector=TaskList[Steady-State]"/>
        <ParameterText name="ObjectiveExpression" type="expression">
          &lt;CN=Root,Vector=TaskList[Sensitivities],Problem=Sensitivities,Array=Scaled sensitivities array[.]&gt;^2
        </ParameterText>
        <Parameter name="Maximize" type="bool" value="1"/>
        <Parameter name="Randomize Start Values" type="bool" value="0"/>
        <Parameter name="Calculate Statistics" type="bool" value="1"/>
        <ParameterGroup name="OptimizationItemList">
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIFNg],Reference=InitialConcentration"/>
            <Parameter name="StartValue" type="float" value="14.549"/>
            <Parameter name="UpperBound" type="cn" value="1e3"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL12],Reference=InitialConcentration"/>
            <Parameter name="StartValue" type="float" value="0.06397129999999999"/>
            <Parameter name="UpperBound" type="cn" value="1e3"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL21],Reference=InitialConcentration"/>
            <Parameter name="StartValue" type="float" value="28.3262"/>
            <Parameter name="UpperBound" type="cn" value="1e3"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL23],Reference=InitialConcentration"/>
            <Parameter name="StartValue" type="float" value="0.00181331"/>
            <Parameter name="UpperBound" type="cn" value="1e3"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL4],Reference=InitialConcentration"/>
            <Parameter name="StartValue" type="float" value="0.00536536"/>
            <Parameter name="UpperBound" type="cn" value="1e3"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eTGFb],Reference=InitialConcentration"/>
            <Parameter name="StartValue" type="float" value="830.511"/>
            <Parameter name="UpperBound" type="cn" value="1e3"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL2],Reference=InitialConcentration"/>
            <Parameter name="StartValue" type="float" value="0.231534"/>
            <Parameter name="UpperBound" type="cn" value="1e3"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL6],Reference=InitialConcentration"/>
            <Parameter name="StartValue" type="float" value="1.64518"/>
            <Parameter name="UpperBound" type="cn" value="1e3"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL17],Reference=InitialConcentration"/>
            <Parameter name="StartValue" type="float" value="0.00357091"/>
            <Parameter name="UpperBound" type="cn" value="1e3"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL10],Reference=InitialConcentration"/>
            <Parameter name="StartValue" type="float" value="0.0160106"/>
            <Parameter name="UpperBound" type="cn" value="1e3"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL18],Reference=InitialConcentration"/>
            <Parameter name="StartValue" type="float" value="768.836"/>
            <Parameter name="UpperBound" type="cn" value="1e3"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[anti-IL4],Reference=InitialConcentration"/>
            <Parameter name="StartValue" type="float" value="0.349776"/>
            <Parameter name="UpperBound" type="cn" value="1e3"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[anti-IFNg],Reference=InitialConcentration"/>
            <Parameter name="StartValue" type="float" value="22.4802"/>
            <Parameter name="UpperBound" type="cn" value="1e3"/>
          </ParameterGroup>
        </ParameterGroup>
        <ParameterGroup name="OptimizationConstraintList">
        </ParameterGroup>
      </Problem>
      <Method name="Hooke &amp; Jeeves" type="HookeJeeves">
        <Parameter name="Iteration Limit" type="unsignedInteger" value="50"/>
        <Parameter name="Tolerance" type="float" value="1e-05"/>
        <Parameter name="Rho" type="float" value="0.2"/>
      </Method>
    </Task>
    <Task key="Task_8" name="Parameter Estimation" type="parameterFitting" scheduled="false" updateModel="true">
      <Report reference="Report_5" target="" append="1" confirmOverwrite="0"/>
      <Problem>
        <Parameter name="Maximize" type="bool" value="0"/>
        <Parameter name="Randomize Start Values" type="bool" value="0"/>
        <Parameter name="Calculate Statistics" type="bool" value="1"/>
        <ParameterGroup name="OptimizationItemList">
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-4"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re10],ParameterGroup=Parameters,Parameter=K1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.0001"/>
            <Parameter name="UpperBound" type="cn" value="1e3"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-4"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re10],ParameterGroup=Parameters,Parameter=K2,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.00255828"/>
            <Parameter name="UpperBound" type="cn" value="1e2"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re10],ParameterGroup=Parameters,Parameter=K4,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="33.3943"/>
            <Parameter name="UpperBound" type="cn" value="1e3"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re11],ParameterGroup=Parameters,Parameter=K,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="72.3554"/>
            <Parameter name="UpperBound" type="cn" value="1e3"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re13],ParameterGroup=Parameters,Parameter=K1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="1.24514"/>
            <Parameter name="UpperBound" type="cn" value="1e2"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re13],ParameterGroup=Parameters,Parameter=K2,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="3.17239"/>
            <Parameter name="UpperBound" type="cn" value="1e2"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re13],ParameterGroup=Parameters,Parameter=K3,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="4.4635"/>
            <Parameter name="UpperBound" type="cn" value="1e2"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re14],ParameterGroup=Parameters,Parameter=K1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.316136"/>
            <Parameter name="UpperBound" type="cn" value="1e2"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-4"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re14],ParameterGroup=Parameters,Parameter=K2,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.000102956"/>
            <Parameter name="UpperBound" type="cn" value="1e2"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re14],ParameterGroup=Parameters,Parameter=K4,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="82.3441"/>
            <Parameter name="UpperBound" type="cn" value="1e2"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re14],ParameterGroup=Parameters,Parameter=K5,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="100"/>
            <Parameter name="UpperBound" type="cn" value="1e2"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re14],ParameterGroup=Parameters,Parameter=K6,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="2.59756"/>
            <Parameter name="UpperBound" type="cn" value="1e2"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-5"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re15],ParameterGroup=Parameters,Parameter=K1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.0382893"/>
            <Parameter name="UpperBound" type="cn" value="1e3"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-4"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re15],ParameterGroup=Parameters,Parameter=K2,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.000680277"/>
            <Parameter name="UpperBound" type="cn" value="1e3"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-4"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re15],ParameterGroup=Parameters,Parameter=K3,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.0100922"/>
            <Parameter name="UpperBound" type="cn" value="1e3"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-5"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re15],ParameterGroup=Parameters,Parameter=K4,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="5.72158e-05"/>
            <Parameter name="UpperBound" type="cn" value="1e3"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-5"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re15],ParameterGroup=Parameters,Parameter=K5,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="1.18378"/>
            <Parameter name="UpperBound" type="cn" value="1e3"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-5"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re15],ParameterGroup=Parameters,Parameter=K6,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.0219084"/>
            <Parameter name="UpperBound" type="cn" value="1e3"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re16],ParameterGroup=Parameters,Parameter=K2,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.004433"/>
            <Parameter name="UpperBound" type="cn" value="1e2"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re16],ParameterGroup=Parameters,Parameter=K3,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="99.98699999999999"/>
            <Parameter name="UpperBound" type="cn" value="1e2"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re17],ParameterGroup=Parameters,Parameter=K1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="7.83763"/>
            <Parameter name="UpperBound" type="cn" value="1e2"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-4"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re17],ParameterGroup=Parameters,Parameter=K2,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.00136518"/>
            <Parameter name="UpperBound" type="cn" value="1e2"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re19],ParameterGroup=Parameters,Parameter=K,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="985.591"/>
            <Parameter name="UpperBound" type="cn" value="1e3"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re20],ParameterGroup=Parameters,Parameter=K1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="501.93"/>
            <Parameter name="UpperBound" type="cn" value="1e3"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-4"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re20],ParameterGroup=Parameters,Parameter=K2,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.00031518"/>
            <Parameter name="UpperBound" type="cn" value="1e2"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-4"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re20],ParameterGroup=Parameters,Parameter=K3,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.000460728"/>
            <Parameter name="UpperBound" type="cn" value="1e2"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re20],ParameterGroup=Parameters,Parameter=K4,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.001"/>
            <Parameter name="UpperBound" type="cn" value="1e2"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re20],ParameterGroup=Parameters,Parameter=K5,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.0286564"/>
            <Parameter name="UpperBound" type="cn" value="1e3"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-4"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re23],ParameterGroup=Parameters,Parameter=K1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.00600143"/>
            <Parameter name="UpperBound" type="cn" value="1e2"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re23],ParameterGroup=Parameters,Parameter=K2,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="9.615209999999999"/>
            <Parameter name="UpperBound" type="cn" value="1e2"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-4"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re23],ParameterGroup=Parameters,Parameter=K3,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="99.0684"/>
            <Parameter name="UpperBound" type="cn" value="1e2"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-4"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re23],ParameterGroup=Parameters,Parameter=K4,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="2.4575"/>
            <Parameter name="UpperBound" type="cn" value="1e3"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re27],ParameterGroup=Parameters,Parameter=K1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="9.513730000000001"/>
            <Parameter name="UpperBound" type="cn" value="1e2"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re27],ParameterGroup=Parameters,Parameter=K2,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.133099"/>
            <Parameter name="UpperBound" type="cn" value="1e2"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re27],ParameterGroup=Parameters,Parameter=K3,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.0214285"/>
            <Parameter name="UpperBound" type="cn" value="1e2"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-4"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re27],ParameterGroup=Parameters,Parameter=K4,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.00135805"/>
            <Parameter name="UpperBound" type="cn" value="1e2"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re27],ParameterGroup=Parameters,Parameter=K5,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.335248"/>
            <Parameter name="UpperBound" type="cn" value="1e2"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re27],ParameterGroup=Parameters,Parameter=K6,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="10.0662"/>
            <Parameter name="UpperBound" type="cn" value="1e2"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re30],ParameterGroup=Parameters,Parameter=K1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="375.44"/>
            <Parameter name="UpperBound" type="cn" value="1e3"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-6"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re30],ParameterGroup=Parameters,Parameter=K2,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.000519038"/>
            <Parameter name="UpperBound" type="cn" value="1e2"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re30],ParameterGroup=Parameters,Parameter=K4,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.137545"/>
            <Parameter name="UpperBound" type="cn" value="1e2"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re31],ParameterGroup=Parameters,Parameter=Vf,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="50.1111"/>
            <Parameter name="UpperBound" type="cn" value="1e3"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re31],ParameterGroup=Parameters,Parameter=K1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="9722.09"/>
            <Parameter name="UpperBound" type="cn" value="1e4"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re31],ParameterGroup=Parameters,Parameter=K3,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="1.24123"/>
            <Parameter name="UpperBound" type="cn" value="1e2"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re31],ParameterGroup=Parameters,Parameter=K4,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="997.263"/>
            <Parameter name="UpperBound" type="cn" value="1e3"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re32],ParameterGroup=Parameters,Parameter=K,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.240705"/>
            <Parameter name="UpperBound" type="cn" value="1e2"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-6"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re35],ParameterGroup=Parameters,Parameter=K,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="4.39204e-06"/>
            <Parameter name="UpperBound" type="cn" value="1e2"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-6"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re36],ParameterGroup=Parameters,Parameter=K1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="3.5398e-05"/>
            <Parameter name="UpperBound" type="cn" value="1e2"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re37],ParameterGroup=Parameters,Parameter=K,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.00124757"/>
            <Parameter name="UpperBound" type="cn" value="1e2"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re9],ParameterGroup=Parameters,Parameter=K2,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="98.9482"/>
            <Parameter name="UpperBound" type="cn" value="1e2"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-4"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re9],ParameterGroup=Parameters,Parameter=K3,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.0539426"/>
            <Parameter name="UpperBound" type="cn" value="1e2"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-5"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re51],ParameterGroup=Parameters,Parameter=K,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.000262796"/>
            <Parameter name="UpperBound" type="cn" value="1e3"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re51],ParameterGroup=Parameters,Parameter=K1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.0583215"/>
            <Parameter name="UpperBound" type="cn" value="1e3"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re51],ParameterGroup=Parameters,Parameter=K2,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.279174"/>
            <Parameter name="UpperBound" type="cn" value="1e3"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re51],ParameterGroup=Parameters,Parameter=K3,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.0452514"/>
            <Parameter name="UpperBound" type="cn" value="1e3"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re51],ParameterGroup=Parameters,Parameter=Vf,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.0852068"/>
            <Parameter name="UpperBound" type="cn" value="1e3"/>
          </ParameterGroup>
          <ParameterGroup name="FitItem">
            <ParameterGroup name="Affected Cross Validation Experiments">
            </ParameterGroup>
            <ParameterGroup name="Affected Experiments">
              <Parameter name="Experiment Key" type="key" value="Experiment_1"/>
            </ParameterGroup>
            <Parameter name="LowerBound" type="cn" value="1e-3"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[BActin],Reference=InitialValue"/>
            <Parameter name="StartValue" type="float" value="0.008506080000000001"/>
            <Parameter name="UpperBound" type="cn" value="1e3"/>
          </ParameterGroup>
        </ParameterGroup>
        <ParameterGroup name="OptimizationConstraintList">
        </ParameterGroup>
        <Parameter name="Steady-State" type="cn" value="CN=Root,Vector=TaskList[Steady-State]"/>
        <Parameter name="Time-Course" type="cn" value="CN=Root,Vector=TaskList[Time-Course]"/>
        <Parameter name="Create Parameter Sets" type="bool" value="0"/>
        <ParameterGroup name="Experiment Set">
          <ParameterGroup name="Experiment">
            <Parameter name="Data is Row Oriented" type="bool" value="1"/>
            <Parameter name="Experiment Type" type="unsignedInteger" value="0"/>
            <Parameter name="File Name" type="file" value="../modelfiles/th17.txt"/>
            <Parameter name="First Row" type="unsignedInteger" value="1"/>
            <Parameter name="Key" type="key" value="Experiment_0"/>
            <Parameter name="Last Row" type="unsignedInteger" value="2"/>
            <Parameter name="Number of Columns" type="unsignedInteger" value="38"/>
            <ParameterGroup name="Object Map">
              <ParameterGroup name="0">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="1">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="10">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="11">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="12">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="13">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="14">
                <Parameter name="Object CN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL6],Reference=InitialConcentration"/>
                <Parameter name="Role" type="unsignedInteger" value="1"/>
              </ParameterGroup>
              <ParameterGroup name="15">
                <Parameter name="Object CN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eTGFb],Reference=InitialConcentration"/>
                <Parameter name="Role" type="unsignedInteger" value="1"/>
              </ParameterGroup>
              <ParameterGroup name="16">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="17">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="18">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="19">
                <Parameter name="Object CN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IFNg],Reference=Concentration"/>
                <Parameter name="Role" type="unsignedInteger" value="2"/>
              </ParameterGroup>
              <ParameterGroup name="2">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="20">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="21">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="22">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="23">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="24">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="25">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="26">
                <Parameter name="Object CN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL17],Reference=InitialConcentration"/>
                <Parameter name="Role" type="unsignedInteger" value="1"/>
              </ParameterGroup>
              <ParameterGroup name="27">
                <Parameter name="Object CN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL17],Reference=Concentration"/>
                <Parameter name="Role" type="unsignedInteger" value="2"/>
              </ParameterGroup>
              <ParameterGroup name="28">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="29">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="3">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="30">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="31">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="32">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="33">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="34">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="35">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="36">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="37">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="4">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="5">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="6">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="7">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="8">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="9">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
            </ParameterGroup>
            <Parameter name="Row containing Names" type="unsignedInteger" value="1"/>
            <Parameter name="Separator" type="string" value="&#x09;"/>
            <Parameter name="Weight Method" type="unsignedInteger" value="1"/>
            <Parameter name="Normalize Weights per Experiment" type="bool" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="Experiment_1">
            <Parameter name="Data is Row Oriented" type="bool" value="1"/>
            <Parameter name="Experiment Type" type="unsignedInteger" value="0"/>
            <Parameter name="File Name" type="file" value="th17.txt"/>
            <Parameter name="First Row" type="unsignedInteger" value="4"/>
            <Parameter name="Key" type="key" value="Experiment_1"/>
            <Parameter name="Last Row" type="unsignedInteger" value="7"/>
            <Parameter name="Number of Columns" type="unsignedInteger" value="38"/>
            <ParameterGroup name="Object Map">
              <ParameterGroup name="0">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="1">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="10">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="11">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="12">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="13">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="14">
                <Parameter name="Object CN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL6],Reference=InitialConcentration"/>
                <Parameter name="Role" type="unsignedInteger" value="1"/>
              </ParameterGroup>
              <ParameterGroup name="15">
                <Parameter name="Object CN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eTGFb],Reference=InitialConcentration"/>
                <Parameter name="Role" type="unsignedInteger" value="1"/>
              </ParameterGroup>
              <ParameterGroup name="16">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="17">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="18">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="19">
                <Parameter name="Object CN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IFNg],Reference=Concentration"/>
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="2">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="20">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="21">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="22">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="23">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="24">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="25">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="26">
                <Parameter name="Object CN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL17],Reference=InitialConcentration"/>
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="27">
                <Parameter name="Object CN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL17],Reference=Concentration"/>
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="28">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="29">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="3">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="30">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="31">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="32">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="33">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="34">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="35">
                <Parameter name="Object CN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[FOXP3R],Reference=Value"/>
                <Parameter name="Role" type="unsignedInteger" value="2"/>
              </ParameterGroup>
              <ParameterGroup name="36">
                <Parameter name="Object CN" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[IL17R],Reference=Value"/>
                <Parameter name="Role" type="unsignedInteger" value="2"/>
              </ParameterGroup>
              <ParameterGroup name="37">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="4">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="5">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="6">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="7">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="8">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
              <ParameterGroup name="9">
                <Parameter name="Role" type="unsignedInteger" value="0"/>
              </ParameterGroup>
            </ParameterGroup>
            <Parameter name="Row containing Names" type="unsignedInteger" value="1"/>
            <Parameter name="Separator" type="string" value="&#x09;"/>
            <Parameter name="Weight Method" type="unsignedInteger" value="1"/>
            <Parameter name="Normalize Weights per Experiment" type="bool" value="1"/>
          </ParameterGroup>
        </ParameterGroup>
        <ParameterGroup name="Validation Set">
          <Parameter name="Threshold" type="unsignedInteger" value="5"/>
          <Parameter name="Weight" type="unsignedFloat" value="1"/>
        </ParameterGroup>
      </Problem>
      <Method name="Particle Swarm" type="ParticleSwarm">
        <Parameter name="Iteration Limit" type="unsignedInteger" value="2000"/>
        <Parameter name="Swarm Size" type="unsignedInteger" value="50"/>
        <Parameter name="Std. Deviation" type="unsignedFloat" value="1e-06"/>
        <Parameter name="Random Number Generator" type="unsignedInteger" value="1"/>
        <Parameter name="Seed" type="unsignedInteger" value="0"/>
      </Method>
    </Task>
    <Task key="Task_7" name="Metabolic Control Analysis" type="metabolicControlAnalysis" scheduled="false" updateModel="false">
      <Report reference="Report_4" target="" append="1" confirmOverwrite="0"/>
      <Problem>
        <Parameter name="Steady-State" type="key" value="Task_3"/>
      </Problem>
      <Method name="MCA Method (Reder)" type="MCAMethod(Reder)">
        <Parameter name="Modulation Factor" type="unsignedFloat" value="1e-09"/>
        <Parameter name="Use Reeder" type="bool" value="1"/>
        <Parameter name="Use Smallbone" type="bool" value="1"/>
      </Method>
    </Task>
    <Task key="Task_6" name="Lyapunov Exponents" type="lyapunovExponents" scheduled="false" updateModel="false">
      <Report reference="Report_3" target="" append="1" confirmOverwrite="0"/>
      <Problem>
        <Parameter name="ExponentNumber" type="unsignedInteger" value="3"/>
        <Parameter name="DivergenceRequested" type="bool" value="1"/>
        <Parameter name="TransientTime" type="float" value="0"/>
      </Problem>
      <Method name="Wolf Method" type="WolfMethod">
        <Parameter name="Orthonormalization Interval" type="unsignedFloat" value="1"/>
        <Parameter name="Overall time" type="unsignedFloat" value="1000"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="1e-06"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="1e-12"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="10000"/>
      </Method>
    </Task>
    <Task key="Task_5" name="Time Scale Separation Analysis" type="timeScaleSeparationAnalysis" scheduled="false" updateModel="false">
      <Report reference="Report_2" target="" append="1" confirmOverwrite="0"/>
      <Problem>
        <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
        <Parameter name="StepSize" type="float" value="0.01"/>
        <Parameter name="Duration" type="float" value="1"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
      </Problem>
      <Method name="ILDM (LSODA,Deuflhard)" type="TimeScaleSeparation(ILDM,Deuflhard)">
        <Parameter name="Deuflhard Tolerance" type="unsignedFloat" value="1e-06"/>
      </Method>
    </Task>
    <Task key="Task_4" name="Sensitivities" type="sensitivities" scheduled="false" updateModel="false">
      <Report reference="Report_1" target="" append="1" confirmOverwrite="0"/>
      <Problem>
        <Parameter name="SubtaskType" type="unsignedInteger" value="2"/>
        <ParameterGroup name="TargetFunctions">
          <Parameter name="SingleObject" type="cn" value=""/>
          <Parameter name="ObjectListType" type="unsignedInteger" value="43"/>
        </ParameterGroup>
        <ParameterGroup name="ListOfVariables">
          <ParameterGroup name="Variables">
            <Parameter name="SingleObject" type="cn" value="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[L-PPARg],Reference=InitialConcentration"/>
            <Parameter name="ObjectListType" type="unsignedInteger" value="1"/>
          </ParameterGroup>
        </ParameterGroup>
      </Problem>
      <Method name="Sensitivities Method" type="SensitivitiesMethod">
        <Parameter name="Delta factor" type="unsignedFloat" value="0.001"/>
        <Parameter name="Delta minimum" type="unsignedFloat" value="1e-12"/>
      </Method>
    </Task>
    <Task key="Task_3" name="Moieties" type="moieties" scheduled="false" updateModel="false">
      <Problem>
      </Problem>
      <Method name="Householder Reduction" type="Householder">
      </Method>
    </Task>
    <Task key="Task_2" name="Elementary Flux Modes" type="fluxMode" scheduled="false" updateModel="false">
      <Report reference="Report_7" target="" append="1" confirmOverwrite="0"/>
      <Problem>
      </Problem>
      <Method name="EFM Algorithm" type="EFMAlgorithm">
      </Method>
    </Task>
    <Task key="Task_1" name="Linear Noise Approximation" type="linearNoiseApproximation" scheduled="false" updateModel="false">
      <Report reference="Report_0" target="" append="1" confirmOverwrite="0"/>
      <Problem>
        <Parameter name="Steady-State" type="key" value="Task_12"/>
      </Problem>
      <Method name="Linear Noise Approximation" type="LinearNoiseApproximation">
      </Method>
    </Task>
    <Task key="Task_13" name="Cross Section" type="crosssection" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
        <Parameter name="StepSize" type="float" value="0.01"/>
        <Parameter name="Duration" type="float" value="1"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
        <Parameter name="Output Event" type="bool" value="0"/>
        <Parameter name="Continue on Simultaneous Events" type="bool" value="0"/>
        <Parameter name="LimitCrossings" type="bool" value="0"/>
        <Parameter name="NumCrossingsLimit" type="unsignedInteger" value="0"/>
        <Parameter name="LimitOutTime" type="bool" value="0"/>
        <Parameter name="LimitOutCrossings" type="bool" value="0"/>
        <Parameter name="PositiveDirection" type="bool" value="1"/>
        <Parameter name="NumOutCrossingsLimit" type="unsignedInteger" value="0"/>
        <Parameter name="LimitUntilConvergence" type="bool" value="0"/>
        <Parameter name="ConvergenceTolerance" type="float" value="0"/>
        <Parameter name="Threshold" type="float" value="0"/>
        <Parameter name="DelayOutputUntilConvergence" type="bool" value="0"/>
        <Parameter name="OutputConvergenceTolerance" type="float" value="0"/>
        <ParameterText name="TriggerExpression" type="expression">
          
        </ParameterText>
        <Parameter name="SingleVariable" type="cn" value=""/>
      </Problem>
      <Method name="Deterministic (LSODA)" type="Deterministic(LSODA)">
        <Parameter name="Integrate Reduced Model" type="bool" value="0"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="1e-06"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="1e-12"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="10000"/>
      </Method>
    </Task>
  </ListOfTasks>
  <ListOfReports>
    <Report key="Report_8" name="Steady-State" taskType="steadyState" separator="&#x09;" precision="6">
      <Comment>
        <body xmlns="http://www.w3.org/1999/xhtml">
          Automatically generated report.
        </body>
      </Comment>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Steady-State]"/>
      </Footer>
    </Report>
    <Report key="Report_7" name="Elementary Flux Modes" taskType="fluxMode" separator="&#x09;" precision="6">
      <Comment>
        <body xmlns="http://www.w3.org/1999/xhtml">
          Automatically generated report.
        </body>
      </Comment>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Elementary Flux Modes],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_6" name="Optimization" taskType="optimization" separator="&#x09;" precision="6">
      <Comment>
        <body xmlns="http://www.w3.org/1999/xhtml">
          Automatically generated report.
        </body>
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Object=Description"/>
        <Object cn="String=\[Function Evaluations\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Value\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Parameters\]"/>
      </Header>
      <Body>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Function Evaluations"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Best Value"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Best Parameters"/>
      </Body>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_5" name="Parameter Estimation" taskType="parameterFitting" separator="&#x09;" precision="6">
      <Comment>
        <body xmlns="http://www.w3.org/1999/xhtml">
          Automatically generated report.
        </body>
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Object=Description"/>
        <Object cn="String=\[Function Evaluations\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Value\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Parameters\]"/>
      </Header>
      <Body>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Function Evaluations"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Best Value"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Best Parameters"/>
      </Body>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_4" name="Metabolic Control Analysis" taskType="metabolicControlAnalysis" separator="&#x09;" precision="6">
      <Comment>
        <body xmlns="http://www.w3.org/1999/xhtml">
          Automatically generated report.
        </body>
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Metabolic Control Analysis],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Metabolic Control Analysis],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_3" name="Lyapunov Exponents" taskType="lyapunovExponents" separator="&#x09;" precision="6">
      <Comment>
        <body xmlns="http://www.w3.org/1999/xhtml">
          Automatically generated report.
        </body>
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Lyapunov Exponents],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Lyapunov Exponents],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_2" name="Time Scale Separation Analysis" taskType="timeScaleSeparationAnalysis" separator="&#x09;" precision="6">
      <Comment>
        <body xmlns="http://www.w3.org/1999/xhtml">
          Automatically generated report.
        </body>
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Time Scale Separation Analysis],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Time Scale Separation Analysis],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_1" name="Sensitivities" taskType="sensitivities" separator="&#x09;" precision="6">
      <Comment>
        <body xmlns="http://www.w3.org/1999/xhtml">
          Automatically generated report.
        </body>
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Sensitivities],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Sensitivities],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_0" name="Linear Noise Approximation" taskType="linearNoiseApproximation" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Linear Noise Approximation],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Linear Noise Approximation],Object=Result"/>
      </Footer>
    </Report>
  </ListOfReports>
  <ListOfPlots>
    <PlotSpecification name="Variable Species Concentrations" type="Plot2D" active="1">
      <Parameter name="log X" type="bool" value="0"/>
      <Parameter name="log Y" type="bool" value="0"/>
      <ListOfPlotItems>
        <PlotItem name="[IL6-IL6R]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL6-IL6R],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL6]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL6],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[TGFb-TGFbR]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[TGFb-TGFbR],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[TGFb]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[TGFb],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL2-IL2R]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL2-IL2R],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL2]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL2],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL4-IL4R]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL4-IL4R],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL4]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL4],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IFNg-IFNgR]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IFNg-IFNgR],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL12-IL12R]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL12-IL12R],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL12]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL12],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL18-IL18R]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL18-IL18R],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL18]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL18],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL21]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL21],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL21-IL21R]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL21-IL21R],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL23-IL23R]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL23-IL23R],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL10-IL10R]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL10-IL10R],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IRAK1-P]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IRAK1-P],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[&quot;p50/p65 dimer&quot;]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[p50/p65 dimer],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[STAT4-P]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[STAT4-P],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IFNg]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IFNg],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[JAK1-P]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[JAK1-P],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[STAT1-P]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[STAT1-P],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[&quot;p40/p19 dimer&quot;]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[p40/p19 dimer],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL17]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL17],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL10]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL10],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[RORgt-ligand]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[RORgt-ligand],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[STAT3-P]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[STAT3-P],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[STAT5-P]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[STAT5-P],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[SOCS1-JAKs]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[SOCS1-JAKs],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[Tbet-P]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[Tbet-P],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[GATA3-P]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[GATA3-P],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[STAT6-P]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[STAT6-P],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[PPARg]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[PPARg],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[L-PPARg]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[L-PPARg],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[&quot;acetylated FOXP3&quot;]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[acetylated FOXP3],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL17-IL17R]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL17-IL17R],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
      </ListOfPlotItems>
    </PlotSpecification>
    <PlotSpecification name="Scan" type="Plot2D" active="1">
      <Parameter name="log X" type="bool" value="0"/>
      <Parameter name="log Y" type="bool" value="0"/>
      <ListOfPlotItems>
        <PlotItem name="[RORgt-ligand]|[PPARg]_0" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[PPARg],Reference=InitialConcentration"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[RORgt-ligand],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[FOXP3]|[PPARg]_0" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[PPARg],Reference=InitialConcentration"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[FOXP3],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL17]|[PPARg]_0" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[PPARg],Reference=InitialConcentration"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL17],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
      </ListOfPlotItems>
    </PlotSpecification>
    <PlotSpecification name="Progress of Fit" type="Plot2D" active="0">
      <Parameter name="log X" type="bool" value="0"/>
      <Parameter name="log Y" type="bool" value="1"/>
      <ListOfPlotItems>
        <PlotItem name="sum of squares" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Function Evaluations"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Best Value"/>
          </ListOfChannels>
        </PlotItem>
      </ListOfPlotItems>
    </PlotSpecification>
    <PlotSpecification name="Experiment" type="Plot2D" active="0">
      <Parameter name="log X" type="bool" value="0"/>
      <Parameter name="log Y" type="bool" value="0"/>
      <ListOfPlotItems>
        <PlotItem name="[IFNg](Measured Value)" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="2"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Measured Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IFNg](Fitted Value)" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="2"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Fitted Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IFNg](Weighted Error)" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="2"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Weighted Error"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL17](Measured Value)" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="2"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[1],Reference=Measured Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL17](Fitted Value)" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="2"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[1],Reference=Fitted Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL17](Weighted Error)" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="2"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment,Vector=Fitted Points[1],Reference=Weighted Error"/>
          </ListOfChannels>
        </PlotItem>
      </ListOfPlotItems>
    </PlotSpecification>
    <PlotSpecification name="Experiment_1" type="Plot2D" active="0">
      <Parameter name="log X" type="bool" value="0"/>
      <Parameter name="log Y" type="bool" value="0"/>
      <ListOfPlotItems>
        <PlotItem name="Values[FOXP3R](Measured Value)" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="2"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment_1,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment_1,Vector=Fitted Points[0],Reference=Measured Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="Values[FOXP3R](Fitted Value)" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="2"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment_1,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment_1,Vector=Fitted Points[0],Reference=Fitted Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="Values[FOXP3R](Weighted Error)" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="2"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment_1,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment_1,Vector=Fitted Points[0],Reference=Weighted Error"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="Values[IL17R](Measured Value)" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="2"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment_1,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment_1,Vector=Fitted Points[1],Reference=Measured Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="Values[IL17R](Fitted Value)" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="2"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment_1,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment_1,Vector=Fitted Points[1],Reference=Fitted Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="Values[IL17R](Weighted Error)" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="2"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="after"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment_1,Vector=Fitted Points[0],Reference=Independent Value"/>
            <ChannelSpec cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,ParameterGroup=Experiment Set,ParameterGroup=Experiment_1,Vector=Fitted Points[1],Reference=Weighted Error"/>
          </ListOfChannels>
        </PlotItem>
      </ListOfPlotItems>
    </PlotSpecification>
    <PlotSpecification name="Concentrations, Volumes, and Global Quantity Values" type="Plot2D" active="1">
      <Parameter name="log X" type="bool" value="0"/>
      <Parameter name="log Y" type="bool" value="0"/>
      <ListOfPlotItems>
        <PlotItem name="[eIFNg]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIFNg],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[eIL12]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL12],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[eIL21]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL21],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[eIL23]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL23],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[eIL4]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL4],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[eTGFb]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eTGFb],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[eIL2]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL2],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[eIL6]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL6],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[eIL17]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL17],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[eIL10]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL10],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[eIL18]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIL18],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL6-IL6R]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL6-IL6R],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL6R]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL6R],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL6]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL6],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[TGFb-TGFbR]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[TGFb-TGFbR],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[TGFbR]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[TGFbR],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[TGFb]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[TGFb],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL2-IL2R]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL2-IL2R],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL2R]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL2R],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL2]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL2],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL4-IL4R]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL4-IL4R],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL4R]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL4R],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL4]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL4],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IFNg-IFNgR]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IFNg-IFNgR],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IFNgR]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IFNgR],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL12-IL12R]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL12-IL12R],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL12R]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL12R],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL12]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL12],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL18-IL18R]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL18-IL18R],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL18R]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL18R],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL18]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL18],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL21]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL21],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL21-IL21R]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL21-IL21R],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL21R]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL21R],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL23R]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL23R],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL23-IL23R]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL23-IL23R],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL10R]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL10R],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL10-IL10R]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL10-IL10R],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IRAK1-P]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IRAK1-P],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[p50/p65 dimer]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[p50/p65 dimer],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[STAT4-P]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[STAT4-P],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IFNg]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IFNg],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[JAK1-P]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[JAK1-P],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[STAT1-P]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[STAT1-P],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[p40/p19 dimer]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[p40/p19 dimer],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL17]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL17],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL10]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL10],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[RORgt-ligand]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[RORgt-ligand],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[STAT3-P]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[STAT3-P],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[STAT5-P]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[STAT5-P],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[SOCS1-JAKs]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[SOCS1-JAKs],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[Tbet-P]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[Tbet-P],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[GATA3-P]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[GATA3-P],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[STAT6-P]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[STAT6-P],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[PPARg]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[PPARg],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[L-PPARg]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[L-PPARg],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[acetylated FOXP3]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[acetylated FOXP3],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL17R]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL17R],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL17-IL17R]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[T Helper Cell],Vector=Metabolites[IL17-IL17R],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="Values[FOXP3R]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[FOXP3R],Reference=Value"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="Values[IL17R]" type="Curve2D">
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Values[IL17R],Reference=Value"/>
          </ListOfChannels>
        </PlotItem>
      </ListOfPlotItems>
    </PlotSpecification>
  </ListOfPlots>
  <GUI>
    <ListOfSliders>
      <Slider key="Slider_0" associatedEntityKey="Task_12" objectCN="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Compartments[default],Vector=Metabolites[eIFNg],Reference=InitialConcentration" objectType="float" objectValue="0" minValue="0" maxValue="5" tickNumber="1000" tickFactor="100" scaling="linear"/>
      <Slider key="Slider_1" associatedEntityKey="Task_11" objectCN="CN=Root,Model=CD4+ T Cell Differentiation model,Vector=Reactions[re27],ParameterGroup=Parameters,Parameter=K1,Reference=Value" objectType="float" objectValue="0.358755" minValue="0.000145229" maxValue="1" tickNumber="1000" tickFactor="100" scaling="logarithmic"/>
    </ListOfSliders>
  </GUI>
  <ListOfLayouts xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <Layout key="Layout_2" name="layout_0">
      <Dimensions width="2309.86" height="1711.94"/>
      <ListOfCompartmentGlyphs>
        <CompartmentGlyph key="Layout_3" name="compartment_1" compartment="Compartment_3">
          <BoundingBox>
            <Position x="50" y="142.939"/>
            <Dimensions width="2209.86" height="1444.87"/>
          </BoundingBox>
        </CompartmentGlyph>
      </ListOfCompartmentGlyphs>
      <ListOfMetabGlyphs>
        <MetaboliteGlyph key="Layout_4" name="sGlyph_0" metabolite="Metabolite_17">
          <BoundingBox>
            <Position x="1876.72" y="641.165"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_5" name="sGlyph_1" metabolite="Metabolite_19">
          <BoundingBox>
            <Position x="1857.73" y="985.419"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_6" name="sGlyph_2" metabolite="Metabolite_181">
          <BoundingBox>
            <Position x="1438.41" y="681.972"/>
            <Dimensions width="105" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_7" name="sGlyph_3" metabolite="Metabolite_179">
          <BoundingBox>
            <Position x="1687.37" y="724.446"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_8" name="sGlyph_4" metabolite="Metabolite_183">
          <BoundingBox>
            <Position x="624.253" y="219.821"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_9" name="sGlyph_5" metabolite="Metabolite_185">
          <BoundingBox>
            <Position x="1066.38" y="210.566"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_10" name="sGlyph_6" metabolite="Metabolite_187">
          <BoundingBox>
            <Position x="452.706" y="1491.37"/>
            <Dimensions width="57" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_11" name="sGlyph_7" metabolite="Metabolite_53">
          <BoundingBox>
            <Position x="1211.38" y="1400.85"/>
            <Dimensions width="89" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_12" name="sGlyph_8" metabolite="Metabolite_55">
          <BoundingBox>
            <Position x="1272.56" y="1510.56"/>
            <Dimensions width="57" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_13" name="sGlyph_9" metabolite="Metabolite_57">
          <BoundingBox>
            <Position x="1194.09" y="1512.81"/>
            <Dimensions width="49" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_14" name="sGlyph_10" metabolite="Metabolite_59">
          <BoundingBox>
            <Position x="576.874" y="1368.52"/>
            <Dimensions width="105" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_15" name="sGlyph_11" metabolite="Metabolite_61">
          <BoundingBox>
            <Position x="633.38" y="1507.69"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_16" name="sGlyph_12" metabolite="Metabolite_63">
          <BoundingBox>
            <Position x="540.72" y="1501.57"/>
            <Dimensions width="57" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_17" name="sGlyph_13" metabolite="Metabolite_65">
          <BoundingBox>
            <Position x="835.168" y="1414.52"/>
            <Dimensions width="89" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_18" name="sGlyph_14" metabolite="Metabolite_67">
          <BoundingBox>
            <Position x="909.169" y="1501.55"/>
            <Dimensions width="57" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_19" name="sGlyph_15" metabolite="Metabolite_69">
          <BoundingBox>
            <Position x="806.612" y="1511.15"/>
            <Dimensions width="49" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_20" name="sGlyph_16" metabolite="Metabolite_71">
          <BoundingBox>
            <Position x="212.067" y="1344.12"/>
            <Dimensions width="89" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_21" name="sGlyph_17" metabolite="Metabolite_73">
          <BoundingBox>
            <Position x="152.326" y="1486.26"/>
            <Dimensions width="57" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_22" name="sGlyph_18" metabolite="Metabolite_75">
          <BoundingBox>
            <Position x="312.626" y="1491.03"/>
            <Dimensions width="49" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_23" name="sGlyph_19" metabolite="Metabolite_77">
          <BoundingBox>
            <Position x="800.046" y="388.365"/>
            <Dimensions width="105" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_24" name="sGlyph_20" metabolite="Metabolite_79">
          <BoundingBox>
            <Position x="874.958" y="224.336"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_25" name="sGlyph_21" metabolite="Metabolite_81">
          <BoundingBox>
            <Position x="403.603" y="348.773"/>
            <Dimensions width="105" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_26" name="sGlyph_22" metabolite="Metabolite_83">
          <BoundingBox>
            <Position x="475.138" y="205.874"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_27" name="sGlyph_23" metabolite="Metabolite_85">
          <BoundingBox>
            <Position x="386.987" y="204.51"/>
            <Dimensions width="57" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_28" name="sGlyph_24" metabolite="Metabolite_87">
          <BoundingBox>
            <Position x="125.954" y="366.768"/>
            <Dimensions width="105" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_29" name="sGlyph_25" metabolite="Metabolite_89">
          <BoundingBox>
            <Position x="199.075" y="205.285"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_30" name="sGlyph_26" metabolite="Metabolite_91">
          <BoundingBox>
            <Position x="100" y="204.725"/>
            <Dimensions width="57" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_31" name="sGlyph_27" metabolite="Metabolite_93">
          <BoundingBox>
            <Position x="1204.13" y="212.206"/>
            <Dimensions width="57" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_32" name="sGlyph_28" metabolite="Metabolite_95">
          <BoundingBox>
            <Position x="1240.52" y="381.282"/>
            <Dimensions width="105" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_33" name="sGlyph_29" metabolite="Metabolite_97">
          <BoundingBox>
            <Position x="1314.87" y="218.404"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_34" name="sGlyph_30" metabolite="Metabolite_99">
          <BoundingBox>
            <Position x="1689.29" y="214.622"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_35" name="sGlyph_31" metabolite="Metabolite_101">
          <BoundingBox>
            <Position x="1610.18" y="373.274"/>
            <Dimensions width="105" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_36" name="sGlyph_32" metabolite="Metabolite_103">
          <BoundingBox>
            <Position x="1698.62" y="1048"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_37" name="sGlyph_33" metabolite="Metabolite_105">
          <BoundingBox>
            <Position x="1438.39" y="1035.48"/>
            <Dimensions width="105" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_38" name="sGlyph_34" metabolite="Metabolite_107">
          <BoundingBox>
            <Position x="261.472" y="282.176"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_39" name="sGlyph_35" metabolite="Metabolite_109">
          <BoundingBox>
            <Position x="250.838" y="475.618"/>
            <Dimensions width="81" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_40" name="sGlyph_36" metabolite="Metabolite_111">
          <BoundingBox>
            <Position x="337.578" y="558.314"/>
            <Dimensions width="129" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_41" name="sGlyph_37" metabolite="Metabolite_113">
          <BoundingBox>
            <Position x="530.639" y="288.053"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_42" name="sGlyph_38" metabolite="Metabolite_115">
          <BoundingBox>
            <Position x="526.913" y="445.293"/>
            <Dimensions width="81" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_43" name="sGlyph_39" metabolite="Metabolite_117">
          <BoundingBox>
            <Position x="784.3579999999999" y="221.535"/>
            <Dimensions width="57" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_44" name="sGlyph_40" metabolite="Metabolite_119">
          <BoundingBox>
            <Position x="711.772" y="465.414"/>
            <Dimensions width="57" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_45" name="sGlyph_41" metabolite="Metabolite_121">
          <BoundingBox>
            <Position x="887.271" y="487.647"/>
            <Dimensions width="73" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_46" name="sGlyph_42" metabolite="Metabolite_123">
          <BoundingBox>
            <Position x="972.36" y="316.227"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_47" name="sGlyph_43" metabolite="Metabolite_125">
          <BoundingBox>
            <Position x="964.89" y="477.479"/>
            <Dimensions width="81" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_48" name="sGlyph_44" metabolite="Metabolite_127">
          <BoundingBox>
            <Position x="1539.72" y="220.078"/>
            <Dimensions width="129" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_49" name="sGlyph_45" metabolite="Metabolite_129">
          <BoundingBox>
            <Position x="1694.04" y="651.538"/>
            <Dimensions width="57" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_50" name="sGlyph_46" metabolite="Metabolite_131">
          <BoundingBox>
            <Position x="1664.26" y="980.487"/>
            <Dimensions width="57" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_51" name="sGlyph_47" metabolite="Metabolite_133">
          <BoundingBox>
            <Position x="1502.73" y="1396.6"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_52" name="sGlyph_48" metabolite="Metabolite_135">
          <BoundingBox>
            <Position x="1471.97" y="1228.97"/>
            <Dimensions width="121" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_53" name="sGlyph_49" metabolite="Metabolite_137">
          <BoundingBox>
            <Position x="1355.9" y="1311.48"/>
            <Dimensions width="81" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_54" name="sGlyph_50" metabolite="Metabolite_139">
          <BoundingBox>
            <Position x="1360.83" y="1465.5"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_55" name="sGlyph_51" metabolite="Metabolite_141">
          <BoundingBox>
            <Position x="972.395" y="1329.58"/>
            <Dimensions width="81" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_56" name="sGlyph_52" metabolite="Metabolite_143">
          <BoundingBox>
            <Position x="975.404" y="1473.92"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_57" name="sGlyph_53" metabolite="Metabolite_145">
          <BoundingBox>
            <Position x="1079.78" y="1401.2"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_58" name="sGlyph_54" metabolite="Metabolite_147">
          <BoundingBox>
            <Position x="918.996" y="694.396"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_59" name="sGlyph_55" metabolite="Metabolite_149">
          <BoundingBox>
            <Position x="709.426" y="582.006"/>
            <Dimensions width="105" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_60" name="sGlyph_56" metabolite="Metabolite_151">
          <BoundingBox>
            <Position x="887.162" y="853.63"/>
            <Dimensions width="73" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_61" name="sGlyph_57" metabolite="Metabolite_153">
          <BoundingBox>
            <Position x="627.962" y="856.061"/>
            <Dimensions width="57" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_62" name="sGlyph_58" metabolite="Metabolite_155">
          <BoundingBox>
            <Position x="516.722" y="1311.11"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_63" name="sGlyph_59" metabolite="Metabolite_157">
          <BoundingBox>
            <Position x="504.088" y="1128.85"/>
            <Dimensions width="81" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_64" name="sGlyph_60" metabolite="Metabolite_159">
          <BoundingBox>
            <Position x="370.399" y="1218.13"/>
            <Dimensions width="81" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_65" name="sGlyph_61" metabolite="Metabolite_161">
          <BoundingBox>
            <Position x="382.395" y="1406.2"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_66" name="sGlyph_62" metabolite="Metabolite_163">
          <BoundingBox>
            <Position x="2134.77" y="1380.97"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_67" name="sGlyph_63" metabolite="Metabolite_165">
          <BoundingBox>
            <Position x="1877.09" y="1383.77"/>
            <Dimensions width="81" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_68" name="sGlyph_64" metabolite="Metabolite_167">
          <BoundingBox>
            <Position x="2136.86" y="1209.88"/>
            <Dimensions width="73" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_69" name="sGlyph_65" metabolite="Metabolite_169">
          <BoundingBox>
            <Position x="1045.9" y="1222.97"/>
            <Dimensions width="153" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_70" name="sGlyph_66" metabolite="Metabolite_171">
          <BoundingBox>
            <Position x="1401.85" y="192.939"/>
            <Dimensions width="49" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_71" name="sGlyph_67" metabolite="Metabolite_173">
          <BoundingBox>
            <Position x="1405.3" y="252.271"/>
            <Dimensions width="49" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_72" name="sGlyph_68" metabolite="Metabolite_175">
          <BoundingBox>
            <Position x="338.133" y="405.846"/>
            <Dimensions width="49" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_73" name="sGlyph_69" metabolite="Metabolite_177">
          <BoundingBox>
            <Position x="411.195" y="406.029"/>
            <Dimensions width="49" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_74" name="sGlyph_700" metabolite="Metabolite_1">
          <BoundingBox>
            <Position x="782.744" y="59.0314"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_75" name="sGlyph_701" metabolite="Metabolite_3">
          <BoundingBox>
            <Position x="387.602" y="60.9671"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_76" name="sGlyph_702" metabolite="Metabolite_5">
          <BoundingBox>
            <Position x="1197.18" y="58.0995"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_77" name="sGlyph_703" metabolite="Metabolite_7">
          <BoundingBox>
            <Position x="1564.22" y="50"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_78" name="sGlyph_704" metabolite="Metabolite_9">
          <BoundingBox>
            <Position x="310.433" y="1630.83"/>
            <Dimensions width="57" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_79" name="sGlyph_705" metabolite="Metabolite_11">
          <BoundingBox>
            <Position x="542.614" y="1636.94"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_80" name="sGlyph_706" metabolite="Metabolite_13">
          <BoundingBox>
            <Position x="805.669" y="1634.92"/>
            <Dimensions width="57" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_81" name="sGlyph_707" metabolite="Metabolite_15">
          <BoundingBox>
            <Position x="1191.9" y="1625.16"/>
            <Dimensions width="57" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
        <MetaboliteGlyph key="Layout_82" name="sGlyph_708" metabolite="Metabolite_21">
          <BoundingBox>
            <Position x="98.2791" y="59.9667"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </MetaboliteGlyph>
      </ListOfMetabGlyphs>
      <ListOfReactionGlyphs>
        <ReactionGlyph key="Layout_83" name="rGlyph_0" reaction="Reaction_0">
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="178.015" y="293.448"/>
                <End x="178.015" y="293.448"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_84" name="curve00" metaboliteGlyph="Layout_30" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="148.069" y="237.537"/>
                    <End x="178.015" y="293.448"/>
                    <BasePoint1 x="157.512" y="255.167"/>
                    <BasePoint2 x="178.843" y="268.462"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_85" name="curve01" metaboliteGlyph="Layout_29" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="212.668" y="237.232"/>
                    <End x="178.015" y="293.448"/>
                    <BasePoint1 x="202.173" y="254.257"/>
                    <BasePoint2 x="178.843" y="268.462"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_86" name="curve00" metaboliteGlyph="Layout_28" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="178.015" y="293.448"/>
                    <End x="178.643" y="357.455"/>
                    <BasePoint1 x="177.188" y="318.435"/>
                    <BasePoint2 x="178.447" y="337.456"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_87" name="curve00" metaboliteGlyph="Layout_64" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="405.6" y="1207.74"/>
                    <End x="181.635" y="308.005"/>
                    <BasePoint1 x="405.6" y="1207.74"/>
                    <BasePoint2 x="182.842" y="312.857"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_88" name="rGlyph_1" reaction="Reaction_1">
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="294.015" y="382.448"/>
                <End x="294.015" y="382.448"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_89" name="curve10" metaboliteGlyph="Layout_38" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="295.09" y="317.448"/>
                    <End x="294.015" y="382.448"/>
                    <BasePoint1 x="294.759" y="337.445"/>
                    <BasePoint2 x="295.388" y="357.486"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_90" name="curve10" metaboliteGlyph="Layout_39" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="294.015" y="382.448"/>
                    <End x="292.961" y="466.448"/>
                    <BasePoint1 x="292.643" y="407.411"/>
                    <BasePoint2 x="293.212" y="446.45"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_91" name="curve10" metaboliteGlyph="Layout_28" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="241.015" y="381.56"/>
                    <End x="279.02" y="382.057"/>
                    <BasePoint1 x="241.015" y="381.56"/>
                    <BasePoint2 x="274.022" y="381.927"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_92" name="rGlyph_2" reaction="Reaction_2">
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="418.015" y="146.448"/>
                <End x="418.015" y="146.448"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_93" name="curve20" metaboliteGlyph="Layout_75" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="420.192" y="96.4143"/>
                    <End x="418.015" y="146.448"/>
                    <BasePoint1 x="419.322" y="116.395"/>
                    <BasePoint2 x="418.122" y="121.449"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_94" name="curve20" metaboliteGlyph="Layout_27" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="418.015" y="146.448"/>
                    <End x="417.278" y="195.452"/>
                    <BasePoint1 x="417.908" y="171.448"/>
                    <BasePoint2 x="417.579" y="175.454"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_95" name="rGlyph_3" reaction="Reaction_3">
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="457.015" y="269.448"/>
                <End x="457.015" y="269.448"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_96" name="curve30" metaboliteGlyph="Layout_27" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="444.579" y="235.611"/>
                    <End x="457.015" y="269.448"/>
                    <BasePoint1 x="451.479" y="254.384"/>
                    <BasePoint2 x="459.431" y="244.565"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_97" name="curve31" metaboliteGlyph="Layout_26" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="476.117" y="236.011"/>
                    <End x="457.015" y="269.448"/>
                    <BasePoint1 x="466.196" y="253.377"/>
                    <BasePoint2 x="459.431" y="244.565"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_98" name="curve30" metaboliteGlyph="Layout_25" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="457.015" y="269.448"/>
                    <End x="456.577" y="339.458"/>
                    <BasePoint1 x="454.599" y="294.331"/>
                    <BasePoint2 x="456.702" y="319.458"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_99" name="curve30" metaboliteGlyph="Layout_64" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="412.489" y="1207.46"/>
                    <End x="456.298" y="284.431"/>
                    <BasePoint1 x="412.489" y="1207.46"/>
                    <BasePoint2 x="456.059" y="289.425"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_100" name="curve31" metaboliteGlyph="Layout_67" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1893.1" y="1377.34"/>
                    <End x="468.893" y="278.609"/>
                    <BasePoint1 x="1893.1" y="1377.34"/>
                    <BasePoint2 x="472.852" y="281.662"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_101" name="rGlyph_4" reaction="Reaction_4">
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="401.015" y="492.448"/>
                <End x="401.015" y="492.448"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_102" name="curve40" metaboliteGlyph="Layout_72" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="379.084" y="439.397"/>
                    <End x="401.015" y="492.448"/>
                    <BasePoint1 x="386.725" y="457.879"/>
                    <BasePoint2 x="400.505" y="467.454"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_103" name="curve41" metaboliteGlyph="Layout_73" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="421.944" y="439.394"/>
                    <End x="401.015" y="492.448"/>
                    <BasePoint1 x="414.605" y="457.999"/>
                    <BasePoint2 x="400.505" y="467.454"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_104" name="curve40" metaboliteGlyph="Layout_40" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="401.015" y="492.448"/>
                    <End x="402.652" y="548.455"/>
                    <BasePoint1 x="401.525" y="517.443"/>
                    <BasePoint2 x="402.068" y="528.463"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_105" name="curve40" metaboliteGlyph="Layout_67" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1888.42" y="1378.33"/>
                    <End x="413.902" y="500.124"/>
                    <BasePoint1 x="1888.42" y="1378.33"/>
                    <BasePoint2 x="418.198" y="502.683"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_106" name="curve41" metaboliteGlyph="Layout_69" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1102.05" y="1215.27"/>
                    <End x="411.461" y="503.213"/>
                    <BasePoint1 x="1102.05" y="1215.27"/>
                    <BasePoint2 x="414.943" y="506.801"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_107" name="curve42" metaboliteGlyph="Layout_39" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="342.012" y="490.707"/>
                    <End x="386.025" y="491.898"/>
                    <BasePoint1 x="342.012" y="490.707"/>
                    <BasePoint2 x="381.029" y="491.715"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_108" name="rGlyph_5" reaction="Reaction_5">
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="569.015" y="362.448"/>
                <End x="569.015" y="362.448"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_109" name="curve50" metaboliteGlyph="Layout_41" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="567.495" y="323.338"/>
                    <End x="569.015" y="362.448"/>
                    <BasePoint1 x="568.272" y="343.323"/>
                    <BasePoint2 x="569.607" y="337.455"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_110" name="curve50" metaboliteGlyph="Layout_42" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="569.015" y="362.448"/>
                    <End x="568.913" y="435.449"/>
                    <BasePoint1 x="568.423" y="387.441"/>
                    <BasePoint2 x="568.941" y="415.449"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_111" name="curve50" metaboliteGlyph="Layout_32" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1230.03" y="392.001"/>
                    <End x="584.001" y="363.111"/>
                    <BasePoint1 x="1230.03" y="392.001"/>
                    <BasePoint2 x="588.996" y="363.331"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_112" name="curve51" metaboliteGlyph="Layout_63" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="546.3150000000001" y="1118.45"/>
                    <End x="568.553" y="377.441"/>
                    <BasePoint1 x="546.3150000000001" y="1118.45"/>
                    <BasePoint2 x="568.399" y="382.439"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_113" name="curve52" metaboliteGlyph="Layout_25" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="519.015" y="362.404"/>
                    <End x="554.016" y="362.314"/>
                    <BasePoint1 x="519.015" y="362.404"/>
                    <BasePoint2 x="549.016" y="362.27"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_114" name="curve53" metaboliteGlyph="Layout_35" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1600.02" y="385.227"/>
                    <End x="584.0119999999999" y="362.778"/>
                    <BasePoint1 x="1600.02" y="385.227"/>
                    <BasePoint2 x="589.01" y="362.887"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_115" name="rGlyph_6" reaction="Reaction_6">
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="862.015" y="292.448"/>
                <End x="862.015" y="292.448"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_116" name="curve60" metaboliteGlyph="Layout_43" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="837.484" y="252.766"/>
                    <End x="862.015" y="292.448"/>
                    <BasePoint1 x="848.001" y="269.777"/>
                    <BasePoint2 x="860.91" y="267.473"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_117" name="curve61" metaboliteGlyph="Layout_24" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="879.688" y="254.986"/>
                    <End x="862.015" y="292.448"/>
                    <BasePoint1 x="871.155" y="273.074"/>
                    <BasePoint2 x="860.91" y="267.473"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_118" name="curve60" metaboliteGlyph="Layout_23" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="862.015" y="292.448"/>
                    <End x="854.424" y="378.548"/>
                    <BasePoint1 x="863.12" y="317.424"/>
                    <BasePoint2 x="856.1799999999999" y="358.625"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_119" name="curve60" metaboliteGlyph="Layout_59" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="770.127" y="572.9450000000001"/>
                    <End x="857.314" y="306.693"/>
                    <BasePoint1 x="770.127" y="572.9450000000001"/>
                    <BasePoint2 x="855.747" y="311.441"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_120" name="rGlyph_7" reaction="Reaction_7">
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="813.015" y="153.448"/>
                <End x="813.015" y="153.448"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_121" name="curve70" metaboliteGlyph="Layout_74" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="813.732" y="94.4443"/>
                    <End x="813.015" y="153.448"/>
                    <BasePoint1 x="813.489" y="114.443"/>
                    <BasePoint2 x="812.7670000000001" y="128.45"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_122" name="curve70" metaboliteGlyph="Layout_43" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="813.015" y="153.448"/>
                    <End x="812.299" y="212.452"/>
                    <BasePoint1 x="813.263" y="178.447"/>
                    <BasePoint2 x="812.542" y="192.454"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_123" name="rGlyph_8" reaction="Reaction_8">
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="1006.02" y="399.448"/>
                <End x="1006.02" y="399.448"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_124" name="curve80" metaboliteGlyph="Layout_46" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1004.97" y="351.403"/>
                    <End x="1006.02" y="399.448"/>
                    <BasePoint1 x="1005.4" y="371.398"/>
                    <BasePoint2 x="1007.17" y="374.475"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_125" name="curve80" metaboliteGlyph="Layout_47" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1006.02" y="399.448"/>
                    <End x="1004.17" y="468.45"/>
                    <BasePoint1 x="1004.86" y="424.422"/>
                    <BasePoint2 x="1004.71" y="448.457"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_126" name="curve80" metaboliteGlyph="Layout_67" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1899.27" y="1376.07"/>
                    <End x="1016.14" y="410.517"/>
                    <BasePoint1 x="1899.27" y="1376.07"/>
                    <BasePoint2 x="1019.51" y="414.206"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_127" name="curve81" metaboliteGlyph="Layout_32" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1230.02" y="395.619"/>
                    <End x="1021.01" y="399.187"/>
                    <BasePoint1 x="1230.02" y="395.619"/>
                    <BasePoint2 x="1026.01" y="399.1"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_128" name="curve82" metaboliteGlyph="Layout_23" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="915.013" y="401.234"/>
                    <End x="991.0170000000001" y="399.643"/>
                    <BasePoint1 x="915.013" y="401.234"/>
                    <BasePoint2 x="986.0170000000001" y="399.708"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_129" name="curve83" metaboliteGlyph="Layout_45" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="939.356" y="480.715"/>
                    <End x="996.492" y="411.037"/>
                    <BasePoint1 x="939.356" y="480.715"/>
                    <BasePoint2 x="993.317" y="414.9"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_130" name="rGlyph_9" reaction="Reaction_9">
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="735.015" y="232.448"/>
                <End x="735.015" y="232.448"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_131" name="curve90" metaboliteGlyph="Layout_8" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="700.014" y="232.315"/>
                    <End x="735.015" y="232.448"/>
                    <BasePoint1 x="720.014" y="232.391"/>
                    <BasePoint2 x="710.0170000000001" y="232.181"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_132" name="curve90" metaboliteGlyph="Layout_43" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="735.015" y="232.448"/>
                    <End x="775.039" y="233.757"/>
                    <BasePoint1 x="760.014" y="232.716"/>
                    <BasePoint2 x="755.05" y="233.103"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_133" name="curve90" metaboliteGlyph="Layout_53" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1382.84" y="1302.89"/>
                    <End x="742.788" y="245.277"/>
                    <BasePoint1 x="1382.84" y="1302.89"/>
                    <BasePoint2 x="745.379" y="249.554"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_134" name="curve91" metaboliteGlyph="Layout_67" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1897.89" y="1376.44"/>
                    <End x="745.707" y="242.969"/>
                    <BasePoint1 x="1897.89" y="1376.44"/>
                    <BasePoint2 x="749.271" y="246.475"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_135" name="curve92" metaboliteGlyph="Layout_42" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="583.948" y="437.398"/>
                    <End x="726.101" y="244.512"/>
                    <BasePoint1 x="583.948" y="437.398"/>
                    <BasePoint2 x="723.129" y="248.533"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_136" name="curve93" metaboliteGlyph="Layout_40" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="423.009" y="551.301"/>
                    <End x="724.52" y="243.165"/>
                    <BasePoint1 x="423.009" y="551.301"/>
                    <BasePoint2 x="721.021" y="246.737"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_137" name="curve94" metaboliteGlyph="Layout_60" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="916.179" y="844.859"/>
                    <End x="739.28" y="246.829"/>
                    <BasePoint1 x="916.179" y="844.859"/>
                    <BasePoint2 x="740.701" y="251.623"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_138" name="rGlyph_10" reaction="Reaction_10">
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="831.015" y="869.448"/>
                <End x="831.015" y="869.448"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_139" name="curve100" metaboliteGlyph="Layout_61" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="695.015" y="870.385"/>
                    <End x="831.015" y="869.448"/>
                    <BasePoint1 x="715.015" y="870.247"/>
                    <BasePoint2 x="806.016" y="869.683"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_140" name="curve100" metaboliteGlyph="Layout_60" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="831.015" y="869.448"/>
                    <End x="877.018" y="868.6950000000001"/>
                    <BasePoint1 x="856.014" y="869.2140000000001"/>
                    <BasePoint2 x="857.021" y="869.023"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_141" name="curve100" metaboliteGlyph="Layout_63" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="565.27" y="1121.57"/>
                    <End x="820.127" y="879.766"/>
                    <BasePoint1 x="565.27" y="1121.57"/>
                    <BasePoint2 x="816.498" y="883.205"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_142" name="curve101" metaboliteGlyph="Layout_14" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="638.671" y="1359.14"/>
                    <End x="825.525" y="883.407"/>
                    <BasePoint1 x="638.671" y="1359.14"/>
                    <BasePoint2 x="823.694" y="888.0599999999999"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_143" name="curve102" metaboliteGlyph="Layout_53" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1373.22" y="1305.18"/>
                    <End x="842.708" y="878.8440000000001"/>
                    <BasePoint1 x="1373.22" y="1305.18"/>
                    <BasePoint2 x="846.606" y="881.976"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_144" name="curve103" metaboliteGlyph="Layout_41" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="574.264" y="322.501"/>
                    <End x="824.634" y="855.873"/>
                    <BasePoint1 x="574.264" y="322.501"/>
                    <BasePoint2 x="822.5069999999999" y="851.348"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_145" name="curve104" metaboliteGlyph="Layout_47" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="994.8440000000001" y="512.537"/>
                    <End x="837.274" y="855.816"/>
                    <BasePoint1 x="994.8440000000001" y="512.537"/>
                    <BasePoint2 x="839.36" y="851.272"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_146" name="curve105" metaboliteGlyph="Layout_60" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="877.016" y="868.545"/>
                    <End x="846.0069999999999" y="868.9589999999999"/>
                    <BasePoint1 x="877.016" y="868.545"/>
                    <BasePoint2 x="851.005" y="868.796"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_147" name="rGlyph_11" reaction="Reaction_11">
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="854.015" y="497.448"/>
                <End x="854.015" y="497.448"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_148" name="curve110" metaboliteGlyph="Layout_44" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="778.856" y="485.223"/>
                    <End x="854.015" y="497.448"/>
                    <BasePoint1 x="798.597" y="488.434"/>
                    <BasePoint2 x="829.213" y="494.306"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_149" name="curve110" metaboliteGlyph="Layout_45" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="854.015" y="497.448"/>
                    <End x="877.0700000000001" y="500.407"/>
                    <BasePoint1 x="878.817" y="500.59"/>
                    <BasePoint2 x="857.232" y="497.861"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_150" name="curve110" metaboliteGlyph="Layout_67" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1895.38" y="1377"/>
                    <End x="865.474" y="507.128"/>
                    <BasePoint1 x="1895.38" y="1377"/>
                    <BasePoint2 x="869.293" y="510.355"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_151" name="curve111" metaboliteGlyph="Layout_59" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="781.8150000000001" y="575.116"/>
                    <End x="843.749" y="508.384"/>
                    <BasePoint1 x="781.8150000000001" y="575.116"/>
                    <BasePoint2 x="840.327" y="512.03"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_152" name="curve112" metaboliteGlyph="Layout_23" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="852.263" y="423.445"/>
                    <End x="853.703" y="482.452"/>
                    <BasePoint1 x="852.263" y="423.445"/>
                    <BasePoint2 x="853.599" y="477.453"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_153" name="rGlyph_12" reaction="Reaction_12">
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="814.015" y="676.448"/>
                <End x="814.015" y="676.448"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_154" name="curve120" metaboliteGlyph="Layout_58" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="908.162" y="700.7430000000001"/>
                    <End x="814.015" y="676.448"/>
                    <BasePoint1 x="888.796" y="695.746"/>
                    <BasePoint2 x="836.047" y="688.264"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_155" name="curve120" metaboliteGlyph="Layout_59" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="814.015" y="676.448"/>
                    <End x="771.881" y="616.671"/>
                    <BasePoint1 x="791.984" y="664.633"/>
                    <BasePoint2 x="783.403" y="633.018"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_156" name="curve120" metaboliteGlyph="Layout_47" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="984.8440000000001" y="510.417"/>
                    <End x="824.7619999999999" y="665.9829999999999"/>
                    <BasePoint1 x="984.8440000000001" y="510.417"/>
                    <BasePoint2 x="828.3440000000001" y="662.495"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_157" name="curve121" metaboliteGlyph="Layout_60" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="910.085" y="845.748"/>
                    <End x="821.479" y="689.4589999999999"/>
                    <BasePoint1 x="910.085" y="845.748"/>
                    <BasePoint2 x="823.968" y="693.796"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_158" name="rGlyph_13" reaction="Reaction_13">
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="337.015" y="1584.45"/>
                <End x="337.015" y="1584.45"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_159" name="curve130" metaboliteGlyph="Layout_78" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="337.884" y="1620.51"/>
                    <End x="337.015" y="1584.45"/>
                    <BasePoint1 x="337.402" y="1600.52"/>
                    <BasePoint2 x="336.623" y="1609.45"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_160" name="curve130" metaboliteGlyph="Layout_22" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="337.015" y="1584.45"/>
                    <End x="337.877" y="1525.45"/>
                    <BasePoint1 x="337.407" y="1559.45"/>
                    <BasePoint2 x="337.585" y="1545.45"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_161" name="rGlyph_14" reaction="Reaction_14">
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="261.015" y="1444.45"/>
                <End x="261.015" y="1444.45"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_162" name="curve140" metaboliteGlyph="Layout_22" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="303.789" y="1487.59"/>
                    <End x="261.015" y="1444.45"/>
                    <BasePoint1 x="289.708" y="1473.39"/>
                    <BasePoint2 x="260.352" y="1469.44"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_163" name="curve141" metaboliteGlyph="Layout_21" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="219.431" y="1484.08"/>
                    <End x="261.015" y="1444.45"/>
                    <BasePoint1 x="233.909" y="1470.28"/>
                    <BasePoint2 x="260.352" y="1469.44"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_164" name="curve140" metaboliteGlyph="Layout_20" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="261.015" y="1444.45"/>
                    <End x="258.732" y="1378.42"/>
                    <BasePoint1 x="261.679" y="1419.46"/>
                    <BasePoint2 x="259.423" y="1398.41"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_165" name="curve140" metaboliteGlyph="Layout_59" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="750.925" y="616.056"/>
                    <End x="268.639" y="1431.53"/>
                    <BasePoint1 x="750.925" y="616.056"/>
                    <BasePoint2 x="271.18" y="1427.22"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_166" name="rGlyph_15" reaction="Reaction_15">
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="413.015" y="1498.45"/>
                <End x="413.015" y="1498.45"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_167" name="curve150" metaboliteGlyph="Layout_10" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="443.035" y="1498.82"/>
                    <End x="413.015" y="1498.45"/>
                    <BasePoint1 x="423.036" y="1498.57"/>
                    <BasePoint2 x="438.015" y="1498.51"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_168" name="curve150" metaboliteGlyph="Layout_22" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="413.015" y="1498.45"/>
                    <End x="371.984" y="1499.66"/>
                    <BasePoint1 x="388.015" y="1498.39"/>
                    <BasePoint2 x="391.975" y="1499.07"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_169" name="curve150" metaboliteGlyph="Layout_47" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="991.953" y="512.073"/>
                    <End x="420.612" y="1485.51"/>
                    <BasePoint1 x="991.953" y="512.073"/>
                    <BasePoint2 x="423.144" y="1481.2"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_170" name="curve151" metaboliteGlyph="Layout_22" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="372.001" y="1500.91"/>
                    <End x="398.048" y="1499.45"/>
                    <BasePoint1 x="372.001" y="1500.91"/>
                    <BasePoint2 x="393.06" y="1499.78"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_171" name="curve152" metaboliteGlyph="Layout_63" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="537.5359999999999" y="1162.82"/>
                    <End x="418.204" y="1484.37"/>
                    <BasePoint1 x="537.5359999999999" y="1162.82"/>
                    <BasePoint2 x="419.934" y="1479.68"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_172" name="curve153" metaboliteGlyph="Layout_55" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="962.3440000000001" y="1353.99"/>
                    <End x="427.525" y="1494.65"/>
                    <BasePoint1 x="962.3440000000001" y="1353.99"/>
                    <BasePoint2 x="432.362" y="1493.38"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_173" name="rGlyph_16" reaction="Reaction_16">
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="551.015" y="1233.45"/>
                <End x="551.015" y="1233.45"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_174" name="curve160" metaboliteGlyph="Layout_62" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="551.347" y="1300.45"/>
                    <End x="551.015" y="1233.45"/>
                    <BasePoint1 x="551.248" y="1280.45"/>
                    <BasePoint2 x="552.744" y="1258.39"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_175" name="curve160" metaboliteGlyph="Layout_63" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="551.015" y="1233.45"/>
                    <End x="546.6079999999999" y="1163.43"/>
                    <BasePoint1 x="549.2859999999999" y="1208.51"/>
                    <BasePoint2 x="547.865" y="1183.39"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_176" name="curve160" metaboliteGlyph="Layout_60" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="902.895" y="886.47"/>
                    <End x="561.693" y="1222.91"/>
                    <BasePoint1 x="902.895" y="886.47"/>
                    <BasePoint2 x="565.253" y="1219.4"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_177" name="curve161" metaboliteGlyph="Layout_53" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1345.07" y="1317.4"/>
                    <End x="565.931" y="1235.04"/>
                    <BasePoint1 x="1345.07" y="1317.4"/>
                    <BasePoint2 x="570.903" y="1235.57"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_178" name="curve162" metaboliteGlyph="Layout_14" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="619.255" y="1359.65"/>
                    <End x="558.116" y="1246.66"/>
                    <BasePoint1 x="619.255" y="1359.65"/>
                    <BasePoint2 x="560.4829999999999" y="1251.07"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_179" name="curve163" metaboliteGlyph="Layout_64" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="462.01" y="1230.77"/>
                    <End x="536.019" y="1233.13"/>
                    <BasePoint1 x="462.01" y="1230.77"/>
                    <BasePoint2 x="531.02" y="1233.02"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_180" name="curve164" metaboliteGlyph="Layout_67" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1867.08" y="1389.27"/>
                    <End x="565.9109999999999" y="1235.21"/>
                    <BasePoint1 x="1867.08" y="1389.27"/>
                    <BasePoint2 x="570.876" y="1235.8"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_181" name="rGlyph_17" reaction="Reaction_17">
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="416.015" y="1350.45"/>
                <End x="416.015" y="1350.45"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_182" name="curve170" metaboliteGlyph="Layout_65" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="416.544" y="1395.46"/>
                    <End x="416.015" y="1350.45"/>
                    <BasePoint1 x="416.309" y="1375.46"/>
                    <BasePoint2 x="417.607" y="1375.4"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_183" name="curve170" metaboliteGlyph="Layout_64" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="416.015" y="1350.45"/>
                    <End x="412.305" y="1252.44"/>
                    <BasePoint1 x="414.424" y="1325.5"/>
                    <BasePoint2 x="413.062" y="1272.43"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_184" name="curve170" metaboliteGlyph="Layout_20" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="312.009" y="1354.1"/>
                    <End x="401.026" y="1351.01"/>
                    <BasePoint1 x="312.009" y="1354.1"/>
                    <BasePoint2 x="396.029" y="1351.2"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_185" name="rGlyph_18" reaction="Reaction_18">
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="883.015" y="1472.45"/>
                <End x="883.015" y="1472.45"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_186" name="curve180" metaboliteGlyph="Layout_19" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="864.115" y="1506.3"/>
                    <End x="883.015" y="1472.45"/>
                    <BasePoint1 x="873.864" y="1488.84"/>
                    <BasePoint2 x="883.559" y="1497.44"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_187" name="curve181" metaboliteGlyph="Layout_18" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="899.374" y="1501.79"/>
                    <End x="883.015" y="1472.45"/>
                    <BasePoint1 x="889.636" y="1484.33"/>
                    <BasePoint2 x="883.559" y="1497.44"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_188" name="curve180" metaboliteGlyph="Layout_17" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="883.015" y="1472.45"/>
                    <End x="882.8049999999999" y="1449.29"/>
                    <BasePoint1 x="882.472" y="1447.45"/>
                    <BasePoint2 x="882.987" y="1469.29"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_189" name="rGlyph_19" reaction="Reaction_19">
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="1008.02" y="1421.45"/>
                <End x="1008.02" y="1421.45"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_190" name="curve190" metaboliteGlyph="Layout_56" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1007.58" y="1463.46"/>
                    <End x="1008.02" y="1421.45"/>
                    <BasePoint1 x="1007.79" y="1443.47"/>
                    <BasePoint2 x="1008.54" y="1446.44"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_191" name="curve190" metaboliteGlyph="Layout_55" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1008.02" y="1421.45"/>
                    <End x="1009.42" y="1364.43"/>
                    <BasePoint1 x="1007.49" y="1396.45"/>
                    <BasePoint2 x="1008.92" y="1384.42"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_192" name="curve190" metaboliteGlyph="Layout_17" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="934.009" y="1424.1"/>
                    <End x="993.027" y="1422.03"/>
                    <BasePoint1 x="934.009" y="1424.1"/>
                    <BasePoint2 x="988.03" y="1422.22"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_193" name="rGlyph_20" reaction="Reaction_20">
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="1120.02" y="1321.45"/>
                <End x="1120.02" y="1321.45"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_194" name="curve200" metaboliteGlyph="Layout_57" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1115.94" y="1390.63"/>
                    <End x="1120.02" y="1321.45"/>
                    <BasePoint1 x="1117.11" y="1370.67"/>
                    <BasePoint2 x="1124.68" y="1346.01"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_195" name="curve200" metaboliteGlyph="Layout_69" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1120.02" y="1321.45"/>
                    <End x="1119.08" y="1257.4"/>
                    <BasePoint1 x="1115.35" y="1296.89"/>
                    <BasePoint2 x="1119.37" y="1277.4"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_196" name="curve200" metaboliteGlyph="Layout_64" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="461.933" y="1236.73"/>
                    <End x="1105.14" y="1319.54"/>
                    <BasePoint1 x="461.933" y="1236.73"/>
                    <BasePoint2 x="1100.18" y="1318.9"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_197" name="curve201" metaboliteGlyph="Layout_53" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1345.02" y="1322.41"/>
                    <End x="1135.01" y="1321.56"/>
                    <BasePoint1 x="1345.02" y="1322.41"/>
                    <BasePoint2 x="1140.01" y="1321.59"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_198" name="curve202" metaboliteGlyph="Layout_11" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1228.73" y="1394.85"/>
                    <End x="1132.45" y="1329.83"/>
                    <BasePoint1 x="1228.73" y="1394.85"/>
                    <BasePoint2 x="1136.6" y="1332.63"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_199" name="curve203" metaboliteGlyph="Layout_14" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="691.946" y="1372.27"/>
                    <End x="1105.12" y="1323.24"/>
                    <BasePoint1 x="691.946" y="1372.27"/>
                    <BasePoint2 x="1100.16" y="1323.84"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_200" name="curve204" metaboliteGlyph="Layout_47" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1007.4" y="513.353"/>
                    <End x="1117.96" y="1306.59"/>
                    <BasePoint1 x="1007.4" y="513.353"/>
                    <BasePoint2 x="1117.27" y="1301.64"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_201" name="curve205" metaboliteGlyph="Layout_55" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1062.86" y="1331.71"/>
                    <End x="1105.27" y="1324.18"/>
                    <BasePoint1 x="1062.86" y="1331.71"/>
                    <BasePoint2 x="1100.35" y="1325.09"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_202" name="curve206" metaboliteGlyph="Layout_67" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1867.06" y="1390.53"/>
                    <End x="1134.95" y="1322.84"/>
                    <BasePoint1 x="1867.06" y="1390.53"/>
                    <BasePoint2 x="1139.93" y="1323.3"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_203" name="rGlyph_21" reaction="Reaction_21">
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="627.015" y="1452.45"/>
                <End x="627.015" y="1452.45"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_204" name="curve210" metaboliteGlyph="Layout_16" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="596.275" y="1495.81"/>
                    <End x="627.015" y="1452.45"/>
                    <BasePoint1 x="607.841" y="1479.49"/>
                    <BasePoint2 x="623.534" y="1477.2"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_205" name="curve211" metaboliteGlyph="Layout_15" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="647.804" y="1500.52"/>
                    <End x="627.015" y="1452.45"/>
                    <BasePoint1 x="639.865" y="1482.16"/>
                    <BasePoint2 x="623.534" y="1477.2"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_206" name="curve210" metaboliteGlyph="Layout_14" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="627.015" y="1452.45"/>
                    <End x="630.864" y="1403.45"/>
                    <BasePoint1 x="630.497" y="1427.69"/>
                    <BasePoint2 x="629.298" y="1423.39"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_207" name="rGlyph_22" reaction="Reaction_22">
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="1261.02" y="1467.45"/>
                <End x="1261.02" y="1467.45"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_208" name="curve220" metaboliteGlyph="Layout_13" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1241.08" y="1506.54"/>
                    <End x="1261.02" y="1467.45"/>
                    <BasePoint1 x="1250.17" y="1488.72"/>
                    <BasePoint2 x="1260.35" y="1492.44"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_209" name="curve221" metaboliteGlyph="Layout_12" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1276.06" y="1504.39"/>
                    <End x="1261.02" y="1467.45"/>
                    <BasePoint1 x="1268.52" y="1485.87"/>
                    <BasePoint2 x="1260.35" y="1492.44"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_210" name="curve220" metaboliteGlyph="Layout_11" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1261.02" y="1467.45"/>
                    <End x="1259.66" y="1435.09"/>
                    <BasePoint1 x="1261.68" y="1442.46"/>
                    <BasePoint2 x="1260.5" y="1455.07"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_211" name="rGlyph_23" reaction="Reaction_23">
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="1391.02" y="1415.45"/>
                <End x="1391.02" y="1415.45"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_212" name="curve230" metaboliteGlyph="Layout_54" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1391.93" y="1455.45"/>
                    <End x="1391.02" y="1415.45"/>
                    <BasePoint1 x="1391.48" y="1435.45"/>
                    <BasePoint2 x="1391.81" y="1440.44"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_213" name="curve230" metaboliteGlyph="Layout_53" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1391.02" y="1415.45"/>
                    <End x="1393.31" y="1346.42"/>
                    <BasePoint1 x="1390.22" y="1390.46"/>
                    <BasePoint2 x="1392.65" y="1366.41"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_214" name="curve230" metaboliteGlyph="Layout_67" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1867.02" y="1396.84"/>
                    <End x="1406" y="1414.88"/>
                    <BasePoint1 x="1867.02" y="1396.84"/>
                    <BasePoint2 x="1411" y="1414.69"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_215" name="curve231" metaboliteGlyph="Layout_32" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1294.97" y="416.402"/>
                    <End x="1389.58" y="1400.52"/>
                    <BasePoint1 x="1294.97" y="416.402"/>
                    <BasePoint2 x="1389.1" y="1395.54"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_216" name="curve232" metaboliteGlyph="Layout_35" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1655.48" y="408.121"/>
                    <End x="1394.84" y="1400.94"/>
                    <BasePoint1 x="1655.48" y="408.121"/>
                    <BasePoint2 x="1396.11" y="1396.11"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_217" name="curve233" metaboliteGlyph="Layout_37" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1483.43" y="1070.11"/>
                    <End x="1394.91" y="1400.96"/>
                    <BasePoint1 x="1483.43" y="1070.11"/>
                    <BasePoint2 x="1396.21" y="1396.13"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_218" name="curve234" metaboliteGlyph="Layout_11" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1310.01" y="1413.67"/>
                    <End x="1376.02" y="1415.12"/>
                    <BasePoint1 x="1310.01" y="1413.67"/>
                    <BasePoint2 x="1371.02" y="1415.01"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_219" name="rGlyph_24" reaction="Reaction_24">
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="1537.02" y="1333.45"/>
                <End x="1537.02" y="1333.45"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_220" name="curve240" metaboliteGlyph="Layout_51" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1537.44" y="1386.55"/>
                    <End x="1537.02" y="1333.45"/>
                    <BasePoint1 x="1537.28" y="1366.55"/>
                    <BasePoint2 x="1541.53" y="1358.04"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_221" name="curve240" metaboliteGlyph="Layout_52" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1537.02" y="1333.45"/>
                    <End x="1532.1" y="1263.45"/>
                    <BasePoint1 x="1532.5" y="1308.86"/>
                    <BasePoint2 x="1533.5" y="1283.4"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_222" name="curve240" metaboliteGlyph="Layout_69" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1184.74" y="1249.76"/>
                    <End x="1522.42" y="1330"/>
                    <BasePoint1 x="1184.74" y="1249.76"/>
                    <BasePoint2 x="1517.55" y="1328.85"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_223" name="curve241" metaboliteGlyph="Layout_14" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="692.002" y="1376.93"/>
                    <End x="1522.04" y="1334.22"/>
                    <BasePoint1 x="692.002" y="1376.93"/>
                    <BasePoint2 x="1517.04" y="1334.48"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_224" name="curve242" metaboliteGlyph="Layout_53" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1445.98" y="1326.26"/>
                    <End x="1522.05" y="1332.39"/>
                    <BasePoint1 x="1445.98" y="1326.26"/>
                    <BasePoint2 x="1517.07" y="1332.03"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_225" name="rGlyph_25" reaction="Reaction_25">
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="1292.02" y="310.448"/>
                <End x="1292.02" y="310.448"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_226" name="curve250" metaboliteGlyph="Layout_31" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1250.1" y="244.503"/>
                    <End x="1292.02" y="310.448"/>
                    <BasePoint1 x="1260.83" y="261.382"/>
                    <BasePoint2 x="1291.25" y="285.46"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_227" name="curve251" metaboliteGlyph="Layout_33" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1326.88" y="250.457"/>
                    <End x="1292.02" y="310.448"/>
                    <BasePoint1 x="1316.83" y="267.748"/>
                    <BasePoint2 x="1291.25" y="285.46"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_228" name="curve250" metaboliteGlyph="Layout_32" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1292.02" y="310.448"/>
                    <End x="1292.18" y="371.45"/>
                    <BasePoint1 x="1292.78" y="335.437"/>
                    <BasePoint2 x="1292.13" y="351.45"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_229" name="curve250" metaboliteGlyph="Layout_55" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1017.64" y="1319.8"/>
                    <End x="1288.08" y="324.924"/>
                    <BasePoint1 x="1017.64" y="1319.8"/>
                    <BasePoint2 x="1286.77" y="329.749"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_230" name="curve251" metaboliteGlyph="Layout_6" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1478.45" y="673.552"/>
                    <End x="1298.88" y="323.788"/>
                    <BasePoint1 x="1478.45" y="673.552"/>
                    <BasePoint2 x="1301.16" y="328.234"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_231" name="rGlyph_26" reaction="Reaction_26">
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="1226.02" y="155.448"/>
                <End x="1226.02" y="155.448"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_232" name="curve260" metaboliteGlyph="Layout_76" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1227.35" y="93.4263"/>
                    <End x="1226.02" y="155.448"/>
                    <BasePoint1 x="1226.92" y="113.422"/>
                    <BasePoint2 x="1224.89" y="130.474"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_233" name="curve260" metaboliteGlyph="Layout_31" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1226.02" y="155.448"/>
                    <End x="1229.12" y="202.488"/>
                    <BasePoint1 x="1227.14" y="180.423"/>
                    <BasePoint2 x="1227.8" y="182.532"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_234" name="rGlyph_27" reaction="Reaction_27">
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="1599.02" y="143.448"/>
                <End x="1599.02" y="143.448"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_235" name="curve270" metaboliteGlyph="Layout_77" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1598.29" y="85.36660000000001"/>
                    <End x="1599.02" y="143.448"/>
                    <BasePoint1 x="1598.54" y="105.365"/>
                    <BasePoint2 x="1602.58" y="118.704"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_236" name="curve270" metaboliteGlyph="Layout_48" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1599.02" y="143.448"/>
                    <End x="1600.77" y="210.526"/>
                    <BasePoint1 x="1595.45" y="168.193"/>
                    <BasePoint2 x="1600.25" y="190.533"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_237" name="rGlyph_28" reaction="Reaction_28">
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="1661.02" y="299.448"/>
                <End x="1661.02" y="299.448"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_238" name="curve280" metaboliteGlyph="Layout_48" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1628.21" y="251.173"/>
                    <End x="1661.02" y="299.448"/>
                    <BasePoint1 x="1639.45" y="267.716"/>
                    <BasePoint2 x="1661.56" y="274.454"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_239" name="curve281" metaboliteGlyph="Layout_34" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1697.14" y="246.611"/>
                    <End x="1661.02" y="299.448"/>
                    <BasePoint1 x="1685.85" y="263.121"/>
                    <BasePoint2 x="1661.56" y="274.454"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_240" name="curve280" metaboliteGlyph="Layout_35" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1661.02" y="299.448"/>
                    <End x="1660.9" y="363.449"/>
                    <BasePoint1 x="1660.47" y="324.442"/>
                    <BasePoint2 x="1660.94" y="343.449"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_241" name="curve280" metaboliteGlyph="Layout_60" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="946.943" y="848.354"/>
                    <End x="1649.12" y="308.587"/>
                    <BasePoint1 x="946.943" y="848.354"/>
                    <BasePoint2 x="1645.16" y="311.633"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_242" name="rGlyph_29" reaction="Reaction_29">
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="1501.02" y="236.448"/>
                <End x="1501.02" y="236.448"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_243" name="curve290" metaboliteGlyph="Layout_71" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1458.48" y="247.128"/>
                    <End x="1501.02" y="236.448"/>
                    <BasePoint1 x="1477.88" y="242.257"/>
                    <BasePoint2 x="1476.02" y="236.108"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_244" name="curve291" metaboliteGlyph="Layout_70" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1454.63" y="223.521"/>
                    <End x="1501.02" y="236.448"/>
                    <BasePoint1 x="1473.9" y="228.891"/>
                    <BasePoint2 x="1476.02" y="236.108"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_245" name="curve290" metaboliteGlyph="Layout_48" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1501.02" y="236.448"/>
                    <End x="1529.02" y="236.71"/>
                    <BasePoint1 x="1526.01" y="236.788"/>
                    <BasePoint2 x="1509.02" y="236.523"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_246" name="curve290" metaboliteGlyph="Layout_67" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1908.64" y="1374.03"/>
                    <End x="1506.08" y="250.566"/>
                    <BasePoint1 x="1908.64" y="1374.03"/>
                    <BasePoint2 x="1507.77" y="255.273"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_247" name="curve291" metaboliteGlyph="Layout_11" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1259.07" y="1390.66"/>
                    <End x="1497.94" y="251.131"/>
                    <BasePoint1 x="1259.07" y="1390.66"/>
                    <BasePoint2 x="1496.92" y="256.025"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_248" name="rGlyph_30" reaction="Reaction_30">
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="1166.02" y="232.448"/>
                <End x="1166.02" y="232.448"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_249" name="curve300" metaboliteGlyph="Layout_9" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1140.87" y="232.126"/>
                    <End x="1166.02" y="232.448"/>
                    <BasePoint1 x="1160.87" y="232.382"/>
                    <BasePoint2 x="1141.02" y="232.151"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_250" name="curve300" metaboliteGlyph="Layout_31" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1166.02" y="232.448"/>
                    <End x="1194.17" y="232.189"/>
                    <BasePoint1 x="1191.01" y="232.746"/>
                    <BasePoint2 x="1174.17" y="232.373"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_251" name="curve300" metaboliteGlyph="Layout_53" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1390.96" y="1301.66"/>
                    <End x="1169.11" y="247.126"/>
                    <BasePoint1 x="1390.96" y="1301.66"/>
                    <BasePoint2 x="1170.14" y="252.018"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_252" name="rGlyph_31" reaction="Reaction_31">
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="1618.02" y="1031.45"/>
                <End x="1618.02" y="1031.45"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_253" name="curve310" metaboliteGlyph="Layout_50" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1667.09" y="1011.55"/>
                    <End x="1618.02" y="1031.45"/>
                    <BasePoint1 x="1648.56" y="1019.06"/>
                    <BasePoint2 x="1642.98" y="1030.11"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_254" name="curve311" metaboliteGlyph="Layout_36" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1688.53" y="1045.29"/>
                    <End x="1618.02" y="1031.45"/>
                    <BasePoint1 x="1668.9" y="1041.44"/>
                    <BasePoint2 x="1642.98" y="1030.11"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_255" name="curve310" metaboliteGlyph="Layout_37" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1618.02" y="1031.45"/>
                    <End x="1552.93" y="1038.13"/>
                    <BasePoint1 x="1593.05" y="1032.78"/>
                    <BasePoint2 x="1572.82" y="1036.09"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_256" name="curve310" metaboliteGlyph="Layout_35" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1660.34" y="408.425"/>
                    <End x="1619.04" y="1016.48"/>
                    <BasePoint1 x="1660.34" y="408.425"/>
                    <BasePoint2 x="1619.38" y="1011.49"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_257" name="curve311" metaboliteGlyph="Layout_67" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1900.67" y="1375.72"/>
                    <End x="1627.54" y="1043.04"/>
                    <BasePoint1 x="1900.67" y="1375.72"/>
                    <BasePoint2 x="1630.71" y="1046.9"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_258" name="curve312" metaboliteGlyph="Layout_32" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1303.56" y="415.355"/>
                    <End x="1611.2" y="1018.09"/>
                    <BasePoint1 x="1303.56" y="415.355"/>
                    <BasePoint2 x="1608.93" y="1013.63"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_259" name="curve313" metaboliteGlyph="Layout_63" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="595.965" y="1134.45"/>
                    <End x="1603.09" y="1032.96"/>
                    <BasePoint1 x="595.965" y="1134.45"/>
                    <BasePoint2 x="1598.12" y="1033.47"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_260" name="curve314" metaboliteGlyph="Layout_55" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1043.92" y="1324.9"/>
                    <End x="1604.66" y="1038.28"/>
                    <BasePoint1 x="1043.92" y="1324.9"/>
                    <BasePoint2 x="1600.21" y="1040.56"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_261" name="rGlyph_32" reaction="Reaction_32">
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="2079.02" y="1310.45"/>
                <End x="2079.02" y="1310.45"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_262" name="curve320" metaboliteGlyph="Layout_66" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="2151.02" y="1372.44"/>
                    <End x="2079.02" y="1310.45"/>
                    <BasePoint1 x="2135.87" y="1359.39"/>
                    <BasePoint2 x="2104" y="1309.62"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_263" name="curve321" metaboliteGlyph="Layout_68" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="2155.91" y="1242.37"/>
                    <End x="2079.02" y="1310.45"/>
                    <BasePoint1 x="2140.93" y="1255.62"/>
                    <BasePoint2 x="2104" y="1309.62"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_264" name="curve320" metaboliteGlyph="Layout_67" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="2079.02" y="1310.45"/>
                    <End x="1944.55" y="1378.23"/>
                    <BasePoint1 x="2054.03" y="1311.27"/>
                    <BasePoint2 x="1962.41" y="1369.23"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_265" name="curve320" metaboliteGlyph="Layout_23" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="876.051" y="419.4"/>
                    <End x="2066.96" y="1301.52"/>
                    <BasePoint1 x="876.051" y="419.4"/>
                    <BasePoint2 x="2062.94" y="1298.54"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_266" name="curve321" metaboliteGlyph="Layout_20" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="312.012" y="1354.2"/>
                    <End x="2064.02" y="1310.83"/>
                    <BasePoint1 x="312.012" y="1354.2"/>
                    <BasePoint2 x="2059.02" y="1310.95"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_267" name="rGlyph_33" reaction="Reaction_33">
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="572.015" y="1584.45"/>
                <End x="572.015" y="1584.45"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_268" name="curve330" metaboliteGlyph="Layout_79" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="574.038" y="1626.5"/>
                    <End x="572.015" y="1584.45"/>
                    <BasePoint1 x="573.077" y="1606.52"/>
                    <BasePoint2 x="572.365" y="1609.45"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_269" name="curve330" metaboliteGlyph="Layout_16" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="572.015" y="1584.45"/>
                    <End x="571.212" y="1536.45"/>
                    <BasePoint1 x="571.6660000000001" y="1559.45"/>
                    <BasePoint2 x="571.547" y="1556.44"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_270" name="rGlyph_34" reaction="Reaction_34">
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="831.015" y="1587.45"/>
                <End x="831.015" y="1587.45"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_271" name="curve340" metaboliteGlyph="Layout_80" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="831.475" y="1624.46"/>
                    <End x="831.015" y="1587.45"/>
                    <BasePoint1 x="831.227" y="1604.46"/>
                    <BasePoint2 x="830.825" y="1612.45"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_272" name="curve340" metaboliteGlyph="Layout_19" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="831.015" y="1587.45"/>
                    <End x="831.086" y="1545.45"/>
                    <BasePoint1 x="831.206" y="1562.45"/>
                    <BasePoint2 x="831.052" y="1565.45"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_273" name="rGlyph_35" reaction="Reaction_35">
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="1220.02" y="1585.45"/>
                <End x="1220.02" y="1585.45"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_274" name="curve350" metaboliteGlyph="Layout_81" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1219.38" y="1614.46"/>
                    <End x="1220.02" y="1585.45"/>
                    <BasePoint1 x="1219.82" y="1594.46"/>
                    <BasePoint2 x="1219.53" y="1610.44"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_275" name="curve350" metaboliteGlyph="Layout_13" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1220.02" y="1585.45"/>
                    <End x="1219.09" y="1547.39"/>
                    <BasePoint1 x="1220.5" y="1560.45"/>
                    <BasePoint2 x="1219.58" y="1567.38"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_276" name="rGlyph_36" reaction="Reaction_36">
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="1807.02" y="995.448"/>
                <End x="1807.02" y="995.448"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_277" name="curve360" metaboliteGlyph="Layout_5" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1847.02" y="996.303"/>
                    <End x="1807.02" y="995.448"/>
                    <BasePoint1 x="1827.02" y="995.876"/>
                    <BasePoint2 x="1832.01" y="996.085"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_278" name="curve360" metaboliteGlyph="Layout_50" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1807.02" y="995.448"/>
                    <End x="1731.01" y="992.835"/>
                    <BasePoint1 x="1782.02" y="994.811"/>
                    <BasePoint2 x="1751" y="993.522"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_279" name="rGlyph_37" reaction="Reaction_37">
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="1806.02" y="662.448"/>
                <End x="1806.02" y="662.448"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_280" name="curve370" metaboliteGlyph="Layout_4" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1866.05" y="658.241"/>
                    <End x="1806.02" y="662.448"/>
                    <BasePoint1 x="1846.1" y="659.639"/>
                    <BasePoint2 x="1830.98" y="661.0309999999999"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_281" name="curve370" metaboliteGlyph="Layout_49" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1806.02" y="662.448"/>
                    <End x="1761.01" y="664.254"/>
                    <BasePoint1 x="1781.06" y="663.866"/>
                    <BasePoint2 x="1781" y="663.452"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_282" name="rGlyph_38" reaction="Reaction_38">
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="1614.02" y="699.448"/>
                <End x="1614.02" y="699.448"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_283" name="curve380" metaboliteGlyph="Layout_49" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1684.81" y="680.356"/>
                    <End x="1614.02" y="699.448"/>
                    <BasePoint1 x="1665.5" y="685.564"/>
                    <BasePoint2 x="1639.01" y="699.8"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_284" name="curve381" metaboliteGlyph="Layout_7" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1681.98" y="720.165"/>
                    <End x="1614.02" y="699.448"/>
                    <BasePoint1 x="1662.85" y="714.3339999999999"/>
                    <BasePoint2 x="1639.01" y="699.8"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_285" name="curve380" metaboliteGlyph="Layout_6" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1614.02" y="699.448"/>
                    <End x="1553.01" y="697.806"/>
                    <BasePoint1 x="1589.02" y="699.096"/>
                    <BasePoint2 x="1573" y="698.3440000000001"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_286" name="curve380" metaboliteGlyph="Layout_67" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1907.03" y="1374.28"/>
                    <End x="1620" y="713.202"/>
                    <BasePoint1 x="1907.03" y="1374.28"/>
                    <BasePoint2 x="1622" y="717.7859999999999"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_287" name="curve381" metaboliteGlyph="Layout_52" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1534.53" y="1218.56"/>
                    <End x="1611.77" y="714.28"/>
                    <BasePoint1 x="1534.53" y="1218.56"/>
                    <BasePoint2 x="1611.02" y="719.223"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_288" name="curve382" metaboliteGlyph="Layout_35" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="1658.5" y="408.334"/>
                    <End x="1616.29" y="684.622"/>
                    <BasePoint1 x="1658.5" y="408.334"/>
                    <BasePoint2 x="1617.05" y="679.679"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_289" name="curve383" metaboliteGlyph="Layout_42" role="modifier">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="617.7619999999999" y="470.686"/>
                    <End x="1599.4" y="696.081"/>
                    <BasePoint1 x="617.7619999999999" y="470.686"/>
                    <BasePoint2 x="1594.53" y="694.958"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
        <ReactionGlyph key="Layout_290" name="rGlyph_39" reaction="Reaction_39">
          <Curve>
            <ListOfCurveSegments>
              <CurveSegment xsi:type="LineSegment">
                <Start x="132.015" y="155.448"/>
                <End x="132.015" y="155.448"/>
              </CurveSegment>
            </ListOfCurveSegments>
          </Curve>
          <ListOfMetaboliteReferenceGlyphs>
            <MetaboliteReferenceGlyph key="Layout_291" name="curve390" metaboliteGlyph="Layout_82" role="substrate">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="131.949" y="95.4481"/>
                    <End x="132.015" y="155.448"/>
                    <BasePoint1 x="131.971" y="115.448"/>
                    <BasePoint2 x="131.718" y="130.45"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
            <MetaboliteReferenceGlyph key="Layout_292" name="curve390" metaboliteGlyph="Layout_30" role="product">
              <Curve>
                <ListOfCurveSegments>
                  <CurveSegment xsi:type="CubicBezier">
                    <Start x="132.015" y="155.448"/>
                    <End x="131.533" y="195.462"/>
                    <BasePoint1 x="132.312" y="180.447"/>
                    <BasePoint2 x="131.774" y="175.463"/>
                  </CurveSegment>
                </ListOfCurveSegments>
              </Curve>
            </MetaboliteReferenceGlyph>
          </ListOfMetaboliteReferenceGlyphs>
        </ReactionGlyph>
      </ListOfReactionGlyphs>
      <ListOfTextGlyphs>
        <TextGlyph key="Layout_293" name="tGlyph_0" graphicalObject="Layout_4" text="eIL17">
          <BoundingBox>
            <Position x="1876.72" y="641.165"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_294" name="tGlyph_1" graphicalObject="Layout_5" text="eIL10">
          <BoundingBox>
            <Position x="1857.73" y="985.419"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_295" name="tGlyph_2" graphicalObject="Layout_6" text="IL17-IL17R">
          <BoundingBox>
            <Position x="1438.41" y="681.972"/>
            <Dimensions width="105" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_296" name="tGlyph_3" graphicalObject="Layout_7" text="IL17R">
          <BoundingBox>
            <Position x="1687.37" y="724.446"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_297" name="tGlyph_4" graphicalObject="Layout_8" text="pIFNg">
          <BoundingBox>
            <Position x="624.253" y="219.821"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_298" name="tGlyph_5" graphicalObject="Layout_9" text="pIL21">
          <BoundingBox>
            <Position x="1066.38" y="210.566"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_299" name="tGlyph_6" graphicalObject="Layout_10" text="pIL4">
          <BoundingBox>
            <Position x="452.706" y="1491.37"/>
            <Dimensions width="57" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_300" name="tGlyph_7" graphicalObject="Layout_11" text="IL6-IL6R">
          <BoundingBox>
            <Position x="1211.38" y="1400.85"/>
            <Dimensions width="89" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_301" name="tGlyph_8" graphicalObject="Layout_12" text="IL6R">
          <BoundingBox>
            <Position x="1272.56" y="1510.56"/>
            <Dimensions width="57" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_302" name="tGlyph_9" graphicalObject="Layout_13" text="IL6">
          <BoundingBox>
            <Position x="1194.09" y="1512.81"/>
            <Dimensions width="49" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_303" name="tGlyph_10" graphicalObject="Layout_14" text="TGFb-TGFbR">
          <BoundingBox>
            <Position x="576.874" y="1368.52"/>
            <Dimensions width="105" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_304" name="tGlyph_11" graphicalObject="Layout_15" text="TGFbR">
          <BoundingBox>
            <Position x="633.38" y="1507.69"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_305" name="tGlyph_12" graphicalObject="Layout_16" text="TGFb">
          <BoundingBox>
            <Position x="540.72" y="1501.57"/>
            <Dimensions width="57" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_306" name="tGlyph_13" graphicalObject="Layout_17" text="IL2-IL2R">
          <BoundingBox>
            <Position x="835.168" y="1414.52"/>
            <Dimensions width="89" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_307" name="tGlyph_14" graphicalObject="Layout_18" text="IL2R">
          <BoundingBox>
            <Position x="909.169" y="1501.55"/>
            <Dimensions width="57" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_308" name="tGlyph_15" graphicalObject="Layout_19" text="IL2">
          <BoundingBox>
            <Position x="806.612" y="1511.15"/>
            <Dimensions width="49" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_309" name="tGlyph_16" graphicalObject="Layout_20" text="IL4-IL4R">
          <BoundingBox>
            <Position x="212.067" y="1344.12"/>
            <Dimensions width="89" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_310" name="tGlyph_17" graphicalObject="Layout_21" text="IL4R">
          <BoundingBox>
            <Position x="152.326" y="1486.26"/>
            <Dimensions width="57" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_311" name="tGlyph_18" graphicalObject="Layout_22" text="IL4">
          <BoundingBox>
            <Position x="312.626" y="1491.03"/>
            <Dimensions width="49" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_312" name="tGlyph_19" graphicalObject="Layout_23" text="IFNg-IFNgR">
          <BoundingBox>
            <Position x="800.046" y="388.365"/>
            <Dimensions width="105" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_313" name="tGlyph_20" graphicalObject="Layout_24" text="IFNgR">
          <BoundingBox>
            <Position x="874.958" y="224.336"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_314" name="tGlyph_21" graphicalObject="Layout_25" text="IL12-IL12R">
          <BoundingBox>
            <Position x="403.603" y="348.773"/>
            <Dimensions width="105" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_315" name="tGlyph_22" graphicalObject="Layout_26" text="IL12R">
          <BoundingBox>
            <Position x="475.138" y="205.874"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_316" name="tGlyph_23" graphicalObject="Layout_27" text="IL12">
          <BoundingBox>
            <Position x="386.987" y="204.51"/>
            <Dimensions width="57" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_317" name="tGlyph_24" graphicalObject="Layout_28" text="IL18-IL18R">
          <BoundingBox>
            <Position x="125.954" y="366.768"/>
            <Dimensions width="105" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_318" name="tGlyph_25" graphicalObject="Layout_29" text="IL18R">
          <BoundingBox>
            <Position x="199.075" y="205.285"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_319" name="tGlyph_26" graphicalObject="Layout_30" text="IL18">
          <BoundingBox>
            <Position x="100" y="204.725"/>
            <Dimensions width="57" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_320" name="tGlyph_27" graphicalObject="Layout_31" text="IL21">
          <BoundingBox>
            <Position x="1204.13" y="212.206"/>
            <Dimensions width="57" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_321" name="tGlyph_28" graphicalObject="Layout_32" text="IL21-IL21R">
          <BoundingBox>
            <Position x="1240.52" y="381.282"/>
            <Dimensions width="105" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_322" name="tGlyph_29" graphicalObject="Layout_33" text="IL21R">
          <BoundingBox>
            <Position x="1314.87" y="218.404"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_323" name="tGlyph_30" graphicalObject="Layout_34" text="IL23R">
          <BoundingBox>
            <Position x="1689.29" y="214.622"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_324" name="tGlyph_31" graphicalObject="Layout_35" text="IL23-IL23R">
          <BoundingBox>
            <Position x="1610.18" y="373.274"/>
            <Dimensions width="105" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_325" name="tGlyph_32" graphicalObject="Layout_36" text="IL10R">
          <BoundingBox>
            <Position x="1698.62" y="1048"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_326" name="tGlyph_33" graphicalObject="Layout_37" text="IL10-IL10R">
          <BoundingBox>
            <Position x="1438.39" y="1035.48"/>
            <Dimensions width="105" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_327" name="tGlyph_34" graphicalObject="Layout_38" text="IRAK1">
          <BoundingBox>
            <Position x="261.472" y="282.176"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_328" name="tGlyph_35" graphicalObject="Layout_39" text="IRAK1-P">
          <BoundingBox>
            <Position x="250.838" y="475.618"/>
            <Dimensions width="81" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_329" name="tGlyph_36" graphicalObject="Layout_40" text="p50/p65 dimer">
          <BoundingBox>
            <Position x="337.578" y="558.314"/>
            <Dimensions width="129" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_330" name="tGlyph_37" graphicalObject="Layout_41" text="STAT4">
          <BoundingBox>
            <Position x="530.639" y="288.053"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_331" name="tGlyph_38" graphicalObject="Layout_42" text="STAT4-P">
          <BoundingBox>
            <Position x="526.913" y="445.293"/>
            <Dimensions width="81" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_332" name="tGlyph_39" graphicalObject="Layout_43" text="IFNg">
          <BoundingBox>
            <Position x="784.3579999999999" y="221.535"/>
            <Dimensions width="57" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_333" name="tGlyph_40" graphicalObject="Layout_44" text="JAK1">
          <BoundingBox>
            <Position x="711.772" y="465.414"/>
            <Dimensions width="57" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_334" name="tGlyph_41" graphicalObject="Layout_45" text="JAK1-P">
          <BoundingBox>
            <Position x="887.271" y="487.647"/>
            <Dimensions width="73" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_335" name="tGlyph_42" graphicalObject="Layout_46" text="STAT1">
          <BoundingBox>
            <Position x="972.36" y="316.227"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_336" name="tGlyph_43" graphicalObject="Layout_47" text="STAT1-P">
          <BoundingBox>
            <Position x="964.89" y="477.479"/>
            <Dimensions width="81" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_337" name="tGlyph_44" graphicalObject="Layout_48" text="p40/p19 dimer">
          <BoundingBox>
            <Position x="1539.72" y="220.078"/>
            <Dimensions width="129" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_338" name="tGlyph_45" graphicalObject="Layout_49" text="IL17">
          <BoundingBox>
            <Position x="1694.04" y="651.538"/>
            <Dimensions width="57" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_339" name="tGlyph_46" graphicalObject="Layout_50" text="IL10">
          <BoundingBox>
            <Position x="1664.26" y="980.487"/>
            <Dimensions width="57" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_340" name="tGlyph_47" graphicalObject="Layout_51" text="RORgt">
          <BoundingBox>
            <Position x="1502.73" y="1396.6"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_341" name="tGlyph_48" graphicalObject="Layout_52" text="RORgt-ligand">
          <BoundingBox>
            <Position x="1471.97" y="1228.97"/>
            <Dimensions width="121" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_342" name="tGlyph_49" graphicalObject="Layout_53" text="STAT3-P">
          <BoundingBox>
            <Position x="1355.9" y="1311.48"/>
            <Dimensions width="81" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_343" name="tGlyph_50" graphicalObject="Layout_54" text="STAT3">
          <BoundingBox>
            <Position x="1360.83" y="1465.5"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_344" name="tGlyph_51" graphicalObject="Layout_55" text="STAT5-P">
          <BoundingBox>
            <Position x="972.395" y="1329.58"/>
            <Dimensions width="81" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_345" name="tGlyph_52" graphicalObject="Layout_56" text="STAT5">
          <BoundingBox>
            <Position x="975.404" y="1473.92"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_346" name="tGlyph_53" graphicalObject="Layout_57" text="FOXP3">
          <BoundingBox>
            <Position x="1079.78" y="1401.2"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_347" name="tGlyph_54" graphicalObject="Layout_58" text="SOCS1">
          <BoundingBox>
            <Position x="918.996" y="694.396"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_348" name="tGlyph_55" graphicalObject="Layout_59" text="SOCS1-JAKs">
          <BoundingBox>
            <Position x="709.426" y="582.006"/>
            <Dimensions width="105" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_349" name="tGlyph_56" graphicalObject="Layout_60" text="Tbet-P">
          <BoundingBox>
            <Position x="887.162" y="853.63"/>
            <Dimensions width="73" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_350" name="tGlyph_57" graphicalObject="Layout_61" text="Tbet">
          <BoundingBox>
            <Position x="627.962" y="856.061"/>
            <Dimensions width="57" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_351" name="tGlyph_58" graphicalObject="Layout_62" text="GATA3">
          <BoundingBox>
            <Position x="516.722" y="1311.11"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_352" name="tGlyph_59" graphicalObject="Layout_63" text="GATA3-P">
          <BoundingBox>
            <Position x="504.088" y="1128.85"/>
            <Dimensions width="81" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_353" name="tGlyph_60" graphicalObject="Layout_64" text="STAT6-P">
          <BoundingBox>
            <Position x="370.399" y="1218.13"/>
            <Dimensions width="81" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_354" name="tGlyph_61" graphicalObject="Layout_65" text="STAT6">
          <BoundingBox>
            <Position x="382.395" y="1406.2"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_355" name="tGlyph_62" graphicalObject="Layout_66" text="PPARg">
          <BoundingBox>
            <Position x="2134.77" y="1380.97"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_356" name="tGlyph_63" graphicalObject="Layout_67" text="L-PPARg">
          <BoundingBox>
            <Position x="1877.09" y="1383.77"/>
            <Dimensions width="81" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_357" name="tGlyph_64" graphicalObject="Layout_68" text="Ligand">
          <BoundingBox>
            <Position x="2136.86" y="1209.88"/>
            <Dimensions width="73" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_358" name="tGlyph_65" graphicalObject="Layout_69" text="acetylated FOXP3">
          <BoundingBox>
            <Position x="1045.9" y="1222.97"/>
            <Dimensions width="153" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_359" name="tGlyph_66" graphicalObject="Layout_70" text="p19">
          <BoundingBox>
            <Position x="1401.85" y="192.939"/>
            <Dimensions width="49" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_360" name="tGlyph_67" graphicalObject="Layout_71" text="p40">
          <BoundingBox>
            <Position x="1405.3" y="252.271"/>
            <Dimensions width="49" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_361" name="tGlyph_68" graphicalObject="Layout_72" text="p50">
          <BoundingBox>
            <Position x="338.133" y="405.846"/>
            <Dimensions width="49" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_362" name="tGlyph_69" graphicalObject="Layout_73" text="p65">
          <BoundingBox>
            <Position x="411.195" y="406.029"/>
            <Dimensions width="49" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_363" name="tGlyph_700" graphicalObject="Layout_74" text="eIFNg">
          <BoundingBox>
            <Position x="782.744" y="59.0314"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_364" name="tGlyph_701" graphicalObject="Layout_75" text="eIL12">
          <BoundingBox>
            <Position x="387.602" y="60.9671"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_365" name="tGlyph_702" graphicalObject="Layout_76" text="eIL21">
          <BoundingBox>
            <Position x="1197.18" y="58.0995"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_366" name="tGlyph_703" graphicalObject="Layout_77" text="eIL23">
          <BoundingBox>
            <Position x="1564.22" y="50"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_367" name="tGlyph_704" graphicalObject="Layout_78" text="eIL4">
          <BoundingBox>
            <Position x="310.433" y="1630.83"/>
            <Dimensions width="57" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_368" name="tGlyph_705" graphicalObject="Layout_79" text="eTGFb">
          <BoundingBox>
            <Position x="542.614" y="1636.94"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_369" name="tGlyph_706" graphicalObject="Layout_80" text="eIL2">
          <BoundingBox>
            <Position x="805.669" y="1634.92"/>
            <Dimensions width="57" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_370" name="tGlyph_707" graphicalObject="Layout_81" text="eIL6">
          <BoundingBox>
            <Position x="1191.9" y="1625.16"/>
            <Dimensions width="57" height="25"/>
          </BoundingBox>
        </TextGlyph>
        <TextGlyph key="Layout_371" name="tGlyph_708" graphicalObject="Layout_82" text="eIL18">
          <BoundingBox>
            <Position x="98.2791" y="59.9667"/>
            <Dimensions width="65" height="25"/>
          </BoundingBox>
        </TextGlyph>
      </ListOfTextGlyphs>
    </Layout>
  </ListOfLayouts>
  <SBMLReference file="T_Helper_Cell_SBW.xml">
    <SBMLMap SBMLid="c1" COPASIkey="Compartment_3"/>
    <SBMLMap SBMLid="default" COPASIkey="Compartment_1"/>
    <SBMLMap SBMLid="function_1" COPASIkey="Function_40"/>
    <SBMLMap SBMLid="function_10" COPASIkey="Function_48"/>
    <SBMLMap SBMLid="function_12" COPASIkey="Function_49"/>
    <SBMLMap SBMLid="function_14" COPASIkey="Function_50"/>
    <SBMLMap SBMLid="function_2" COPASIkey="Function_41"/>
    <SBMLMap SBMLid="function_3" COPASIkey="Function_42"/>
    <SBMLMap SBMLid="function_4" COPASIkey="Function_43"/>
    <SBMLMap SBMLid="function_5" COPASIkey="Function_51"/>
    <SBMLMap SBMLid="function_6" COPASIkey="Function_44"/>
    <SBMLMap SBMLid="function_7" COPASIkey="Function_45"/>
    <SBMLMap SBMLid="function_8" COPASIkey="Function_46"/>
    <SBMLMap SBMLid="function_9" COPASIkey="Function_47"/>
    <SBMLMap SBMLid="parameter_1" COPASIkey="ModelValue_0"/>
    <SBMLMap SBMLid="re10" COPASIkey="Reaction_5"/>
    <SBMLMap SBMLid="re11" COPASIkey="Reaction_6"/>
    <SBMLMap SBMLid="re12" COPASIkey="Reaction_7"/>
    <SBMLMap SBMLid="re13" COPASIkey="Reaction_8"/>
    <SBMLMap SBMLid="re14" COPASIkey="Reaction_9"/>
    <SBMLMap SBMLid="re15" COPASIkey="Reaction_10"/>
    <SBMLMap SBMLid="re16" COPASIkey="Reaction_11"/>
    <SBMLMap SBMLid="re17" COPASIkey="Reaction_12"/>
    <SBMLMap SBMLid="re18" COPASIkey="Reaction_13"/>
    <SBMLMap SBMLid="re19" COPASIkey="Reaction_14"/>
    <SBMLMap SBMLid="re2" COPASIkey="Reaction_0"/>
    <SBMLMap SBMLid="re20" COPASIkey="Reaction_15"/>
    <SBMLMap SBMLid="re23" COPASIkey="Reaction_16"/>
    <SBMLMap SBMLid="re24" COPASIkey="Reaction_17"/>
    <SBMLMap SBMLid="re25" COPASIkey="Reaction_18"/>
    <SBMLMap SBMLid="re26" COPASIkey="Reaction_19"/>
    <SBMLMap SBMLid="re27" COPASIkey="Reaction_20"/>
    <SBMLMap SBMLid="re28" COPASIkey="Reaction_21"/>
    <SBMLMap SBMLid="re29" COPASIkey="Reaction_22"/>
    <SBMLMap SBMLid="re3" COPASIkey="Reaction_1"/>
    <SBMLMap SBMLid="re30" COPASIkey="Reaction_23"/>
    <SBMLMap SBMLid="re31" COPASIkey="Reaction_24"/>
    <SBMLMap SBMLid="re32" COPASIkey="Reaction_25"/>
    <SBMLMap SBMLid="re33" COPASIkey="Reaction_26"/>
    <SBMLMap SBMLid="re34" COPASIkey="Reaction_27"/>
    <SBMLMap SBMLid="re35" COPASIkey="Reaction_28"/>
    <SBMLMap SBMLid="re36" COPASIkey="Reaction_29"/>
    <SBMLMap SBMLid="re37" COPASIkey="Reaction_30"/>
    <SBMLMap SBMLid="re39" COPASIkey="Reaction_31"/>
    <SBMLMap SBMLid="re42" COPASIkey="Reaction_32"/>
    <SBMLMap SBMLid="re44" COPASIkey="Reaction_33"/>
    <SBMLMap SBMLid="re45" COPASIkey="Reaction_34"/>
    <SBMLMap SBMLid="re46" COPASIkey="Reaction_35"/>
    <SBMLMap SBMLid="re6" COPASIkey="Reaction_2"/>
    <SBMLMap SBMLid="re8" COPASIkey="Reaction_3"/>
    <SBMLMap SBMLid="re9" COPASIkey="Reaction_4"/>
    <SBMLMap SBMLid="reaction_1" COPASIkey="Reaction_36"/>
    <SBMLMap SBMLid="reaction_2" COPASIkey="Reaction_37"/>
    <SBMLMap SBMLid="reaction_3" COPASIkey="Reaction_38"/>
    <SBMLMap SBMLid="reaction_4" COPASIkey="Reaction_39"/>
    <SBMLMap SBMLid="s1" COPASIkey="Metabolite_91"/>
    <SBMLMap SBMLid="s10" COPASIkey="Metabolite_109"/>
    <SBMLMap SBMLid="s11" COPASIkey="Metabolite_3"/>
    <SBMLMap SBMLid="s12" COPASIkey="Metabolite_85"/>
    <SBMLMap SBMLid="s13" COPASIkey="Metabolite_83"/>
    <SBMLMap SBMLid="s14" COPASIkey="Metabolite_81"/>
    <SBMLMap SBMLid="s2" COPASIkey="Metabolite_89"/>
    <SBMLMap SBMLid="s20" COPASIkey="Metabolite_111"/>
    <SBMLMap SBMLid="s21" COPASIkey="Metabolite_115"/>
    <SBMLMap SBMLid="s22" COPASIkey="Metabolite_1"/>
    <SBMLMap SBMLid="s24" COPASIkey="Metabolite_79"/>
    <SBMLMap SBMLid="s25" COPASIkey="Metabolite_77"/>
    <SBMLMap SBMLid="s26" COPASIkey="Metabolite_125"/>
    <SBMLMap SBMLid="s27" COPASIkey="Metabolite_151"/>
    <SBMLMap SBMLid="s28" COPASIkey="Metabolite_121"/>
    <SBMLMap SBMLid="s29" COPASIkey="Metabolite_149"/>
    <SBMLMap SBMLid="s3" COPASIkey="Metabolite_87"/>
    <SBMLMap SBMLid="s30" COPASIkey="Metabolite_9"/>
    <SBMLMap SBMLid="s31" COPASIkey="Metabolite_75"/>
    <SBMLMap SBMLid="s32" COPASIkey="Metabolite_73"/>
    <SBMLMap SBMLid="s33" COPASIkey="Metabolite_71"/>
    <SBMLMap SBMLid="s34" COPASIkey="Metabolite_159"/>
    <SBMLMap SBMLid="s35" COPASIkey="Metabolite_157"/>
    <SBMLMap SBMLid="s36" COPASIkey="Metabolite_69"/>
    <SBMLMap SBMLid="s37" COPASIkey="Metabolite_67"/>
    <SBMLMap SBMLid="s38" COPASIkey="Metabolite_65"/>
    <SBMLMap SBMLid="s39" COPASIkey="Metabolite_141"/>
    <SBMLMap SBMLid="s40" COPASIkey="Metabolite_169"/>
    <SBMLMap SBMLid="s43" COPASIkey="Metabolite_63"/>
    <SBMLMap SBMLid="s44" COPASIkey="Metabolite_61"/>
    <SBMLMap SBMLid="s45" COPASIkey="Metabolite_59"/>
    <SBMLMap SBMLid="s46" COPASIkey="Metabolite_57"/>
    <SBMLMap SBMLid="s47" COPASIkey="Metabolite_55"/>
    <SBMLMap SBMLid="s48" COPASIkey="Metabolite_53"/>
    <SBMLMap SBMLid="s49" COPASIkey="Metabolite_137"/>
    <SBMLMap SBMLid="s50" COPASIkey="Metabolite_135"/>
    <SBMLMap SBMLid="s51" COPASIkey="Metabolite_5"/>
    <SBMLMap SBMLid="s52" COPASIkey="Metabolite_93"/>
    <SBMLMap SBMLid="s53" COPASIkey="Metabolite_97"/>
    <SBMLMap SBMLid="s54" COPASIkey="Metabolite_95"/>
    <SBMLMap SBMLid="s55" COPASIkey="Metabolite_7"/>
    <SBMLMap SBMLid="s57" COPASIkey="Metabolite_127"/>
    <SBMLMap SBMLid="s58" COPASIkey="Metabolite_99"/>
    <SBMLMap SBMLid="s59" COPASIkey="Metabolite_101"/>
    <SBMLMap SBMLid="s62" COPASIkey="Metabolite_103"/>
    <SBMLMap SBMLid="s63" COPASIkey="Metabolite_105"/>
    <SBMLMap SBMLid="s65" COPASIkey="Metabolite_107"/>
    <SBMLMap SBMLid="s67" COPASIkey="Metabolite_113"/>
    <SBMLMap SBMLid="s68" COPASIkey="Metabolite_117"/>
    <SBMLMap SBMLid="s69" COPASIkey="Metabolite_119"/>
    <SBMLMap SBMLid="s70" COPASIkey="Metabolite_123"/>
    <SBMLMap SBMLid="s73" COPASIkey="Metabolite_129"/>
    <SBMLMap SBMLid="s74" COPASIkey="Metabolite_131"/>
    <SBMLMap SBMLid="s75" COPASIkey="Metabolite_133"/>
    <SBMLMap SBMLid="s76" COPASIkey="Metabolite_139"/>
    <SBMLMap SBMLid="s77" COPASIkey="Metabolite_143"/>
    <SBMLMap SBMLid="s78" COPASIkey="Metabolite_145"/>
    <SBMLMap SBMLid="s79" COPASIkey="Metabolite_147"/>
    <SBMLMap SBMLid="s80" COPASIkey="Metabolite_153"/>
    <SBMLMap SBMLid="s81" COPASIkey="Metabolite_155"/>
    <SBMLMap SBMLid="s82" COPASIkey="Metabolite_161"/>
    <SBMLMap SBMLid="s83" COPASIkey="Metabolite_165"/>
    <SBMLMap SBMLid="s85" COPASIkey="Metabolite_163"/>
    <SBMLMap SBMLid="s86" COPASIkey="Metabolite_167"/>
    <SBMLMap SBMLid="s87" COPASIkey="Metabolite_11"/>
    <SBMLMap SBMLid="s89" COPASIkey="Metabolite_13"/>
    <SBMLMap SBMLid="s90" COPASIkey="Metabolite_15"/>
    <SBMLMap SBMLid="species_1" COPASIkey="Metabolite_17"/>
    <SBMLMap SBMLid="species_10" COPASIkey="Metabolite_175"/>
    <SBMLMap SBMLid="species_11" COPASIkey="Metabolite_177"/>
    <SBMLMap SBMLid="species_12" COPASIkey="Metabolite_21"/>
    <SBMLMap SBMLid="species_2" COPASIkey="Metabolite_19"/>
    <SBMLMap SBMLid="species_3" COPASIkey="Metabolite_181"/>
    <SBMLMap SBMLid="species_4" COPASIkey="Metabolite_179"/>
    <SBMLMap SBMLid="species_5" COPASIkey="Metabolite_183"/>
    <SBMLMap SBMLid="species_6" COPASIkey="Metabolite_185"/>
    <SBMLMap SBMLid="species_7" COPASIkey="Metabolite_187"/>
    <SBMLMap SBMLid="species_8" COPASIkey="Metabolite_171"/>
    <SBMLMap SBMLid="species_9" COPASIkey="Metabolite_173"/>
  </SBMLReference>
</COPASI>
