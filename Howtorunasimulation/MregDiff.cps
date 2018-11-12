<?xml version="1.0" encoding="UTF-8"?>
<!-- generated with COPASI 4.16 (Build 104) (http://www.copasi.org) at 2016-04-21 20:48:15 UTC -->
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
        <body xmlns="http://www.w3.org/1999/xhtml">
<b>Mass action rate law for first order irreversible reactions</b>
<p>
Reaction scheme where the products are created from the reactants and the change of a product quantity is proportional to the product of reactant activities. The reaction scheme does not include any reverse process that creates the reactants from the products. The change of a product quantity is proportional to the quantity of one reactant.
</p>
</body>
      </Comment>
      <Expression>
        k1*PRODUCT&lt;substrate_i&gt;
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_81" name="k1" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_79" name="substrate" order="1" role="substrate"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_40" name="1 Substrate, 3 Activators" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_40">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T15:02:04Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

      </MiriamAnnotation>
      <Expression>
        Vf*S*(max(0,A1)^exp1/(max(0,A1)^exp1+K1^exp1)+max(0,A2)^exp1/(max(0,A2)^exp1+K2^exp1)+max(0,A3)^exp1/(max(0,A3)^exp1+K3^exp1))-Vr*P
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_264" name="Vf" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_268" name="K1" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_272" name="K2" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_276" name="K3" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_254" name="S" order="4" role="substrate"/>
        <ParameterDescription key="FunctionParameter_258" name="A1" order="5" role="modifier"/>
        <ParameterDescription key="FunctionParameter_266" name="exp1" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_270" name="A2" order="7" role="modifier"/>
        <ParameterDescription key="FunctionParameter_274" name="A3" order="8" role="modifier"/>
        <ParameterDescription key="FunctionParameter_278" name="Vr" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_280" name="P" order="10" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_41" name="Activated ion transport" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_41">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T15:27:52Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

      </MiriamAnnotation>
      <Expression>
        K1*A1*S-K2*P
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_281" name="K1" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_277" name="A1" order="1" role="modifier"/>
        <ParameterDescription key="FunctionParameter_273" name="S" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_269" name="K2" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_265" name="P" order="4" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_42" name="1 Substrate, 1 Activator" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_42">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T15:31:31Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

      </MiriamAnnotation>
      <Expression>
        Vf*S*(1+max(0,A1)^exp1/(max(0,A1)^exp1+K^exp1))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_246" name="Vf" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_271" name="S" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_279" name="A1" order="2" role="modifier"/>
        <ParameterDescription key="FunctionParameter_282" name="exp1" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_284" name="K" order="4" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_43" name="1 Substrate, 2 Activators" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_43">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T15:33:55Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

      </MiriamAnnotation>
      <Expression>
        Vf*S*(max(0,A1)^exp1/(max(0,A1)^exp1+K1^exp1)+max(0,A2)^exp1/(max(0,A2)^exp1+K2^exp1))-Vr*P
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_285" name="Vf" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_262" name="S" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_267" name="A1" order="2" role="modifier"/>
        <ParameterDescription key="FunctionParameter_287" name="exp1" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_289" name="K1" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_291" name="A2" order="5" role="modifier"/>
        <ParameterDescription key="FunctionParameter_293" name="K2" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_295" name="Vr" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_297" name="P" order="8" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_44" name="1 Substrate, 1 Inhibitor, 2 Activators" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_44">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T15:42:04Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

      </MiriamAnnotation>
      <Expression>
        Vf*S*(K^exp1/(max(0,I1)^exp1+K^exp1))*(max(0,A1)^exp1/(max(0,A1)^exp1+K1^exp1)+max(0,A2)^exp1/(max(0,A2)^exp1+K2^exp1))-Vr*P
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_298" name="Vf" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_294" name="S" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_290" name="K" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_286" name="exp1" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_283" name="I1" order="4" role="modifier"/>
        <ParameterDescription key="FunctionParameter_300" name="A1" order="5" role="modifier"/>
        <ParameterDescription key="FunctionParameter_302" name="K1" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_304" name="A2" order="7" role="modifier"/>
        <ParameterDescription key="FunctionParameter_306" name="K2" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_308" name="Vr" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_310" name="P" order="10" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_45" name="Rate Law for IL10 production_1" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_45">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-17T12:10:26Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vf*S*(K^exp1/(I1^exp1+K^exp1))*(A1^exp1/(A1^exp1+K1^exp1)+A2^exp1/(A2^exp1+K2^exp1)+A3^exp1/(A3^exp1+K3^exp1))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_311" name="Vf" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_307" name="S" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_303" name="K" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_299" name="exp1" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_288" name="I1" order="4" role="modifier"/>
        <ParameterDescription key="FunctionParameter_296" name="A1" order="5" role="modifier"/>
        <ParameterDescription key="FunctionParameter_313" name="K1" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_315" name="A2" order="7" role="modifier"/>
        <ParameterDescription key="FunctionParameter_317" name="K2" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_319" name="A3" order="9" role="modifier"/>
        <ParameterDescription key="FunctionParameter_321" name="K3" order="10" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_46" name="Rate Law for IL1B production" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_46">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-17T12:12:01Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vf*S*(K^exp1/(I1^exp1+K^exp1)+(K3^exp1/(I2^exp1+K3^exp1)))*(A1^exp1/(A1^exp1+K1^exp1)+A2^exp1/(A2^exp1+K2^exp1))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_322" name="Vf" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_318" name="S" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_314" name="K" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_292" name="exp1" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_301" name="I1" order="4" role="modifier"/>
        <ParameterDescription key="FunctionParameter_309" name="K3" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_324" name="I2" order="6" role="modifier"/>
        <ParameterDescription key="FunctionParameter_326" name="A1" order="7" role="modifier"/>
        <ParameterDescription key="FunctionParameter_328" name="K1" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_330" name="A2" order="9" role="modifier"/>
        <ParameterDescription key="FunctionParameter_332" name="K2" order="10" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_47" name="Rate Law for Mreg differentiation" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_47">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-17T15:52:27Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        K*(M1^exp1*M2^exp2*M3^exp3)/(M1+M2+M3+K1)-K2*P
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_333" name="K" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_329" name="M1" order="1" role="modifier"/>
        <ParameterDescription key="FunctionParameter_325" name="exp1" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_305" name="M2" order="3" role="modifier"/>
        <ParameterDescription key="FunctionParameter_312" name="exp2" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_320" name="M3" order="5" role="modifier"/>
        <ParameterDescription key="FunctionParameter_335" name="exp3" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_337" name="K1" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_339" name="K2" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_341" name="P" order="9" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_48" name="1 Substrate, 1 Activator (revmod)" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_48">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-17T17:02:50Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

      </MiriamAnnotation>
      <Expression>
        Vf*S*(max(0,A1)^exp1/(max(0,A1)^exp1+K1^exp1))-Vr*P
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_342" name="Vf" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_338" name="S" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_334" name="A1" order="2" role="modifier"/>
        <ParameterDescription key="FunctionParameter_275" name="exp1" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_327" name="K1" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_343" name="Vr" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_345" name="P" order="6" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_49" name="1 S, 1 A (mod)" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_49">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-17T17:09:45Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

      </MiriamAnnotation>
      <Expression>
        Vf*S*(B+max(0,A1)^exp1/(max(0,A1)^exp1+K^exp1))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_346" name="Vf" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_331" name="S" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_316" name="B" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_340" name="A1" order="3" role="modifier"/>
        <ParameterDescription key="FunctionParameter_348" name="exp1" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_350" name="K" order="5" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_50" name="1 S, 1A (revmod)" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_50">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-17T17:10:31Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

      </MiriamAnnotation>
      <Expression>
        Vf*S*(B+max(0,A1)^exp1/(max(0,A1)^exp1+K1^exp1))-Vr*P
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_351" name="Vf" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_347" name="S" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_323" name="B" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_352" name="A1" order="3" role="modifier"/>
        <ParameterDescription key="FunctionParameter_354" name="exp1" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_356" name="K1" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_358" name="Vr" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_360" name="P" order="7" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_51" name="1 S, 1 A, 1 I (mod)" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_51">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-17T17:11:20Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

      </MiriamAnnotation>
      <Expression>
        Vf*S*(K^exp1/(max(0,I1)^exp1+K^exp1))*(B+(max(0,A1)^exp1/(max(0,A1)^exp1+K1^exp1)))-Vr*P
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_361" name="Vf" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_357" name="S" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_353" name="K" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_336" name="exp1" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_362" name="I1" order="4" role="modifier"/>
        <ParameterDescription key="FunctionParameter_364" name="B" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_366" name="A1" order="6" role="modifier"/>
        <ParameterDescription key="FunctionParameter_368" name="K1" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_370" name="Vr" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_372" name="P" order="9" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_52" name="1 S, 2 A (mod2)" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_52">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-18T10:06:37Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

      </MiriamAnnotation>
      <Expression>
        Vf*(max(0,A1)^exp1/(max(0,A1)^exp1+K1^exp1)+max(0,A2)^exp1/(max(0,A2)^exp1+K2^exp1))-Vr*P
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_373" name="Vf" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_369" name="A1" order="1" role="modifier"/>
        <ParameterDescription key="FunctionParameter_365" name="exp1" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_349" name="K1" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_355" name="A2" order="4" role="modifier"/>
        <ParameterDescription key="FunctionParameter_374" name="K2" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_376" name="Vr" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_378" name="P" order="7" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_53" name="Rate Law for IL10R activation" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_53">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-04-04T17:08:48Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Vf*(K^exp1/(I1^exp1+K^exp1))*(B+(A1^exp1/(A1^exp1+K1^exp1)))-Vr*P
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_379" name="Vf" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_375" name="K" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_344" name="exp1" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_367" name="I1" order="3" role="modifier"/>
        <ParameterDescription key="FunctionParameter_380" name="B" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_382" name="A1" order="5" role="modifier"/>
        <ParameterDescription key="FunctionParameter_384" name="K1" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_386" name="Vr" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_388" name="P" order="8" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
  </ListOfFunctions>
  <Model key="Model_4" name="NoName" simulationType="time" timeUnit="s" volumeUnit="l" areaUnit="m²" lengthUnit="m" quantityUnit="mol" type="deterministic" avogadroConstant="6.02214179e+23">
    <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Model_4">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T14:32:21Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

    </MiriamAnnotation>
    <ListOfUnsupportedAnnotations>
      <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:modelVersion>4.0</celldesigner:modelVersion>
  <celldesigner:modelDisplay sizeX="1000" sizeY="1000" />
  <celldesigner:listOfCompartmentAliases />
  <celldesigner:listOfComplexSpeciesAliases />
  <celldesigner:listOfSpeciesAliases>
    <celldesigner:speciesAlias id="sa1" species="s1">
      <celldesigner:activity>inactive</celldesigner:activity>
      <celldesigner:bounds x="424.0" y="119.0" w="80.0" h="50.0" />
      <celldesigner:font size="12" />
      <celldesigner:view state="usual" />
      <celldesigner:usualView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="50.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="ffffffcc" scheme="Color" />
      </celldesigner:usualView>
      <celldesigner:briefView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="60.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="3fff0000" scheme="Color" />
      </celldesigner:briefView>
      <celldesigner:info state="empty" angle="-1.5707963267948966" />
    </celldesigner:speciesAlias>
    <celldesigner:speciesAlias id="sa2" species="s2">
      <celldesigner:activity>inactive</celldesigner:activity>
      <celldesigner:bounds x="596.0" y="123.0" w="80.0" h="50.0" />
      <celldesigner:font size="12" />
      <celldesigner:view state="usual" />
      <celldesigner:usualView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="50.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="ffffffcc" scheme="Color" />
      </celldesigner:usualView>
      <celldesigner:briefView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="60.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="3fff0000" scheme="Color" />
      </celldesigner:briefView>
      <celldesigner:info state="empty" angle="-1.5707963267948966" />
    </celldesigner:speciesAlias>
    <celldesigner:speciesAlias id="sa3" species="s3">
      <celldesigner:activity>inactive</celldesigner:activity>
      <celldesigner:bounds x="784.0" y="176.0" w="80.0" h="40.0" />
      <celldesigner:font size="12" />
      <celldesigner:view state="usual" />
      <celldesigner:usualView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="40.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="ffe8e7e7" scheme="Color" />
      </celldesigner:usualView>
      <celldesigner:briefView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="60.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="3fff0000" scheme="Color" />
      </celldesigner:briefView>
      <celldesigner:info state="empty" angle="-1.5707963267948966" />
    </celldesigner:speciesAlias>
    <celldesigner:speciesAlias id="sa4" species="s3">
      <celldesigner:activity>inactive</celldesigner:activity>
      <celldesigner:bounds x="848.0" y="264.0" w="80.0" h="40.0" />
      <celldesigner:font size="12" />
      <celldesigner:view state="usual" />
      <celldesigner:usualView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="40.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="ffccffcc" scheme="Color" />
      </celldesigner:usualView>
      <celldesigner:briefView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="60.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="3fff0000" scheme="Color" />
      </celldesigner:briefView>
      <celldesigner:info state="empty" angle="-1.5707963267948966" />
    </celldesigner:speciesAlias>
    <celldesigner:speciesAlias id="sa5" species="s4">
      <celldesigner:activity>inactive</celldesigner:activity>
      <celldesigner:bounds x="789.75" y="323.75" w="36.5" h="40.5" />
      <celldesigner:font size="12" />
      <celldesigner:view state="usual" />
      <celldesigner:usualView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="36.5" height="40.5" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="ff9999ff" scheme="Color" />
      </celldesigner:usualView>
      <celldesigner:briefView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="60.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="3fff0000" scheme="Color" />
      </celldesigner:briefView>
      <celldesigner:info state="empty" angle="-1.5707963267948966" />
    </celldesigner:speciesAlias>
    <celldesigner:speciesAlias id="sa6" species="s4">
      <celldesigner:activity>inactive</celldesigner:activity>
      <celldesigner:bounds x="894.0" y="324.0" w="36.0" h="40.0" />
      <celldesigner:font size="12" />
      <celldesigner:view state="usual" />
      <celldesigner:usualView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="36.0" height="40.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="ffececfc" scheme="Color" />
      </celldesigner:usualView>
      <celldesigner:briefView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="60.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="3fff0000" scheme="Color" />
      </celldesigner:briefView>
      <celldesigner:info state="empty" angle="-1.5707963267948966" />
    </celldesigner:speciesAlias>
    <celldesigner:speciesAlias id="sa7" species="s5">
      <celldesigner:activity>inactive</celldesigner:activity>
      <celldesigner:bounds x="652.0" y="232.0" w="80.0" h="40.0" />
      <celldesigner:font size="12" />
      <celldesigner:view state="usual" />
      <celldesigner:usualView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="40.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="ffccffcc" scheme="Color" />
      </celldesigner:usualView>
      <celldesigner:briefView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="60.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="3fff0000" scheme="Color" />
      </celldesigner:briefView>
      <celldesigner:info state="empty" angle="-1.5707963267948966" />
    </celldesigner:speciesAlias>
    <celldesigner:speciesAlias id="sa8" species="s6">
      <celldesigner:activity>inactive</celldesigner:activity>
      <celldesigner:bounds x="685.0" y="355.5" w="70.0" h="25.0" />
      <celldesigner:font size="12" />
      <celldesigner:view state="usual" />
      <celldesigner:usualView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="70.0" height="25.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="ff99ffcc" scheme="Color" />
      </celldesigner:usualView>
      <celldesigner:briefView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="60.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="3fff0000" scheme="Color" />
      </celldesigner:briefView>
      <celldesigner:info state="empty" angle="-1.5707963267948966" />
    </celldesigner:speciesAlias>
    <celldesigner:speciesAlias id="sa9" species="s7">
      <celldesigner:activity>inactive</celldesigner:activity>
      <celldesigner:bounds x="768.0" y="408.0" w="80.0" h="40.0" />
      <celldesigner:font size="12" />
      <celldesigner:view state="usual" />
      <celldesigner:usualView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="40.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="ffccffcc" scheme="Color" />
      </celldesigner:usualView>
      <celldesigner:briefView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="60.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="3fff0000" scheme="Color" />
      </celldesigner:briefView>
      <celldesigner:info state="empty" angle="-1.5707963267948966" />
    </celldesigner:speciesAlias>
    <celldesigner:speciesAlias id="sa11" species="s7">
      <celldesigner:activity>inactive</celldesigner:activity>
      <celldesigner:bounds x="592.0" y="408.0" w="80.0" h="40.0" />
      <celldesigner:font size="12" />
      <celldesigner:view state="usual" />
      <celldesigner:usualView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="40.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="ffe8e9e8" scheme="Color" />
      </celldesigner:usualView>
      <celldesigner:briefView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="60.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="3fff0000" scheme="Color" />
      </celldesigner:briefView>
      <celldesigner:info state="empty" angle="-1.5707963267948966" />
    </celldesigner:speciesAlias>
    <celldesigner:speciesAlias id="sa12" species="s8">
      <celldesigner:activity>inactive</celldesigner:activity>
      <celldesigner:bounds x="768.0" y="472.0" w="80.0" h="40.0" />
      <celldesigner:font size="12" />
      <celldesigner:view state="usual" />
      <celldesigner:usualView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="40.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="ffccffcc" scheme="Color" />
      </celldesigner:usualView>
      <celldesigner:briefView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="60.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="3fff0000" scheme="Color" />
      </celldesigner:briefView>
      <celldesigner:info state="empty" angle="-1.5707963267948966" />
    </celldesigner:speciesAlias>
    <celldesigner:speciesAlias id="sa13" species="s8">
      <celldesigner:activity>inactive</celldesigner:activity>
      <celldesigner:bounds x="592.0" y="472.0" w="80.0" h="40.0" />
      <celldesigner:font size="12" />
      <celldesigner:view state="usual" />
      <celldesigner:usualView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="40.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="ffe3e4e3" scheme="Color" />
      </celldesigner:usualView>
      <celldesigner:briefView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="60.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="3fff0000" scheme="Color" />
      </celldesigner:briefView>
      <celldesigner:info state="empty" angle="-1.5707963267948966" />
    </celldesigner:speciesAlias>
    <celldesigner:speciesAlias id="sa14" species="s9">
      <celldesigner:activity>inactive</celldesigner:activity>
      <celldesigner:bounds x="768.0" y="532.0" w="80.0" h="40.0" />
      <celldesigner:font size="12" />
      <celldesigner:view state="usual" />
      <celldesigner:usualView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="40.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="ffccffcc" scheme="Color" />
      </celldesigner:usualView>
      <celldesigner:briefView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="60.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="3fff0000" scheme="Color" />
      </celldesigner:briefView>
      <celldesigner:info state="empty" angle="-1.5707963267948966" />
    </celldesigner:speciesAlias>
    <celldesigner:speciesAlias id="sa15" species="s10">
      <celldesigner:activity>inactive</celldesigner:activity>
      <celldesigner:bounds x="880.0" y="435.0" w="80.0" h="50.0" />
      <celldesigner:font size="12" />
      <celldesigner:view state="usual" />
      <celldesigner:usualView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="50.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="ffffffcc" scheme="Color" />
      </celldesigner:usualView>
      <celldesigner:briefView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="60.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="3fff0000" scheme="Color" />
      </celldesigner:briefView>
      <celldesigner:info state="empty" angle="-1.5707963267948966" />
    </celldesigner:speciesAlias>
    <celldesigner:speciesAlias id="sa16" species="s11">
      <celldesigner:activity>inactive</celldesigner:activity>
      <celldesigner:bounds x="372.0" y="208.0" w="80.0" h="40.0" />
      <celldesigner:font size="12" />
      <celldesigner:view state="usual" />
      <celldesigner:usualView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="40.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="ffccffcc" scheme="Color" />
      </celldesigner:usualView>
      <celldesigner:briefView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="60.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="3fff0000" scheme="Color" />
      </celldesigner:briefView>
      <celldesigner:info state="empty" angle="-1.5707963267948966" />
    </celldesigner:speciesAlias>
    <celldesigner:speciesAlias id="sa17" species="s12">
      <celldesigner:activity>inactive</celldesigner:activity>
      <celldesigner:bounds x="140.0" y="364.0" w="80.0" h="40.0" />
      <celldesigner:font size="12" />
      <celldesigner:view state="usual" />
      <celldesigner:usualView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="40.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="ffccffcc" scheme="Color" />
      </celldesigner:usualView>
      <celldesigner:briefView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="60.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="3fff0000" scheme="Color" />
      </celldesigner:briefView>
      <celldesigner:info state="empty" angle="-1.5707963267948966" />
    </celldesigner:speciesAlias>
    <celldesigner:speciesAlias id="sa18" species="s13">
      <celldesigner:activity>inactive</celldesigner:activity>
      <celldesigner:bounds x="140.0" y="447.0" w="80.0" h="50.0" />
      <celldesigner:font size="12" />
      <celldesigner:view state="usual" />
      <celldesigner:usualView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="50.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="ffffffcc" scheme="Color" />
      </celldesigner:usualView>
      <celldesigner:briefView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="60.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="3fff0000" scheme="Color" />
      </celldesigner:briefView>
      <celldesigner:info state="empty" angle="-1.5707963267948966" />
    </celldesigner:speciesAlias>
    <celldesigner:speciesAlias id="sa19" species="s14">
      <celldesigner:activity>inactive</celldesigner:activity>
      <celldesigner:bounds x="709.0" y="91.5" w="70.0" h="25.0" />
      <celldesigner:font size="12" />
      <celldesigner:view state="usual" />
      <celldesigner:usualView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="70.0" height="25.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="ff99ffcc" scheme="Color" />
      </celldesigner:usualView>
      <celldesigner:briefView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="60.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="3fff0000" scheme="Color" />
      </celldesigner:briefView>
      <celldesigner:info state="empty" angle="-1.5707963267948966" />
    </celldesigner:speciesAlias>
    <celldesigner:speciesAlias id="sa20" species="s15">
      <celldesigner:activity>inactive</celldesigner:activity>
      <celldesigner:bounds x="488.0" y="385.0" w="80.0" h="40.0" />
      <celldesigner:font size="12" />
      <celldesigner:view state="usual" />
      <celldesigner:usualView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="40.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="ffccffcc" scheme="Color" />
      </celldesigner:usualView>
      <celldesigner:briefView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="60.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="3fff0000" scheme="Color" />
      </celldesigner:briefView>
      <celldesigner:info state="empty" angle="-1.5707963267948966" />
    </celldesigner:speciesAlias>
    <celldesigner:speciesAlias id="sa21" species="s16">
      <celldesigner:activity>inactive</celldesigner:activity>
      <celldesigner:bounds x="488.0" y="312.0" w="80.0" h="40.0" />
      <celldesigner:font size="12" />
      <celldesigner:view state="usual" />
      <celldesigner:usualView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="40.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="ffccffcc" scheme="Color" />
      </celldesigner:usualView>
      <celldesigner:briefView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="60.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="3fff0000" scheme="Color" />
      </celldesigner:briefView>
      <celldesigner:info state="empty" angle="-1.5707963267948966" />
    </celldesigner:speciesAlias>
    <celldesigner:speciesAlias id="sa22" species="s16">
      <celldesigner:activity>inactive</celldesigner:activity>
      <celldesigner:bounds x="488.0" y="208.0" w="80.0" h="40.0" />
      <celldesigner:font size="12" />
      <celldesigner:view state="usual" />
      <celldesigner:usualView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="40.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="ffdedfde" scheme="Color" />
      </celldesigner:usualView>
      <celldesigner:briefView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="60.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="3fff0000" scheme="Color" />
      </celldesigner:briefView>
      <celldesigner:info state="empty" angle="-1.5707963267948966" />
    </celldesigner:speciesAlias>
    <celldesigner:speciesAlias id="sa23" species="s9">
      <celldesigner:activity>inactive</celldesigner:activity>
      <celldesigner:bounds x="592.0" y="532.0" w="80.0" h="40.0" />
      <celldesigner:font size="12" />
      <celldesigner:view state="usual" />
      <celldesigner:usualView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="40.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="ffe4e6e4" scheme="Color" />
      </celldesigner:usualView>
      <celldesigner:briefView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="60.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="3fff0000" scheme="Color" />
      </celldesigner:briefView>
      <celldesigner:info state="empty" angle="-1.5707963267948966" />
    </celldesigner:speciesAlias>
    <celldesigner:speciesAlias id="sa24" species="s15">
      <celldesigner:activity>inactive</celldesigner:activity>
      <celldesigner:bounds x="332.0" y="385.0" w="80.0" h="40.0" />
      <celldesigner:font size="12" />
      <celldesigner:view state="usual" />
      <celldesigner:usualView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="40.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="ffe1e2e1" scheme="Color" />
      </celldesigner:usualView>
      <celldesigner:briefView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="60.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="3fff0000" scheme="Color" />
      </celldesigner:briefView>
      <celldesigner:info state="empty" angle="-1.5707963267948966" />
    </celldesigner:speciesAlias>
    <celldesigner:speciesAlias id="sa25" species="s1">
      <celldesigner:activity>inactive</celldesigner:activity>
      <celldesigner:bounds x="256.0" y="119.0" w="80.0" h="50.0" />
      <celldesigner:font size="12" />
      <celldesigner:view state="usual" />
      <celldesigner:usualView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="50.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="ffe8e8e7" scheme="Color" />
      </celldesigner:usualView>
      <celldesigner:briefView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="60.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="3fff0000" scheme="Color" />
      </celldesigner:briefView>
      <celldesigner:info state="empty" angle="-1.5707963267948966" />
    </celldesigner:speciesAlias>
    <celldesigner:speciesAlias id="sa26" species="s17">
      <celldesigner:activity>inactive</celldesigner:activity>
      <celldesigner:bounds x="536.0" y="661.0" w="80.0" h="30.0" />
      <celldesigner:font size="12" />
      <celldesigner:view state="usual" />
      <celldesigner:usualView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="30.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="ffcc99ff" scheme="Color" />
      </celldesigner:usualView>
      <celldesigner:briefView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="60.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="3fff0000" scheme="Color" />
      </celldesigner:briefView>
      <celldesigner:info state="empty" angle="-1.5707963267948966" />
    </celldesigner:speciesAlias>
    <celldesigner:speciesAlias id="sa27" species="s11">
      <celldesigner:activity>inactive</celldesigner:activity>
      <celldesigner:bounds x="188.0" y="208.0" w="80.0" h="40.0" />
      <celldesigner:font size="12" />
      <celldesigner:view state="usual" />
      <celldesigner:usualView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="40.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="ffe2e3e2" scheme="Color" />
      </celldesigner:usualView>
      <celldesigner:briefView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="60.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="3fff0000" scheme="Color" />
      </celldesigner:briefView>
      <celldesigner:info state="empty" angle="-1.5707963267948966" />
    </celldesigner:speciesAlias>
    <celldesigner:speciesAlias id="sa28" species="s12">
      <celldesigner:activity>inactive</celldesigner:activity>
      <celldesigner:bounds x="141.0" y="281.0" w="80.0" h="40.0" />
      <celldesigner:font size="12" />
      <celldesigner:view state="usual" />
      <celldesigner:usualView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="40.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="ffe3e4e3" scheme="Color" />
      </celldesigner:usualView>
      <celldesigner:briefView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="60.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="3fff0000" scheme="Color" />
      </celldesigner:briefView>
      <celldesigner:info state="empty" angle="-1.5707963267948966" />
    </celldesigner:speciesAlias>
    <celldesigner:speciesAlias id="sa29" species="s18">
      <celldesigner:activity>inactive</celldesigner:activity>
      <celldesigner:bounds x="488.0" y="577.0" w="80.0" h="40.0" />
      <celldesigner:font size="12" />
      <celldesigner:view state="usual" />
      <celldesigner:usualView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="40.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="ffccffcc" scheme="Color" />
      </celldesigner:usualView>
      <celldesigner:briefView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="60.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="3fff0000" scheme="Color" />
      </celldesigner:briefView>
      <celldesigner:info state="empty" angle="-1.5707963267948966" />
    </celldesigner:speciesAlias>
    <celldesigner:speciesAlias id="sa30" species="s18">
      <celldesigner:activity>inactive</celldesigner:activity>
      <celldesigner:bounds x="488.0" y="460.0" w="80.0" h="40.0" />
      <celldesigner:font size="12" />
      <celldesigner:view state="usual" />
      <celldesigner:usualView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="40.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="ffe6e7e6" scheme="Color" />
      </celldesigner:usualView>
      <celldesigner:briefView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="60.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="3fff0000" scheme="Color" />
      </celldesigner:briefView>
      <celldesigner:info state="empty" angle="-1.5707963267948966" />
    </celldesigner:speciesAlias>
    <celldesigner:speciesAlias id="sa31" species="s19">
      <celldesigner:activity>inactive</celldesigner:activity>
      <celldesigner:bounds x="33.0" y="311.5" w="70.0" h="25.0" />
      <celldesigner:font size="12" />
      <celldesigner:view state="usual" />
      <celldesigner:usualView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="70.0" height="25.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="ffff6666" scheme="Color" />
      </celldesigner:usualView>
      <celldesigner:briefView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="60.0" />
        <celldesigner:singleLine width="0.0" />
        <celldesigner:paint color="3fff0000" scheme="Color" />
      </celldesigner:briefView>
      <celldesigner:info state="empty" angle="-1.5707963267948966" />
    </celldesigner:speciesAlias>
    <celldesigner:speciesAlias id="sa32" species="s24">
      <celldesigner:activity>inactive</celldesigner:activity>
      <celldesigner:bounds x="376.0" y="552.0" w="80.0" h="40.0" />
      <celldesigner:font size="12" />
      <celldesigner:view state="usual" />
      <celldesigner:usualView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="40.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="ffccffcc" scheme="Color" />
      </celldesigner:usualView>
      <celldesigner:briefView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="60.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="3fff0000" scheme="Color" />
      </celldesigner:briefView>
      <celldesigner:info state="empty" angle="-1.5707963267948966" />
    </celldesigner:speciesAlias>
    <celldesigner:speciesAlias id="sa33" species="s20">
      <celldesigner:activity>inactive</celldesigner:activity>
      <celldesigner:bounds x="28.0" y="500.0" w="80.0" h="40.0" />
      <celldesigner:font size="12" />
      <celldesigner:view state="usual" />
      <celldesigner:usualView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="40.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="ffccffcc" scheme="Color" />
      </celldesigner:usualView>
      <celldesigner:briefView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="60.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="3fff0000" scheme="Color" />
      </celldesigner:briefView>
      <celldesigner:info state="empty" angle="-1.5707963267948966" />
    </celldesigner:speciesAlias>
    <celldesigner:speciesAlias id="sa34" species="s21">
      <celldesigner:activity>inactive</celldesigner:activity>
      <celldesigner:bounds x="244.0" y="368.0" w="80.0" h="40.0" />
      <celldesigner:font size="12" />
      <celldesigner:view state="usual" />
      <celldesigner:usualView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="40.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="ffccffcc" scheme="Color" />
      </celldesigner:usualView>
      <celldesigner:briefView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="60.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="3fff0000" scheme="Color" />
      </celldesigner:briefView>
      <celldesigner:info state="empty" angle="-1.5707963267948966" />
    </celldesigner:speciesAlias>
    <celldesigner:speciesAlias id="sa35" species="s22">
      <celldesigner:activity>inactive</celldesigner:activity>
      <celldesigner:bounds x="372.0" y="448.0" w="80.0" h="40.0" />
      <celldesigner:font size="12" />
      <celldesigner:view state="usual" />
      <celldesigner:usualView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="40.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="ffccffcc" scheme="Color" />
      </celldesigner:usualView>
      <celldesigner:briefView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="60.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="3fff0000" scheme="Color" />
      </celldesigner:briefView>
      <celldesigner:info state="empty" angle="-1.5707963267948966" />
    </celldesigner:speciesAlias>
    <celldesigner:speciesAlias id="sa36" species="s23">
      <celldesigner:activity>inactive</celldesigner:activity>
      <celldesigner:bounds x="248.0" y="500.0" w="80.0" h="40.0" />
      <celldesigner:font size="12" />
      <celldesigner:view state="usual" />
      <celldesigner:usualView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="40.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="ffccffcc" scheme="Color" />
      </celldesigner:usualView>
      <celldesigner:briefView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="60.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="3fff0000" scheme="Color" />
      </celldesigner:briefView>
      <celldesigner:info state="empty" angle="-1.5707963267948966" />
    </celldesigner:speciesAlias>
    <celldesigner:speciesAlias id="sa37" species="s20">
      <celldesigner:activity>inactive</celldesigner:activity>
      <celldesigner:bounds x="28.0" y="380.0" w="80.0" h="40.0" />
      <celldesigner:font size="12" />
      <celldesigner:view state="usual" />
      <celldesigner:usualView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="40.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="ffe1e2e1" scheme="Color" />
      </celldesigner:usualView>
      <celldesigner:briefView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="60.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="3fff0000" scheme="Color" />
      </celldesigner:briefView>
      <celldesigner:info state="empty" angle="-1.5707963267948966" />
    </celldesigner:speciesAlias>
    <celldesigner:speciesAlias id="sa38" species="s24">
      <celldesigner:activity>inactive</celldesigner:activity>
      <celldesigner:bounds x="248.0" y="552.0" w="80.0" h="40.0" />
      <celldesigner:font size="12" />
      <celldesigner:view state="usual" />
      <celldesigner:usualView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="40.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="ffe1e2e1" scheme="Color" />
      </celldesigner:usualView>
      <celldesigner:briefView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="60.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="3fff0000" scheme="Color" />
      </celldesigner:briefView>
      <celldesigner:info state="empty" angle="-1.5707963267948966" />
    </celldesigner:speciesAlias>
    <celldesigner:speciesAlias id="sa39" species="s23">
      <celldesigner:activity>inactive</celldesigner:activity>
      <celldesigner:bounds x="372.0" y="500.0" w="80.0" h="40.0" />
      <celldesigner:font size="12" />
      <celldesigner:view state="usual" />
      <celldesigner:usualView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="40.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="ffe1e2e1" scheme="Color" />
      </celldesigner:usualView>
      <celldesigner:briefView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="60.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="3fff0000" scheme="Color" />
      </celldesigner:briefView>
      <celldesigner:info state="empty" angle="-1.5707963267948966" />
    </celldesigner:speciesAlias>
    <celldesigner:speciesAlias id="sa40" species="s22">
      <celldesigner:activity>inactive</celldesigner:activity>
      <celldesigner:bounds x="248.0" y="448.0" w="80.0" h="40.0" />
      <celldesigner:font size="12" />
      <celldesigner:view state="usual" />
      <celldesigner:usualView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="40.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="ffe1e2e1" scheme="Color" />
      </celldesigner:usualView>
      <celldesigner:briefView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="60.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="3fff0000" scheme="Color" />
      </celldesigner:briefView>
      <celldesigner:info state="empty" angle="-1.5707963267948966" />
    </celldesigner:speciesAlias>
    <celldesigner:speciesAlias id="sa41" species="s21">
      <celldesigner:activity>inactive</celldesigner:activity>
      <celldesigner:bounds x="244.0" y="268.0" w="80.0" h="40.0" />
      <celldesigner:font size="12" />
      <celldesigner:view state="usual" />
      <celldesigner:usualView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="40.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="ffe1e2e1" scheme="Color" />
      </celldesigner:usualView>
      <celldesigner:briefView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="60.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="3fff0000" scheme="Color" />
      </celldesigner:briefView>
      <celldesigner:info state="empty" angle="-1.5707963267948966" />
    </celldesigner:speciesAlias>
    <celldesigner:speciesAlias id="sa42" species="s25">
      <celldesigner:activity>inactive</celldesigner:activity>
      <celldesigner:bounds x="429.0" y="259.5" w="70.0" h="25.0" />
      <celldesigner:font size="12" />
      <celldesigner:view state="usual" />
      <celldesigner:usualView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="70.0" height="25.0" />
        <celldesigner:singleLine width="1.0" />
        <celldesigner:paint color="ff99ffcc" scheme="Color" />
      </celldesigner:usualView>
      <celldesigner:briefView>
        <celldesigner:innerPosition x="0.0" y="0.0" />
        <celldesigner:boxSize width="80.0" height="60.0" />
        <celldesigner:singleLine width="0.0" />
        <celldesigner:paint color="3fff0000" scheme="Color" />
      </celldesigner:briefView>
      <celldesigner:info state="empty" angle="-1.5707963267948966" />
    </celldesigner:speciesAlias>
  </celldesigner:listOfSpeciesAliases>
  <celldesigner:listOfGroups />
  <celldesigner:listOfProteins>
    <celldesigner:protein id="pr1" name="CX3CR1" type="RECEPTOR" />
    <celldesigner:protein id="pr2" name="DAP12" type="RECEPTOR" />
    <celldesigner:protein id="pr3" name="ERK" type="GENERIC" />
    <celldesigner:protein id="pr4" name="AC" type="GENERIC" />
    <celldesigner:protein id="pr5" name="PKA" type="GENERIC" />
    <celldesigner:protein id="pr6" name="CREB" type="GENERIC" />
    <celldesigner:protein id="pr7" name="IL10" type="GENERIC" />
    <celldesigner:protein id="pr8" name="IL10R" type="RECEPTOR" />
    <celldesigner:protein id="pr9" name="Akt" type="GENERIC" />
    <celldesigner:protein id="pr10" name="M-CSF" type="GENERIC" />
    <celldesigner:protein id="pr11" name="CSF1R" type="RECEPTOR" />
    <celldesigner:protein id="pr12" name="NFAT" type="GENERIC" />
    <celldesigner:protein id="pr13" name="LANCL2" type="GENERIC" />
    <celldesigner:protein id="pr14" name="IL1B" type="GENERIC" />
    <celldesigner:protein id="pr15" name="Traf2" type="GENERIC" />
    <celldesigner:protein id="pr16" name="Fbxo7" type="GENERIC" />
    <celldesigner:protein id="pr17" name="NCOR2" type="GENERIC" />
    <celldesigner:protein id="pr18" name="FOXP1" type="GENERIC" />
    <celldesigner:protein id="pr19" name="NFkB" type="GENERIC" />
  </celldesigner:listOfProteins>
  <celldesigner:listOfGenes />
  <celldesigner:listOfRNAs />
  <celldesigner:listOfAntisenseRNAs />
  <celldesigner:listOfLayers />
  <celldesigner:listOfBlockDiagrams />
</celldesigner:extension>
      </UnsupportedAnnotation>
    </ListOfUnsupportedAnnotations>
    <ListOfCompartments>
      <Compartment key="Compartment_1" name="default" simulationType="fixed" dimensionality="3">
      </Compartment>
    </ListOfCompartments>
    <ListOfMetabolites>
      <Metabolite key="Metabolite_1" name="CX3CR1" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T16:17:30Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:positionToCompartment>inside</celldesigner:positionToCompartment>
  <celldesigner:speciesIdentity>
    <celldesigner:class>PROTEIN</celldesigner:class>
    <celldesigner:proteinReference>pr1</celldesigner:proteinReference>
  </celldesigner:speciesIdentity>
  <celldesigner:listOfCatalyzedReactions>
    <celldesigner:catalyzed reaction="re1" />
    <celldesigner:catalyzed reaction="re16" />
  </celldesigner:listOfCatalyzedReactions>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
      </Metabolite>
      <Metabolite key="Metabolite_3" name="DAP12" simulationType="reactions" compartment="Compartment_1">
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:positionToCompartment>inside</celldesigner:positionToCompartment>
  <celldesigner:speciesIdentity>
    <celldesigner:class>PROTEIN</celldesigner:class>
    <celldesigner:proteinReference>pr2</celldesigner:proteinReference>
  </celldesigner:speciesIdentity>
  <celldesigner:listOfCatalyzedReactions>
    <celldesigner:catalyzed reaction="re1" />
    <celldesigner:catalyzed reaction="re8" />
    <celldesigner:catalyzed reaction="re16" />
  </celldesigner:listOfCatalyzedReactions>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
      </Metabolite>
      <Metabolite key="Metabolite_5" name="ERK" simulationType="reactions" compartment="Compartment_1">
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:positionToCompartment>inside</celldesigner:positionToCompartment>
  <celldesigner:speciesIdentity>
    <celldesigner:class>PROTEIN</celldesigner:class>
    <celldesigner:proteinReference>pr3</celldesigner:proteinReference>
  </celldesigner:speciesIdentity>
  <celldesigner:listOfCatalyzedReactions>
    <celldesigner:catalyzed reaction="re2" />
  </celldesigner:listOfCatalyzedReactions>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
      </Metabolite>
      <Metabolite key="Metabolite_7" name="Ca2+" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_7">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T16:18:42Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:positionToCompartment>inside</celldesigner:positionToCompartment>
  <celldesigner:speciesIdentity>
    <celldesigner:class>ION</celldesigner:class>
    <celldesigner:name>Ca2+</celldesigner:name>
  </celldesigner:speciesIdentity>
  <celldesigner:listOfCatalyzedReactions>
    <celldesigner:catalyzed reaction="re5" />
  </celldesigner:listOfCatalyzedReactions>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
      </Metabolite>
      <Metabolite key="Metabolite_9" name="AC" simulationType="fixed" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_9">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T16:17:29Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:positionToCompartment>inside</celldesigner:positionToCompartment>
  <celldesigner:speciesIdentity>
    <celldesigner:class>PROTEIN</celldesigner:class>
    <celldesigner:proteinReference>pr4</celldesigner:proteinReference>
  </celldesigner:speciesIdentity>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
      </Metabolite>
      <Metabolite key="Metabolite_11" name="cAMP" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_11">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T16:17:30Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:positionToCompartment>inside</celldesigner:positionToCompartment>
  <celldesigner:speciesIdentity>
    <celldesigner:class>SIMPLE_MOLECULE</celldesigner:class>
    <celldesigner:name>cAMP</celldesigner:name>
  </celldesigner:speciesIdentity>
  <celldesigner:listOfCatalyzedReactions>
    <celldesigner:catalyzed reaction="re4" />
  </celldesigner:listOfCatalyzedReactions>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
      </Metabolite>
      <Metabolite key="Metabolite_13" name="PKA" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_13">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T16:17:47Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:positionToCompartment>inside</celldesigner:positionToCompartment>
  <celldesigner:speciesIdentity>
    <celldesigner:class>PROTEIN</celldesigner:class>
    <celldesigner:proteinReference>pr5</celldesigner:proteinReference>
  </celldesigner:speciesIdentity>
  <celldesigner:listOfCatalyzedReactions>
    <celldesigner:catalyzed reaction="re5" />
  </celldesigner:listOfCatalyzedReactions>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
      </Metabolite>
      <Metabolite key="Metabolite_15" name="CREB" simulationType="reactions" compartment="Compartment_1">
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:positionToCompartment>inside</celldesigner:positionToCompartment>
  <celldesigner:speciesIdentity>
    <celldesigner:class>PROTEIN</celldesigner:class>
    <celldesigner:proteinReference>pr6</celldesigner:proteinReference>
  </celldesigner:speciesIdentity>
  <celldesigner:listOfCatalyzedReactions>
    <celldesigner:catalyzed reaction="re6" />
  </celldesigner:listOfCatalyzedReactions>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
      </Metabolite>
      <Metabolite key="Metabolite_17" name="IL10" simulationType="reactions" compartment="Compartment_1">
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:positionToCompartment>inside</celldesigner:positionToCompartment>
  <celldesigner:speciesIdentity>
    <celldesigner:class>PROTEIN</celldesigner:class>
    <celldesigner:proteinReference>pr7</celldesigner:proteinReference>
  </celldesigner:speciesIdentity>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
      </Metabolite>
      <Metabolite key="Metabolite_19" name="IL10R" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_19">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-04-04T16:57:49Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:positionToCompartment>inside</celldesigner:positionToCompartment>
  <celldesigner:speciesIdentity>
    <celldesigner:class>PROTEIN</celldesigner:class>
    <celldesigner:proteinReference>pr8</celldesigner:proteinReference>
  </celldesigner:speciesIdentity>
  <celldesigner:listOfCatalyzedReactions>
    <celldesigner:catalyzed reaction="re20" />
  </celldesigner:listOfCatalyzedReactions>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
      </Metabolite>
      <Metabolite key="Metabolite_21" name="Akt" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_21">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T16:17:29Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:positionToCompartment>inside</celldesigner:positionToCompartment>
  <celldesigner:speciesIdentity>
    <celldesigner:class>PROTEIN</celldesigner:class>
    <celldesigner:proteinReference>pr9</celldesigner:proteinReference>
  </celldesigner:speciesIdentity>
  <celldesigner:listOfCatalyzedReactions>
    <celldesigner:catalyzed reaction="re8" />
  </celldesigner:listOfCatalyzedReactions>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
      </Metabolite>
      <Metabolite key="Metabolite_23" name="M-CSF" simulationType="reactions" compartment="Compartment_1">
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:positionToCompartment>inside</celldesigner:positionToCompartment>
  <celldesigner:speciesIdentity>
    <celldesigner:class>PROTEIN</celldesigner:class>
    <celldesigner:proteinReference>pr10</celldesigner:proteinReference>
  </celldesigner:speciesIdentity>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
      </Metabolite>
      <Metabolite key="Metabolite_25" name="CSF1R" simulationType="reactions" compartment="Compartment_1">
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:positionToCompartment>inside</celldesigner:positionToCompartment>
  <celldesigner:speciesIdentity>
    <celldesigner:class>PROTEIN</celldesigner:class>
    <celldesigner:proteinReference>pr11</celldesigner:proteinReference>
  </celldesigner:speciesIdentity>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
      </Metabolite>
      <Metabolite key="Metabolite_27" name="SIRPb1" simulationType="fixed" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_27">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T16:17:55Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:positionToCompartment>inside</celldesigner:positionToCompartment>
  <celldesigner:speciesIdentity>
    <celldesigner:class>SIMPLE_MOLECULE</celldesigner:class>
    <celldesigner:name>SIRPb1</celldesigner:name>
  </celldesigner:speciesIdentity>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
      </Metabolite>
      <Metabolite key="Metabolite_29" name="NFAT" simulationType="reactions" compartment="Compartment_1">
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:positionToCompartment>inside</celldesigner:positionToCompartment>
  <celldesigner:speciesIdentity>
    <celldesigner:class>PROTEIN</celldesigner:class>
    <celldesigner:proteinReference>pr12</celldesigner:proteinReference>
  </celldesigner:speciesIdentity>
  <celldesigner:listOfCatalyzedReactions>
    <celldesigner:catalyzed reaction="re11" />
    <celldesigner:catalyzed reaction="re19" />
    <celldesigner:catalyzed reaction="re20" />
  </celldesigner:listOfCatalyzedReactions>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
      </Metabolite>
      <Metabolite key="Metabolite_31" name="LANCL2" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_31">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-17T15:47:30Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:positionToCompartment>inside</celldesigner:positionToCompartment>
  <celldesigner:speciesIdentity>
    <celldesigner:class>PROTEIN</celldesigner:class>
    <celldesigner:proteinReference>pr13</celldesigner:proteinReference>
  </celldesigner:speciesIdentity>
  <celldesigner:listOfCatalyzedReactions>
    <celldesigner:catalyzed reaction="re3" />
    <celldesigner:catalyzed reaction="re16" />
    <celldesigner:catalyzed reaction="re25" />
    <celldesigner:catalyzed reaction="re27" />
  </celldesigner:listOfCatalyzedReactions>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
      </Metabolite>
      <Metabolite key="Metabolite_33" name="Mreg" simulationType="reactions" compartment="Compartment_1">
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:positionToCompartment>inside</celldesigner:positionToCompartment>
  <celldesigner:speciesIdentity>
    <celldesigner:class>PHENOTYPE</celldesigner:class>
    <celldesigner:name>Mreg</celldesigner:name>
  </celldesigner:speciesIdentity>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
      </Metabolite>
      <Metabolite key="Metabolite_35" name="HP" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_35">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T16:20:03Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:positionToCompartment>inside</celldesigner:positionToCompartment>
  <celldesigner:speciesIdentity>
    <celldesigner:class>SIMPLE_MOLECULE</celldesigner:class>
    <celldesigner:name>HP</celldesigner:name>
  </celldesigner:speciesIdentity>
  <celldesigner:listOfCatalyzedReactions>
    <celldesigner:catalyzed reaction="re26" />
  </celldesigner:listOfCatalyzedReactions>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
      </Metabolite>
      <Metabolite key="Metabolite_37" name="Traf2" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_37">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-17T11:56:53Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:positionToCompartment>inside</celldesigner:positionToCompartment>
  <celldesigner:speciesIdentity>
    <celldesigner:class>PROTEIN</celldesigner:class>
    <celldesigner:proteinReference>pr15</celldesigner:proteinReference>
  </celldesigner:speciesIdentity>
  <celldesigner:listOfCatalyzedReactions>
    <celldesigner:catalyzed reaction="re29" />
  </celldesigner:listOfCatalyzedReactions>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
      </Metabolite>
      <Metabolite key="Metabolite_39" name="Fbxo7" simulationType="reactions" compartment="Compartment_1">
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:positionToCompartment>inside</celldesigner:positionToCompartment>
  <celldesigner:speciesIdentity>
    <celldesigner:class>PROTEIN</celldesigner:class>
    <celldesigner:proteinReference>pr16</celldesigner:proteinReference>
  </celldesigner:speciesIdentity>
  <celldesigner:listOfCatalyzedReactions>
    <celldesigner:catalyzed reaction="re29" />
  </celldesigner:listOfCatalyzedReactions>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
      </Metabolite>
      <Metabolite key="Metabolite_41" name="NCOR2" simulationType="reactions" compartment="Compartment_1">
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:positionToCompartment>inside</celldesigner:positionToCompartment>
  <celldesigner:speciesIdentity>
    <celldesigner:class>PROTEIN</celldesigner:class>
    <celldesigner:proteinReference>pr17</celldesigner:proteinReference>
  </celldesigner:speciesIdentity>
  <celldesigner:listOfCatalyzedReactions>
    <celldesigner:catalyzed reaction="re28" />
  </celldesigner:listOfCatalyzedReactions>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
      </Metabolite>
      <Metabolite key="Metabolite_43" name="FOXP1" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_43">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T16:17:31Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:positionToCompartment>inside</celldesigner:positionToCompartment>
  <celldesigner:speciesIdentity>
    <celldesigner:class>PROTEIN</celldesigner:class>
    <celldesigner:proteinReference>pr18</celldesigner:proteinReference>
  </celldesigner:speciesIdentity>
  <celldesigner:listOfCatalyzedReactions>
    <celldesigner:catalyzed reaction="re6" />
    <celldesigner:catalyzed reaction="re9" />
  </celldesigner:listOfCatalyzedReactions>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
      </Metabolite>
      <Metabolite key="Metabolite_45" name="NFkB" simulationType="reactions" compartment="Compartment_1">
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:positionToCompartment>inside</celldesigner:positionToCompartment>
  <celldesigner:speciesIdentity>
    <celldesigner:class>PROTEIN</celldesigner:class>
    <celldesigner:proteinReference>pr19</celldesigner:proteinReference>
  </celldesigner:speciesIdentity>
  <celldesigner:listOfCatalyzedReactions>
    <celldesigner:catalyzed reaction="re20" />
  </celldesigner:listOfCatalyzedReactions>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
      </Metabolite>
      <Metabolite key="Metabolite_47" name="ABA" simulationType="fixed" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_47">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T14:56:02Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:positionToCompartment>inside</celldesigner:positionToCompartment>
  <celldesigner:speciesIdentity>
    <celldesigner:class>SIMPLE_MOLECULE</celldesigner:class>
    <celldesigner:name>ABA</celldesigner:name>
  </celldesigner:speciesIdentity>
  <celldesigner:listOfCatalyzedReactions>
    <celldesigner:catalyzed reaction="re18" />
  </celldesigner:listOfCatalyzedReactions>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
      </Metabolite>
      <Metabolite key="Metabolite_49" name="pAkt" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_49">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T14:52:47Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_51" name="eCa2+" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_51">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T16:18:37Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_53" name="iCa2+" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_53">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T16:18:39Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_55" name="pCREB" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_55">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T14:52:54Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_57" name="pCX3CR1" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_57">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T14:52:56Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_59" name="pERK" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_59">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T14:52:59Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_61" name="pFbxo7" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_61">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T14:53:03Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_63" name="pFOXP1" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_63">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T14:53:06Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_65" name="pIL10" simulationType="fixed" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_65">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T14:53:09Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_67" name="pLANCL2" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_67">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T14:53:15Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_69" name="pM-CSF" simulationType="fixed" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_69">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T14:53:18Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_71" name="pNCOR2" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_71">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T14:53:21Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_73" name="pNFAT" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_73">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T14:53:23Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_75" name="pNFkB" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_75">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T14:53:26Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_77" name="pPKA" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_77">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T14:53:30Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_79" name="pTraf2" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_79">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T14:53:33Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_81" name="pIL10R" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_81">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T16:17:40Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_83" name="pCSF1R" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_83">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T16:17:36Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_85" name="Mono" simulationType="reactions" compartment="Compartment_1">
      </Metabolite>
      <Metabolite key="Metabolite_87" name="KLF4" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_87">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-17T17:39:01Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_89" name="pKLF4" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_89">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-17T17:38:59Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_91" name="CX3CL1" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_91">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-17T17:39:10Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_93" name="pCX3CL1" simulationType="fixed" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_93">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-17T17:38:47Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_95" name="IFNg" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_95">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-04-04T16:57:14Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_97" name="pIFNg" simulationType="fixed" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_97">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-04-04T16:56:54Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
    </ListOfMetabolites>
    <ListOfReactions>
      <Reaction key="Reaction_0" name="ERK activation" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_0">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T14:32:33Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:reactionType>STATE_TRANSITION</celldesigner:reactionType>
  <celldesigner:baseReactants>
    <celldesigner:baseReactant species="s3" alias="sa3" />
  </celldesigner:baseReactants>
  <celldesigner:baseProducts>
    <celldesigner:baseProduct species="s3" alias="sa4" />
  </celldesigner:baseProducts>
  <celldesigner:connectScheme connectPolicy="square" rectangleIndex="0">
    <celldesigner:listOfLineDirection>
      <celldesigner:lineDirection index="0" value="vertical" />
      <celldesigner:lineDirection index="1" value="horizontal" />
    </celldesigner:listOfLineDirection>
  </celldesigner:connectScheme>
  <celldesigner:editPoints>0.6540540540540549,0.47567567567567615</celldesigner:editPoints>
  <celldesigner:line width="1.0" color="ff000000" />
  <celldesigner:listOfModification>
    <celldesigner:modification type="CATALYSIS" modifiers="s1" aliases="sa1" targetLineIndex="-1,7" editPoints="0.2406247075669563,0.04903958862721664 0.7850628461286464,-0.12044647771958833 0.8266349001382405,0.013094952493656447">
      <celldesigner:connectScheme connectPolicy="direct">
        <celldesigner:listOfLineDirection>
          <celldesigner:lineDirection index="0" value="horizontal" />
          <celldesigner:lineDirection index="1" value="vertical" />
          <celldesigner:lineDirection index="2" value="horizontal" />
          <celldesigner:lineDirection index="3" value="unknown" />
        </celldesigner:listOfLineDirection>
      </celldesigner:connectScheme>
      <celldesigner:line width="1.0" color="ff33cc00" />
    </celldesigner:modification>
    <celldesigner:modification type="CATALYSIS" modifiers="s2" aliases="sa2" targetLineIndex="-1,6" editPoints="0.5644189127382622,-0.2976161587524684 0.753811013762562,0.06155951299006024">
      <celldesigner:connectScheme connectPolicy="direct">
        <celldesigner:listOfLineDirection>
          <celldesigner:lineDirection index="0" value="horizontal" />
          <celldesigner:lineDirection index="1" value="vertical" />
          <celldesigner:lineDirection index="2" value="horizontal" />
        </celldesigner:listOfLineDirection>
      </celldesigner:connectScheme>
      <celldesigner:line width="1.0" color="ff33cc00" />
    </celldesigner:modification>
  </celldesigner:listOfModification>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_59" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_5" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_1" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_3" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4816" name="Vf" value="0.0487012"/>
          <Constant key="Parameter_4817" name="exp1" value="1.0115"/>
          <Constant key="Parameter_4818" name="K1" value="0.1043"/>
          <Constant key="Parameter_4819" name="K2" value="0.0851"/>
          <Constant key="Parameter_4820" name="Vr" value="0.1607"/>
        </ListOfConstants>
        <KineticLaw function="Function_43">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_285">
              <SourceParameter reference="Parameter_4816"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_262">
              <SourceParameter reference="Metabolite_59"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_267">
              <SourceParameter reference="Metabolite_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_287">
              <SourceParameter reference="Parameter_4817"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_289">
              <SourceParameter reference="Parameter_4818"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_291">
              <SourceParameter reference="Metabolite_3"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_293">
              <SourceParameter reference="Parameter_4819"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_295">
              <SourceParameter reference="Parameter_4820"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_297">
              <SourceParameter reference="Metabolite_5"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1" name="Ca2+ transport" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T14:33:50Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:reactionType>STATE_TRANSITION</celldesigner:reactionType>
  <celldesigner:baseReactants>
    <celldesigner:baseReactant species="s4" alias="sa6" />
  </celldesigner:baseReactants>
  <celldesigner:baseProducts>
    <celldesigner:baseProduct species="s4" alias="sa5" />
  </celldesigner:baseProducts>
  <celldesigner:connectScheme connectPolicy="square" rectangleIndex="1">
    <celldesigner:listOfLineDirection>
      <celldesigner:lineDirection index="0" value="horizontal" />
      <celldesigner:lineDirection index="1" value="vertical" />
      <celldesigner:lineDirection index="2" value="horizontal" />
    </celldesigner:listOfLineDirection>
  </celldesigner:connectScheme>
  <celldesigner:editPoints>0.4987980769230731,-4.440892098500626E-16 0.49879807692307665,-4.440892098500626E-16</celldesigner:editPoints>
  <celldesigner:line width="1.0" color="ff000000" />
  <celldesigner:listOfModification>
    <celldesigner:modification type="CATALYSIS" modifiers="s3" aliases="sa4" targetLineIndex="-1,3" editPoints="0.4922971555755842,-0.17681002385285893">
      <celldesigner:connectScheme connectPolicy="direct">
        <celldesigner:listOfLineDirection>
          <celldesigner:lineDirection index="0" value="horizontal" />
          <celldesigner:lineDirection index="1" value="vertical" />
        </celldesigner:listOfLineDirection>
      </celldesigner:connectScheme>
      <celldesigner:line width="1.0" color="ff33cc00" />
    </celldesigner:modification>
  </celldesigner:listOfModification>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_51" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_53" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_5" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4821" name="K1" value="0.3076"/>
          <Constant key="Parameter_4822" name="K2" value="0.1292"/>
        </ListOfConstants>
        <KineticLaw function="Function_41">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_281">
              <SourceParameter reference="Parameter_4821"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_277">
              <SourceParameter reference="Metabolite_5"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_273">
              <SourceParameter reference="Metabolite_51"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_269">
              <SourceParameter reference="Parameter_4822"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_265">
              <SourceParameter reference="Metabolite_53"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_2" name="cAMP production" reversible="false" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_2">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T14:35:32Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:reactionType>STATE_TRANSITION</celldesigner:reactionType>
  <celldesigner:baseReactants>
    <celldesigner:baseReactant species="s5" alias="sa7" />
  </celldesigner:baseReactants>
  <celldesigner:baseProducts>
    <celldesigner:baseProduct species="s6" alias="sa8" />
  </celldesigner:baseProducts>
  <celldesigner:connectScheme connectPolicy="square" rectangleIndex="1">
    <celldesigner:listOfLineDirection>
      <celldesigner:lineDirection index="0" value="vertical" />
      <celldesigner:lineDirection index="1" value="horizontal" />
      <celldesigner:lineDirection index="2" value="vertical" />
    </celldesigner:listOfLineDirection>
  </celldesigner:connectScheme>
  <celldesigner:editPoints>0.5030196629213477,0.1214185393258429 0.558075842696629,-0.10667134831460601</celldesigner:editPoints>
  <celldesigner:line width="1.0" color="ff000000" />
  <celldesigner:listOfModification>
    <celldesigner:modification type="CATALYSIS" modifiers="s16" aliases="sa21" targetLineIndex="-1,3" editPoints="0.9944977569122555,0.07397275450291207">
      <celldesigner:connectScheme connectPolicy="square">
        <celldesigner:listOfLineDirection>
          <celldesigner:lineDirection index="0" value="horizontal" />
          <celldesigner:lineDirection index="1" value="vertical" />
        </celldesigner:listOfLineDirection>
      </celldesigner:connectScheme>
      <celldesigner:line width="1.0" color="ff33cc00" />
    </celldesigner:modification>
  </celldesigner:listOfModification>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_9" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_11" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_31" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4823" name="Vf" value="0.029"/>
          <Constant key="Parameter_4824" name="exp1" value="1.0895"/>
          <Constant key="Parameter_4825" name="K" value="0.185"/>
        </ListOfConstants>
        <KineticLaw function="Function_42">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_246">
              <SourceParameter reference="Parameter_4823"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_271">
              <SourceParameter reference="Metabolite_9"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_279">
              <SourceParameter reference="Metabolite_31"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_282">
              <SourceParameter reference="Parameter_4824"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_284">
              <SourceParameter reference="Parameter_4825"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_3" name="PKA activation" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_3">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T14:35:40Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:reactionType>STATE_TRANSITION</celldesigner:reactionType>
  <celldesigner:baseReactants>
    <celldesigner:baseReactant species="s7" alias="sa11" />
  </celldesigner:baseReactants>
  <celldesigner:baseProducts>
    <celldesigner:baseProduct species="s7" alias="sa9" />
  </celldesigner:baseProducts>
  <celldesigner:connectScheme connectPolicy="square" rectangleIndex="1">
    <celldesigner:listOfLineDirection>
      <celldesigner:lineDirection index="0" value="horizontal" />
      <celldesigner:lineDirection index="1" value="vertical" />
      <celldesigner:lineDirection index="2" value="horizontal" />
    </celldesigner:listOfLineDirection>
  </celldesigner:connectScheme>
  <celldesigner:editPoints>0.5,4.440892098500626E-16 0.5,4.440892098500626E-16</celldesigner:editPoints>
  <celldesigner:line width="1.0" color="ff000000" />
  <celldesigner:listOfModification>
    <celldesigner:modification type="CATALYSIS" modifiers="s6" aliases="sa8" targetLineIndex="-1,5" editPoints="0.9917677604612809,0.0903574555357487">
      <celldesigner:connectScheme connectPolicy="square">
        <celldesigner:listOfLineDirection>
          <celldesigner:lineDirection index="0" value="vertical" />
          <celldesigner:lineDirection index="1" value="horizontal" />
        </celldesigner:listOfLineDirection>
      </celldesigner:connectScheme>
      <celldesigner:line width="1.0" color="ff33cc00" />
    </celldesigner:modification>
  </celldesigner:listOfModification>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_77" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_13" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_11" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4826" name="Vf" value="0.1199"/>
          <Constant key="Parameter_4827" name="exp1" value="1.301"/>
          <Constant key="Parameter_4828" name="K1" value="0.0515"/>
          <Constant key="Parameter_4829" name="Vr" value="0.18635"/>
          <Constant key="Parameter_4830" name="B" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_50">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_351">
              <SourceParameter reference="Parameter_4826"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_347">
              <SourceParameter reference="Metabolite_77"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_323">
              <SourceParameter reference="Parameter_4830"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_352">
              <SourceParameter reference="Metabolite_11"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_354">
              <SourceParameter reference="Parameter_4827"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_356">
              <SourceParameter reference="Parameter_4828"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_358">
              <SourceParameter reference="Parameter_4829"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_360">
              <SourceParameter reference="Metabolite_13"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_4" name="CREB activation" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_4">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T14:35:49Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:reactionType>STATE_TRANSITION</celldesigner:reactionType>
  <celldesigner:baseReactants>
    <celldesigner:baseReactant species="s8" alias="sa13" />
  </celldesigner:baseReactants>
  <celldesigner:baseProducts>
    <celldesigner:baseProduct species="s8" alias="sa12" />
  </celldesigner:baseProducts>
  <celldesigner:connectScheme connectPolicy="square" rectangleIndex="1">
    <celldesigner:listOfLineDirection>
      <celldesigner:lineDirection index="0" value="horizontal" />
      <celldesigner:lineDirection index="1" value="vertical" />
      <celldesigner:lineDirection index="2" value="horizontal" />
    </celldesigner:listOfLineDirection>
  </celldesigner:connectScheme>
  <celldesigner:editPoints>0.4999999999999991,0.0 0.49999999999999734,0.0</celldesigner:editPoints>
  <celldesigner:line width="1.0" color="ff000000" />
  <celldesigner:listOfModification>
    <celldesigner:modification type="CATALYSIS" modifiers="s7" aliases="sa9" targetLineIndex="-1,3" editPoints="0.4814581801787803,0.09546838691756143 0.7950768918685727,0.3056998392196171">
      <celldesigner:connectScheme connectPolicy="direct">
        <celldesigner:listOfLineDirection>
          <celldesigner:lineDirection index="0" value="horizontal" />
          <celldesigner:lineDirection index="1" value="vertical" />
          <celldesigner:lineDirection index="2" value="horizontal" />
        </celldesigner:listOfLineDirection>
      </celldesigner:connectScheme>
      <celldesigner:line width="1.0" color="ff33cc00" />
    </celldesigner:modification>
    <celldesigner:modification type="CATALYSIS" modifiers="s4" aliases="sa5" targetLineIndex="-1,6" editPoints="0.27202829444309085,-0.1578825663041563 0.46634529912513567,0.17692148839502586">
      <celldesigner:connectScheme connectPolicy="direct">
        <celldesigner:listOfLineDirection>
          <celldesigner:lineDirection index="0" value="vertical" />
          <celldesigner:lineDirection index="1" value="horizontal" />
          <celldesigner:lineDirection index="2" value="unknown" />
        </celldesigner:listOfLineDirection>
      </celldesigner:connectScheme>
      <celldesigner:line width="1.0" color="ff33cc00" />
    </celldesigner:modification>
  </celldesigner:listOfModification>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_55" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_15" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_13" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_53" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4831" name="Vf" value="0.1493"/>
          <Constant key="Parameter_4832" name="exp1" value="1.508"/>
          <Constant key="Parameter_4833" name="K1" value="0.0635"/>
          <Constant key="Parameter_4834" name="K2" value="0.0728"/>
          <Constant key="Parameter_4835" name="Vr" value="0.19685"/>
        </ListOfConstants>
        <KineticLaw function="Function_43">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_285">
              <SourceParameter reference="Parameter_4831"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_262">
              <SourceParameter reference="Metabolite_55"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_267">
              <SourceParameter reference="Metabolite_13"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_287">
              <SourceParameter reference="Parameter_4832"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_289">
              <SourceParameter reference="Parameter_4833"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_291">
              <SourceParameter reference="Metabolite_53"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_293">
              <SourceParameter reference="Parameter_4834"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_295">
              <SourceParameter reference="Parameter_4835"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_297">
              <SourceParameter reference="Metabolite_15"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_5" name="IL10 production" reversible="false" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_5">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T14:35:57Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:reactionType>STATE_TRANSITION</celldesigner:reactionType>
  <celldesigner:baseReactants>
    <celldesigner:baseReactant species="s9" alias="sa23" />
  </celldesigner:baseReactants>
  <celldesigner:baseProducts>
    <celldesigner:baseProduct species="s9" alias="sa14" />
  </celldesigner:baseProducts>
  <celldesigner:connectScheme connectPolicy="square" rectangleIndex="1">
    <celldesigner:listOfLineDirection>
      <celldesigner:lineDirection index="0" value="horizontal" />
      <celldesigner:lineDirection index="1" value="vertical" />
      <celldesigner:lineDirection index="2" value="horizontal" />
    </celldesigner:listOfLineDirection>
  </celldesigner:connectScheme>
  <celldesigner:editPoints>0.5227272727272725,0.0 0.5227272727272725,0.0</celldesigner:editPoints>
  <celldesigner:line width="1.0" color="ff000000" />
  <celldesigner:listOfModification>
    <celldesigner:modification type="CATALYSIS" modifiers="s8" aliases="sa12" targetLineIndex="-1,2" editPoints="0.509112188522582,0.09519141960543998 0.8091151617663335,0.29158622316107774">
      <celldesigner:connectScheme connectPolicy="direct">
        <celldesigner:listOfLineDirection>
          <celldesigner:lineDirection index="0" value="horizontal" />
          <celldesigner:lineDirection index="1" value="vertical" />
          <celldesigner:lineDirection index="2" value="horizontal" />
        </celldesigner:listOfLineDirection>
      </celldesigner:connectScheme>
      <celldesigner:line width="1.0" color="ff33cc00" />
    </celldesigner:modification>
    <celldesigner:modification type="INHIBITION" modifiers="s18" aliases="sa29" targetLineIndex="-1,3" editPoints="0.9600351842299046,0.19587656641507012">
      <celldesigner:connectScheme connectPolicy="square">
        <celldesigner:listOfLineDirection>
          <celldesigner:lineDirection index="0" value="horizontal" />
          <celldesigner:lineDirection index="1" value="vertical" />
        </celldesigner:listOfLineDirection>
      </celldesigner:connectScheme>
      <celldesigner:line width="1.0" color="ffff0033" />
    </celldesigner:modification>
    <celldesigner:modification type="CATALYSIS" modifiers="s23" aliases="sa36" targetLineIndex="-1,6" editPoints="-0.10580940392743587,0.06477181846296687 -0.09077772302838638,0.23981921513093218 0.9779326987339253,0.14804684753673558">
      <celldesigner:connectScheme connectPolicy="direct">
        <celldesigner:listOfLineDirection>
          <celldesigner:lineDirection index="0" value="horizontal" />
          <celldesigner:lineDirection index="1" value="vertical" />
          <celldesigner:lineDirection index="2" value="unknown" />
          <celldesigner:lineDirection index="3" value="unknown" />
        </celldesigner:listOfLineDirection>
      </celldesigner:connectScheme>
      <celldesigner:line width="1.0" color="ff33cc00" />
    </celldesigner:modification>
  </celldesigner:listOfModification>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_65" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_17" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_95" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_15" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_43" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_33" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4836" name="Vf" value="1.66808"/>
          <Constant key="Parameter_4837" name="K1" value="0.0593"/>
          <Constant key="Parameter_4838" name="K2" value="0.09815"/>
          <Constant key="Parameter_4839" name="exp1" value="1.193"/>
          <Constant key="Parameter_4840" name="K" value="0.0536"/>
          <Constant key="Parameter_4841" name="K3" value="0.01589"/>
        </ListOfConstants>
        <KineticLaw function="Function_45">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_311">
              <SourceParameter reference="Parameter_4836"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_307">
              <SourceParameter reference="Metabolite_65"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_303">
              <SourceParameter reference="Parameter_4840"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_299">
              <SourceParameter reference="Parameter_4839"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_288">
              <SourceParameter reference="Metabolite_95"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_296">
              <SourceParameter reference="Metabolite_15"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_313">
              <SourceParameter reference="Parameter_4837"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_315">
              <SourceParameter reference="Metabolite_43"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_317">
              <SourceParameter reference="Parameter_4838"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_319">
              <SourceParameter reference="Metabolite_33"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_321">
              <SourceParameter reference="Parameter_4841"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_6" name="IL10R activation" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_6">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T14:36:04Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:reactionType>STATE_TRANSITION</celldesigner:reactionType>
  <celldesigner:baseReactants>
    <celldesigner:baseReactant species="s9" alias="sa14" />
  </celldesigner:baseReactants>
  <celldesigner:baseProducts>
    <celldesigner:baseProduct species="s10" alias="sa15" />
  </celldesigner:baseProducts>
  <celldesigner:connectScheme connectPolicy="square" rectangleIndex="1">
    <celldesigner:listOfLineDirection>
      <celldesigner:lineDirection index="0" value="horizontal" />
      <celldesigner:lineDirection index="1" value="vertical" />
      <celldesigner:lineDirection index="2" value="horizontal" />
    </celldesigner:listOfLineDirection>
  </celldesigner:connectScheme>
  <celldesigner:editPoints>0.2665651180502675,0.21896420411271933 0.6694592536176682,-0.2715156130997727</celldesigner:editPoints>
  <celldesigner:line width="1.0" color="ff000000" />
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_81" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_19" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_95" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_17" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4842" name="Vf" value="0.169469"/>
          <Constant key="Parameter_4843" name="exp1" value="1.042"/>
          <Constant key="Parameter_4846" name="K1" value="0.463615"/>
          <Constant key="Parameter_4845" name="Vr" value="0.188"/>
          <Constant key="Parameter_4847" name="A1" value="0"/>
          <Constant key="Parameter_4844" name="P" value="0"/>
          <Constant key="Parameter_4848" name="B" value="0"/>
          <Constant key="Parameter_4849" name="K" value="40"/>
        </ListOfConstants>
        <KineticLaw function="Function_53">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_379">
              <SourceParameter reference="Parameter_4842"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_375">
              <SourceParameter reference="Parameter_4849"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_344">
              <SourceParameter reference="Parameter_4843"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_367">
              <SourceParameter reference="Metabolite_95"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_380">
              <SourceParameter reference="Parameter_4848"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_382">
              <SourceParameter reference="Metabolite_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_384">
              <SourceParameter reference="Parameter_4846"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_386">
              <SourceParameter reference="Parameter_4845"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_388">
              <SourceParameter reference="Metabolite_19"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_7" name="NFAT activation" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_7">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T14:36:20Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:reactionType>STATE_TRANSITION</celldesigner:reactionType>
  <celldesigner:baseReactants>
    <celldesigner:baseReactant species="s15" alias="sa24" />
  </celldesigner:baseReactants>
  <celldesigner:baseProducts>
    <celldesigner:baseProduct species="s15" alias="sa20" />
  </celldesigner:baseProducts>
  <celldesigner:connectScheme connectPolicy="square" rectangleIndex="1">
    <celldesigner:listOfLineDirection>
      <celldesigner:lineDirection index="0" value="horizontal" />
      <celldesigner:lineDirection index="1" value="vertical" />
      <celldesigner:lineDirection index="2" value="horizontal" />
    </celldesigner:listOfLineDirection>
  </celldesigner:connectScheme>
  <celldesigner:editPoints>0.4999999999999978,0.0 0.49999999999999956,0.0</celldesigner:editPoints>
  <celldesigner:line width="1.0" color="ff000000" />
  <celldesigner:listOfModification>
    <celldesigner:modification type="CATALYSIS" modifiers="s2" aliases="sa2" targetLineIndex="-1,5" editPoints="0.5549959606712737,-0.3986218457950441 0.8859273043501809,0.06212951778110587">
      <celldesigner:connectScheme connectPolicy="direct">
        <celldesigner:listOfLineDirection>
          <celldesigner:lineDirection index="0" value="horizontal" />
          <celldesigner:lineDirection index="1" value="vertical" />
          <celldesigner:lineDirection index="2" value="horizontal" />
        </celldesigner:listOfLineDirection>
      </celldesigner:connectScheme>
      <celldesigner:line width="1.0" color="ff33cc00" />
    </celldesigner:modification>
    <celldesigner:modification type="INHIBITION" modifiers="s11" aliases="sa16" targetLineIndex="-1,4" editPoints="0.740250868206876,0.14199009327370438 0.7617645187028919,0.02983087081811897">
      <celldesigner:connectScheme connectPolicy="direct">
        <celldesigner:listOfLineDirection>
          <celldesigner:lineDirection index="0" value="vertical" />
          <celldesigner:lineDirection index="1" value="horizontal" />
          <celldesigner:lineDirection index="2" value="vertical" />
        </celldesigner:listOfLineDirection>
      </celldesigner:connectScheme>
      <celldesigner:line width="1.0" color="ffff0033" />
    </celldesigner:modification>
  </celldesigner:listOfModification>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_73" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_29" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_21" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_3" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4850" name="Vf" value="0.11105"/>
          <Constant key="Parameter_4851" name="exp1" value="1.5755"/>
          <Constant key="Parameter_4852" name="K1" value="0.1586"/>
          <Constant key="Parameter_4853" name="Vr" value="0.18755"/>
          <Constant key="Parameter_4854" name="K" value="0.1307"/>
          <Constant key="Parameter_4855" name="B" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_51">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_361">
              <SourceParameter reference="Parameter_4850"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_357">
              <SourceParameter reference="Metabolite_73"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_353">
              <SourceParameter reference="Parameter_4854"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_336">
              <SourceParameter reference="Parameter_4851"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_362">
              <SourceParameter reference="Metabolite_21"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_364">
              <SourceParameter reference="Parameter_4855"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_366">
              <SourceParameter reference="Metabolite_3"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_368">
              <SourceParameter reference="Parameter_4852"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_370">
              <SourceParameter reference="Parameter_4853"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_372">
              <SourceParameter reference="Metabolite_29"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_8" name="CSF1R activation" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_8">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T14:36:28Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:reactionType>STATE_TRANSITION</celldesigner:reactionType>
  <celldesigner:baseReactants>
    <celldesigner:baseReactant species="s12" alias="sa17" />
  </celldesigner:baseReactants>
  <celldesigner:baseProducts>
    <celldesigner:baseProduct species="s13" alias="sa18" />
  </celldesigner:baseProducts>
  <celldesigner:connectScheme connectPolicy="square" rectangleIndex="1">
    <celldesigner:listOfLineDirection>
      <celldesigner:lineDirection index="0" value="vertical" />
      <celldesigner:lineDirection index="1" value="horizontal" />
      <celldesigner:lineDirection index="2" value="vertical" />
    </celldesigner:listOfLineDirection>
  </celldesigner:connectScheme>
  <celldesigner:editPoints>0.5000000000000009,0.0 0.5000000000000009,0.0</celldesigner:editPoints>
  <celldesigner:line width="1.0" color="ff000000" />
  <celldesigner:listOfModification>
    <celldesigner:modification type="CATALYSIS" modifiers="s23" aliases="sa36" targetLineIndex="-1,7" editPoints="0.3868824995115876,-0.09374607857571648 0.6357781840655639,0.20092878695151617">
      <celldesigner:connectScheme connectPolicy="direct">
        <celldesigner:listOfLineDirection>
          <celldesigner:lineDirection index="0" value="horizontal" />
          <celldesigner:lineDirection index="1" value="unknown" />
          <celldesigner:lineDirection index="2" value="vertical" />
        </celldesigner:listOfLineDirection>
      </celldesigner:connectScheme>
      <celldesigner:line width="1.0" color="ff33cc00" />
    </celldesigner:modification>
  </celldesigner:listOfModification>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_83" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_25" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_43" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_23" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4856" name="Vf" value="0.185"/>
          <Constant key="Parameter_4857" name="exp1" value="1.907"/>
          <Constant key="Parameter_4858" name="K1" value="0.36647"/>
          <Constant key="Parameter_4859" name="Vr" value="0.2"/>
          <Constant key="Parameter_4860" name="K2" value="0.0551"/>
        </ListOfConstants>
        <KineticLaw function="Function_43">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_285">
              <SourceParameter reference="Parameter_4856"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_262">
              <SourceParameter reference="Metabolite_83"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_267">
              <SourceParameter reference="Metabolite_43"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_287">
              <SourceParameter reference="Parameter_4857"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_289">
              <SourceParameter reference="Parameter_4858"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_291">
              <SourceParameter reference="Metabolite_23"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_293">
              <SourceParameter reference="Parameter_4860"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_295">
              <SourceParameter reference="Parameter_4859"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_297">
              <SourceParameter reference="Metabolite_25"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_9" name="CX3CR1 activation" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_9">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T14:32:55Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:reactionType>STATE_TRANSITION</celldesigner:reactionType>
  <celldesigner:baseReactants>
    <celldesigner:baseReactant species="s1" alias="sa25" />
  </celldesigner:baseReactants>
  <celldesigner:baseProducts>
    <celldesigner:baseProduct species="s1" alias="sa1" />
  </celldesigner:baseProducts>
  <celldesigner:connectScheme connectPolicy="square" rectangleIndex="1">
    <celldesigner:listOfLineDirection>
      <celldesigner:lineDirection index="0" value="horizontal" />
      <celldesigner:lineDirection index="1" value="vertical" />
      <celldesigner:lineDirection index="2" value="horizontal" />
    </celldesigner:listOfLineDirection>
  </celldesigner:connectScheme>
  <celldesigner:editPoints>0.49999999999999956,0.0 0.49999999999999956,0.0</celldesigner:editPoints>
  <celldesigner:line width="1.0" color="ff000000" />
  <celldesigner:listOfModification>
    <celldesigner:modification type="CATALYSIS" modifiers="s15" aliases="sa20" targetLineIndex="-1,3" editPoints="0.10832782053531975,0.0626294677105641 0.40624096423962497,-0.45265962456555164 1.0152189823841256,-0.10058045473319088">
      <celldesigner:connectScheme connectPolicy="direct">
        <celldesigner:listOfLineDirection>
          <celldesigner:lineDirection index="0" value="horizontal" />
          <celldesigner:lineDirection index="1" value="vertical" />
          <celldesigner:lineDirection index="2" value="unknown" />
          <celldesigner:lineDirection index="3" value="unknown" />
        </celldesigner:listOfLineDirection>
      </celldesigner:connectScheme>
      <celldesigner:line width="1.0" color="ff33cc00" />
    </celldesigner:modification>
  </celldesigner:listOfModification>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_57" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_29" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_91" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4861" name="K1" value="0.19115"/>
          <Constant key="Parameter_4862" name="Vf" value="0.13385"/>
          <Constant key="Parameter_4863" name="exp1" value="1.6325"/>
          <Constant key="Parameter_4864" name="Vr" value="0.1715"/>
          <Constant key="Parameter_4865" name="K2" value="0.05"/>
        </ListOfConstants>
        <KineticLaw function="Function_52">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_373">
              <SourceParameter reference="Parameter_4862"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_369">
              <SourceParameter reference="Metabolite_29"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_365">
              <SourceParameter reference="Parameter_4863"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_349">
              <SourceParameter reference="Parameter_4861"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_355">
              <SourceParameter reference="Metabolite_91"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_374">
              <SourceParameter reference="Parameter_4865"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_376">
              <SourceParameter reference="Parameter_4864"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_378">
              <SourceParameter reference="Metabolite_1"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_10" name="DAP12 activation" reversible="false" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_10">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T14:33:09Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:reactionType>STATE_TRANSITION</celldesigner:reactionType>
  <celldesigner:baseReactants>
    <celldesigner:baseReactant species="s14" alias="sa19" />
  </celldesigner:baseReactants>
  <celldesigner:baseProducts>
    <celldesigner:baseProduct species="s2" alias="sa2" />
  </celldesigner:baseProducts>
  <celldesigner:connectScheme connectPolicy="square" rectangleIndex="0">
    <celldesigner:listOfLineDirection>
      <celldesigner:lineDirection index="0" value="horizontal" />
      <celldesigner:lineDirection index="1" value="vertical" />
    </celldesigner:listOfLineDirection>
  </celldesigner:connectScheme>
  <celldesigner:editPoints>0.8576470588235292,0.34941176470588253</celldesigner:editPoints>
  <celldesigner:line width="1.0" color="ff000000" />
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_27" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_3" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4871" name="k1" value="0.038436"/>
        </ListOfConstants>
        <KineticLaw function="Function_13">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Parameter_4871"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_79">
              <SourceParameter reference="Metabolite_27"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_11" name="Akt activation" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_11">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T14:33:18Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:reactionType>STATE_TRANSITION</celldesigner:reactionType>
  <celldesigner:baseReactants>
    <celldesigner:baseReactant species="s11" alias="sa27" />
  </celldesigner:baseReactants>
  <celldesigner:baseProducts>
    <celldesigner:baseProduct species="s11" alias="sa16" />
  </celldesigner:baseProducts>
  <celldesigner:connectScheme connectPolicy="square" rectangleIndex="1">
    <celldesigner:listOfLineDirection>
      <celldesigner:lineDirection index="0" value="horizontal" />
      <celldesigner:lineDirection index="1" value="vertical" />
      <celldesigner:lineDirection index="2" value="horizontal" />
    </celldesigner:listOfLineDirection>
  </celldesigner:connectScheme>
  <celldesigner:editPoints>0.5326086956521738,0.0 0.5326086956521738,0.0</celldesigner:editPoints>
  <celldesigner:line width="1.0" color="ff000000" />
  <celldesigner:listOfModification>
    <celldesigner:modification type="CATALYSIS" modifiers="s16" aliases="sa21" targetLineIndex="-1,7" editPoints="0.2109979235858468,0.015804434459804506 0.7784111919064767,-0.2693280059232567 0.9087574503673035,-0.009939083262398118">
      <celldesigner:connectScheme connectPolicy="direct">
        <celldesigner:listOfLineDirection>
          <celldesigner:lineDirection index="0" value="horizontal" />
          <celldesigner:lineDirection index="1" value="vertical" />
          <celldesigner:lineDirection index="2" value="horizontal" />
          <celldesigner:lineDirection index="3" value="unknown" />
        </celldesigner:listOfLineDirection>
      </celldesigner:connectScheme>
      <celldesigner:line width="1.0" color="ff33cc00" />
    </celldesigner:modification>
    <celldesigner:modification type="CATALYSIS" modifiers="s1" aliases="sa1" targetLineIndex="-1,4" editPoints="0.31636848951141716,0.034892294150806524 0.5306856731435463,0.1532680324565321">
      <celldesigner:connectScheme connectPolicy="direct">
        <celldesigner:listOfLineDirection>
          <celldesigner:lineDirection index="0" value="vertical" />
          <celldesigner:lineDirection index="1" value="unknown" />
          <celldesigner:lineDirection index="2" value="horizontal" />
        </celldesigner:listOfLineDirection>
      </celldesigner:connectScheme>
      <celldesigner:line width="1.0" color="ff33cc00" />
    </celldesigner:modification>
    <celldesigner:modification type="CATALYSIS" modifiers="s2" aliases="sa2" targetLineIndex="-1,5" editPoints="0.20375781569840812,-0.02859176169965094 0.8221328742566452,0.12345238939147407">
      <celldesigner:connectScheme connectPolicy="direct">
        <celldesigner:listOfLineDirection>
          <celldesigner:lineDirection index="0" value="horizontal" />
          <celldesigner:lineDirection index="1" value="vertical" />
          <celldesigner:lineDirection index="2" value="horizontal" />
        </celldesigner:listOfLineDirection>
      </celldesigner:connectScheme>
      <celldesigner:line width="1.0" color="ff33cc00" />
    </celldesigner:modification>
  </celldesigner:listOfModification>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_49" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_21" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_31" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_1" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_3" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4870" name="Vf" value="0.1115"/>
          <Constant key="Parameter_4869" name="K1" value="0.01779"/>
          <Constant key="Parameter_4866" name="K2" value="0.11105"/>
          <Constant key="Parameter_4867" name="K3" value="0.1328"/>
          <Constant key="Parameter_4868" name="exp1" value="1.136"/>
          <Constant key="Parameter_4872" name="Vr" value="0.1922"/>
        </ListOfConstants>
        <KineticLaw function="Function_40">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_264">
              <SourceParameter reference="Parameter_4870"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_268">
              <SourceParameter reference="Parameter_4869"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_272">
              <SourceParameter reference="Parameter_4866"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_276">
              <SourceParameter reference="Parameter_4867"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_254">
              <SourceParameter reference="Metabolite_49"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_258">
              <SourceParameter reference="Metabolite_31"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_266">
              <SourceParameter reference="Parameter_4868"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_270">
              <SourceParameter reference="Metabolite_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_274">
              <SourceParameter reference="Metabolite_3"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_278">
              <SourceParameter reference="Parameter_4872"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_280">
              <SourceParameter reference="Metabolite_21"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_12" name="LANCL2 activation" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_12">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T14:33:26Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:reactionType>STATE_TRANSITION</celldesigner:reactionType>
  <celldesigner:baseReactants>
    <celldesigner:baseReactant species="s16" alias="sa22" />
  </celldesigner:baseReactants>
  <celldesigner:baseProducts>
    <celldesigner:baseProduct species="s16" alias="sa21" />
  </celldesigner:baseProducts>
  <celldesigner:connectScheme connectPolicy="square" rectangleIndex="1">
    <celldesigner:listOfLineDirection>
      <celldesigner:lineDirection index="0" value="vertical" />
      <celldesigner:lineDirection index="1" value="horizontal" />
      <celldesigner:lineDirection index="2" value="vertical" />
    </celldesigner:listOfLineDirection>
  </celldesigner:connectScheme>
  <celldesigner:editPoints>0.48076923076923084,-8.881784197001252E-16 0.48076923076923084,-8.881784197001252E-16</celldesigner:editPoints>
  <celldesigner:line width="1.0" color="ff000000" />
  <celldesigner:listOfModification>
    <celldesigner:modification type="CATALYSIS" modifiers="s25" aliases="sa42" targetLineIndex="-1,6" editPoints="0.061148998003409005,0.3276275560600519 0.8474551325475321,0.1808699608518678">
      <celldesigner:connectScheme connectPolicy="direct">
        <celldesigner:listOfLineDirection>
          <celldesigner:lineDirection index="0" value="horizontal" />
          <celldesigner:lineDirection index="1" value="vertical" />
          <celldesigner:lineDirection index="2" value="horizontal" />
        </celldesigner:listOfLineDirection>
      </celldesigner:connectScheme>
      <celldesigner:line width="1.0" color="ff33cc00" />
    </celldesigner:modification>
  </celldesigner:listOfModification>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_67" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_31" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_47" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4873" name="Vf" value="0.1328"/>
          <Constant key="Parameter_4876" name="exp1" value="1.643"/>
          <Constant key="Parameter_4875" name="K1" value="0.06395"/>
          <Constant key="Parameter_4874" name="Vr" value="0.1835"/>
          <Constant key="Parameter_4877" name="B" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_50">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_351">
              <SourceParameter reference="Parameter_4873"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_347">
              <SourceParameter reference="Metabolite_67"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_323">
              <SourceParameter reference="Parameter_4877"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_352">
              <SourceParameter reference="Metabolite_47"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_354">
              <SourceParameter reference="Parameter_4876"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_356">
              <SourceParameter reference="Parameter_4875"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_358">
              <SourceParameter reference="Parameter_4874"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_360">
              <SourceParameter reference="Metabolite_31"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_13" name="M-CSF production" reversible="false" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_13">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T14:33:39Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:reactionType>STATE_TRANSITION</celldesigner:reactionType>
  <celldesigner:baseReactants>
    <celldesigner:baseReactant species="s12" alias="sa28" />
  </celldesigner:baseReactants>
  <celldesigner:baseProducts>
    <celldesigner:baseProduct species="s12" alias="sa17" />
  </celldesigner:baseProducts>
  <celldesigner:connectScheme connectPolicy="square" rectangleIndex="1">
    <celldesigner:listOfLineDirection>
      <celldesigner:lineDirection index="0" value="vertical" />
      <celldesigner:lineDirection index="1" value="horizontal" />
      <celldesigner:lineDirection index="2" value="vertical" />
    </celldesigner:listOfLineDirection>
  </celldesigner:connectScheme>
  <celldesigner:editPoints>0.4999274310595072,-0.0060232220609575116 0.5000725689404937,0.0060232220609584</celldesigner:editPoints>
  <celldesigner:line width="1.0" color="ff000000" />
  <celldesigner:listOfModification>
    <celldesigner:modification type="CATALYSIS" modifiers="s15" aliases="sa20" targetLineIndex="-1,6" editPoints="-0.017174310844393137,-0.08712827316095373 0.8035178105426557,-0.24889920111458608 0.8589188132665034,0.032159744565909754">
      <celldesigner:connectScheme connectPolicy="direct">
        <celldesigner:listOfLineDirection>
          <celldesigner:lineDirection index="0" value="horizontal" />
          <celldesigner:lineDirection index="1" value="vertical" />
          <celldesigner:lineDirection index="2" value="unknown" />
          <celldesigner:lineDirection index="3" value="unknown" />
        </celldesigner:listOfLineDirection>
      </celldesigner:connectScheme>
      <celldesigner:line width="1.0" color="ff33cc00" />
    </celldesigner:modification>
  </celldesigner:listOfModification>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_69" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_23" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_29" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4878" name="Vf" value="0.03888"/>
          <Constant key="Parameter_4879" name="exp1" value="1.049"/>
          <Constant key="Parameter_4880" name="K" value="0.13325"/>
          <Constant key="Parameter_4881" name="B" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_49">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_346">
              <SourceParameter reference="Parameter_4878"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_331">
              <SourceParameter reference="Metabolite_69"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_316">
              <SourceParameter reference="Parameter_4881"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_340">
              <SourceParameter reference="Metabolite_29"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_348">
              <SourceParameter reference="Parameter_4879"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_350">
              <SourceParameter reference="Parameter_4880"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_14" name="IFNg production" reversible="false" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_14">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T14:34:23Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:reactionType>STATE_TRANSITION</celldesigner:reactionType>
  <celldesigner:baseReactants>
    <celldesigner:baseReactant species="s18" alias="sa30" />
  </celldesigner:baseReactants>
  <celldesigner:baseProducts>
    <celldesigner:baseProduct species="s18" alias="sa29" />
  </celldesigner:baseProducts>
  <celldesigner:connectScheme connectPolicy="square" rectangleIndex="1">
    <celldesigner:listOfLineDirection>
      <celldesigner:lineDirection index="0" value="vertical" />
      <celldesigner:lineDirection index="1" value="horizontal" />
      <celldesigner:lineDirection index="2" value="vertical" />
    </celldesigner:listOfLineDirection>
  </celldesigner:connectScheme>
  <celldesigner:editPoints>0.5128205128205137,-8.881784197001252E-16 0.5128205128205137,-8.881784197001252E-16</celldesigner:editPoints>
  <celldesigner:line width="1.0" color="ff000000" />
  <celldesigner:listOfModification>
    <celldesigner:modification type="CATALYSIS" modifiers="s15" aliases="sa20" targetLineIndex="-1,4" editPoints="0.16015895807169045,0.3630864191096328 0.897581906957222,0.33466508690010555">
      <celldesigner:connectScheme connectPolicy="direct">
        <celldesigner:listOfLineDirection>
          <celldesigner:lineDirection index="0" value="vertical" />
          <celldesigner:lineDirection index="1" value="horizontal" />
          <celldesigner:lineDirection index="2" value="vertical" />
        </celldesigner:listOfLineDirection>
      </celldesigner:connectScheme>
      <celldesigner:line width="1.0" color="ff33cc00" />
    </celldesigner:modification>
    <celldesigner:modification type="INHIBITION" modifiers="s10" aliases="sa15" targetLineIndex="-1,7" editPoints="0.06931283129061283,-0.31553196778207404 0.8975842467185564,-0.13358578564421775 0.8824220648737344,-0.06456316769188875">
      <celldesigner:connectScheme connectPolicy="direct">
        <celldesigner:listOfLineDirection>
          <celldesigner:lineDirection index="0" value="horizontal" />
          <celldesigner:lineDirection index="1" value="vertical" />
          <celldesigner:lineDirection index="2" value="unknown" />
          <celldesigner:lineDirection index="3" value="unknown" />
        </celldesigner:listOfLineDirection>
      </celldesigner:connectScheme>
      <celldesigner:line width="1.0" color="ffff0033" />
    </celldesigner:modification>
    <celldesigner:modification type="CATALYSIS" modifiers="s24" aliases="sa32" targetLineIndex="-1,6" editPoints="0.8084452678295886,0.20394371229760289">
      <celldesigner:connectScheme connectPolicy="direct">
        <celldesigner:listOfLineDirection>
          <celldesigner:lineDirection index="0" value="horizontal" />
          <celldesigner:lineDirection index="1" value="vertical" />
        </celldesigner:listOfLineDirection>
      </celldesigner:connectScheme>
      <celldesigner:line width="1.0" color="ff33cc00" />
    </celldesigner:modification>
  </celldesigner:listOfModification>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_97" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_95" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_19" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_33" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_45" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_29" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4882" name="Vf" value="0.467575"/>
          <Constant key="Parameter_4883" name="K1" value="0.06755"/>
          <Constant key="Parameter_4884" name="K2" value="0.0785"/>
          <Constant key="Parameter_4885" name="exp1" value="1.151"/>
          <Constant key="Parameter_4886" name="K" value="0.06035"/>
          <Constant key="Parameter_4887" name="K3" value="0.0692"/>
        </ListOfConstants>
        <KineticLaw function="Function_46">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_322">
              <SourceParameter reference="Parameter_4882"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_318">
              <SourceParameter reference="Metabolite_97"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_314">
              <SourceParameter reference="Parameter_4886"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_292">
              <SourceParameter reference="Parameter_4885"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_301">
              <SourceParameter reference="Metabolite_19"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_309">
              <SourceParameter reference="Parameter_4887"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_324">
              <SourceParameter reference="Metabolite_33"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_326">
              <SourceParameter reference="Metabolite_45"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_328">
              <SourceParameter reference="Parameter_4883"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_330">
              <SourceParameter reference="Metabolite_29"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_332">
              <SourceParameter reference="Parameter_4884"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_15" name="Mreg differentiation" reversible="false" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_15">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T14:34:32Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:reactionType>BOOLEAN_LOGIC_GATE</celldesigner:reactionType>
  <celldesigner:baseReactants>
    <celldesigner:baseReactant species="s1" alias="sa1" />
    <celldesigner:baseReactant species="s10" alias="sa15" />
    <celldesigner:baseReactant species="s13" alias="sa18" />
  </celldesigner:baseReactants>
  <celldesigner:baseProducts>
    <celldesigner:baseProduct species="s17" alias="sa26" />
  </celldesigner:baseProducts>
  <celldesigner:connectScheme connectPolicy="square" />
  <celldesigner:editPoints>0.3749999999999982,0.0 0.3749999999999982,0.0 576.0,628.0</celldesigner:editPoints>
  <celldesigner:line width="1.0" color="ff000000" />
  <celldesigner:listOfGateMember>
    <celldesigner:GateMember type="BOOLEAN_LOGIC_GATE_AND" aliases="sa1,sa15,sa18" modificationType="TRIGGER" editPoints="0.3749999999999982,0.0 0.3749999999999982,0.0 576.0,628.0">
      <celldesigner:connectScheme connectPolicy="square">
        <celldesigner:listOfLineDirection>
          <celldesigner:lineDirection index="0" value="vertical" />
          <celldesigner:lineDirection index="1" value="horizontal" />
          <celldesigner:lineDirection index="2" value="vertical" />
        </celldesigner:listOfLineDirection>
      </celldesigner:connectScheme>
      <celldesigner:line width="1.0" color="ff000000" />
    </celldesigner:GateMember>
    <celldesigner:GateMember type="TRIGGER" aliases="sa1" targetLineIndex="-1,0" editPoints="0.050826580226904394,-0.21964343598055114">
      <celldesigner:connectScheme connectPolicy="square">
        <celldesigner:listOfLineDirection>
          <celldesigner:lineDirection index="0" value="horizontal" />
          <celldesigner:lineDirection index="1" value="vertical" />
        </celldesigner:listOfLineDirection>
      </celldesigner:connectScheme>
      <celldesigner:line width="1.0" color="ff000000" />
    </celldesigner:GateMember>
    <celldesigner:GateMember type="TRIGGER" aliases="sa15" targetLineIndex="-1,0" editPoints="-0.0897379912663765,-0.10196506550218443 0.07991266375545836,-0.4493449781659389">
      <celldesigner:connectScheme connectPolicy="direct">
        <celldesigner:listOfLineDirection>
          <celldesigner:lineDirection index="0" value="horizontal" />
          <celldesigner:lineDirection index="1" value="vertical" />
          <celldesigner:lineDirection index="2" value="unknown" />
        </celldesigner:listOfLineDirection>
      </celldesigner:connectScheme>
      <celldesigner:line width="1.0" color="ff000000" />
    </celldesigner:GateMember>
    <celldesigner:GateMember type="CATALYSIS" aliases="sa18" targetLineIndex="-1,0" editPoints="0.1343402225755166,0.3410174880763117">
      <celldesigner:connectScheme connectPolicy="direct">
        <celldesigner:listOfLineDirection>
          <celldesigner:lineDirection index="0" value="horizontal" />
          <celldesigner:lineDirection index="1" value="vertical" />
        </celldesigner:listOfLineDirection>
      </celldesigner:connectScheme>
      <celldesigner:line width="1.0" color="ff000000" />
    </celldesigner:GateMember>
  </celldesigner:listOfGateMember>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_85" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_33" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_1" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_19" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_25" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4888" name="K" value="1.49275"/>
          <Constant key="Parameter_4889" name="K1" value="0.08075"/>
          <Constant key="Parameter_4890" name="K2" value="0.1589"/>
          <Constant key="Parameter_4891" name="exp1" value="1.001"/>
          <Constant key="Parameter_4892" name="exp2" value="2.428"/>
          <Constant key="Parameter_4915" name="exp3" value="1.001"/>
        </ListOfConstants>
        <KineticLaw function="Function_47">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_333">
              <SourceParameter reference="Parameter_4888"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_329">
              <SourceParameter reference="Metabolite_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_325">
              <SourceParameter reference="Parameter_4891"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_305">
              <SourceParameter reference="Metabolite_19"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_312">
              <SourceParameter reference="Parameter_4892"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_320">
              <SourceParameter reference="Metabolite_25"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_335">
              <SourceParameter reference="Parameter_4915"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_337">
              <SourceParameter reference="Parameter_4889"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_339">
              <SourceParameter reference="Parameter_4890"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_341">
              <SourceParameter reference="Metabolite_33"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_16" name="Fbxo7 activation" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_16">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T14:34:47Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:reactionType>STATE_TRANSITION</celldesigner:reactionType>
  <celldesigner:baseReactants>
    <celldesigner:baseReactant species="s21" alias="sa41" />
  </celldesigner:baseReactants>
  <celldesigner:baseProducts>
    <celldesigner:baseProduct species="s21" alias="sa34" />
  </celldesigner:baseProducts>
  <celldesigner:connectScheme connectPolicy="square" rectangleIndex="1">
    <celldesigner:listOfLineDirection>
      <celldesigner:lineDirection index="0" value="vertical" />
      <celldesigner:lineDirection index="1" value="horizontal" />
      <celldesigner:lineDirection index="2" value="vertical" />
    </celldesigner:listOfLineDirection>
  </celldesigner:connectScheme>
  <celldesigner:editPoints>0.5,0.0 0.5,0.0</celldesigner:editPoints>
  <celldesigner:line width="1.0" color="ff000000" />
  <celldesigner:listOfModification>
    <celldesigner:modification type="CATALYSIS" modifiers="s16" aliases="sa21" targetLineIndex="-1,5" editPoints="0.5878596978218129,0.002435169257483105 0.587876857276348,-0.0017071923984022241">
      <celldesigner:connectScheme connectPolicy="square">
        <celldesigner:listOfLineDirection>
          <celldesigner:lineDirection index="0" value="horizontal" />
          <celldesigner:lineDirection index="1" value="vertical" />
          <celldesigner:lineDirection index="2" value="horizontal" />
        </celldesigner:listOfLineDirection>
      </celldesigner:connectScheme>
      <celldesigner:line width="1.0" color="ff33cc00" />
    </celldesigner:modification>
  </celldesigner:listOfModification>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_61" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_39" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_31" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4916" name="Vf" value="0.1235"/>
          <Constant key="Parameter_4917" name="exp1" value="1.349"/>
          <Constant key="Parameter_4918" name="K1" value="0.1536"/>
          <Constant key="Parameter_4919" name="Vr" value="0.19115"/>
          <Constant key="Parameter_4920" name="B" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_50">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_351">
              <SourceParameter reference="Parameter_4916"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_347">
              <SourceParameter reference="Metabolite_61"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_323">
              <SourceParameter reference="Parameter_4920"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_352">
              <SourceParameter reference="Metabolite_31"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_354">
              <SourceParameter reference="Parameter_4917"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_356">
              <SourceParameter reference="Parameter_4918"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_358">
              <SourceParameter reference="Parameter_4919"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_360">
              <SourceParameter reference="Metabolite_39"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_17" name="Traf2 activation" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_17">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T14:34:58Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:reactionType>STATE_TRANSITION</celldesigner:reactionType>
  <celldesigner:baseReactants>
    <celldesigner:baseReactant species="s20" alias="sa37" />
  </celldesigner:baseReactants>
  <celldesigner:baseProducts>
    <celldesigner:baseProduct species="s20" alias="sa33" />
  </celldesigner:baseProducts>
  <celldesigner:connectScheme connectPolicy="square" rectangleIndex="1">
    <celldesigner:listOfLineDirection>
      <celldesigner:lineDirection index="0" value="vertical" />
      <celldesigner:lineDirection index="1" value="horizontal" />
      <celldesigner:lineDirection index="2" value="vertical" />
    </celldesigner:listOfLineDirection>
  </celldesigner:connectScheme>
  <celldesigner:editPoints>0.5,0.0 0.5,0.0</celldesigner:editPoints>
  <celldesigner:line width="1.0" color="ff000000" />
  <celldesigner:listOfModification>
    <celldesigner:modification type="CATALYSIS" modifiers="s19" aliases="sa31" targetLineIndex="-1,4" editPoints="0.013994836738601801,0.3659049230318314 0.8677729904795419,0.3332503039750935">
      <celldesigner:connectScheme connectPolicy="direct">
        <celldesigner:listOfLineDirection>
          <celldesigner:lineDirection index="0" value="vertical" />
          <celldesigner:lineDirection index="1" value="horizontal" />
          <celldesigner:lineDirection index="2" value="vertical" />
        </celldesigner:listOfLineDirection>
      </celldesigner:connectScheme>
      <celldesigner:line width="1.0" color="ff33cc00" />
    </celldesigner:modification>
  </celldesigner:listOfModification>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_79" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_37" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_39" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_95" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_35" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4921" name="Vf" value="0.984949"/>
          <Constant key="Parameter_4922" name="exp1" value="1.493"/>
          <Constant key="Parameter_4923" name="K1" value="0.06815"/>
          <Constant key="Parameter_4924" name="Vr" value="0.262"/>
          <Constant key="Parameter_4925" name="K2" value="0.01646"/>
          <Constant key="Parameter_4926" name="K" value="0.09545"/>
        </ListOfConstants>
        <KineticLaw function="Function_44">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_298">
              <SourceParameter reference="Parameter_4921"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_294">
              <SourceParameter reference="Metabolite_79"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_290">
              <SourceParameter reference="Parameter_4926"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_286">
              <SourceParameter reference="Parameter_4922"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_283">
              <SourceParameter reference="Metabolite_39"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_300">
              <SourceParameter reference="Metabolite_95"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_302">
              <SourceParameter reference="Parameter_4923"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_304">
              <SourceParameter reference="Metabolite_35"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_306">
              <SourceParameter reference="Parameter_4925"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_308">
              <SourceParameter reference="Parameter_4924"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_310">
              <SourceParameter reference="Metabolite_37"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_18" name="NCOR2 activation" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_18">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T14:35:06Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:reactionType>STATE_TRANSITION</celldesigner:reactionType>
  <celldesigner:baseReactants>
    <celldesigner:baseReactant species="s22" alias="sa40" />
  </celldesigner:baseReactants>
  <celldesigner:baseProducts>
    <celldesigner:baseProduct species="s22" alias="sa35" />
  </celldesigner:baseProducts>
  <celldesigner:connectScheme connectPolicy="square" rectangleIndex="1">
    <celldesigner:listOfLineDirection>
      <celldesigner:lineDirection index="0" value="horizontal" />
      <celldesigner:lineDirection index="1" value="vertical" />
      <celldesigner:lineDirection index="2" value="horizontal" />
    </celldesigner:listOfLineDirection>
  </celldesigner:connectScheme>
  <celldesigner:editPoints>0.45161290322580605,-4.440892098500626E-16 0.45161290322580605,-4.440892098500626E-16</celldesigner:editPoints>
  <celldesigner:line width="1.0" color="ff000000" />
  <celldesigner:listOfModification>
    <celldesigner:modification type="CATALYSIS" modifiers="s16" aliases="sa21" targetLineIndex="-1,2" editPoints="0.7213652293307,0.5135414749458063 1.0089484553003516,0.109576946520614">
      <celldesigner:connectScheme connectPolicy="direct">
        <celldesigner:listOfLineDirection>
          <celldesigner:lineDirection index="0" value="horizontal" />
          <celldesigner:lineDirection index="1" value="vertical" />
          <celldesigner:lineDirection index="2" value="unknown" />
        </celldesigner:listOfLineDirection>
      </celldesigner:connectScheme>
      <celldesigner:line width="1.0" color="ff33cc00" />
    </celldesigner:modification>
  </celldesigner:listOfModification>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_71" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_41" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_31" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4927" name="Vf" value="0.124465"/>
          <Constant key="Parameter_4928" name="exp1" value="1.8185"/>
          <Constant key="Parameter_4929" name="K1" value="0.05315"/>
          <Constant key="Parameter_4804" name="Vr" value="0.59075"/>
          <Constant key="Parameter_4805" name="B" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_50">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_351">
              <SourceParameter reference="Parameter_4927"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_347">
              <SourceParameter reference="Metabolite_71"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_323">
              <SourceParameter reference="Parameter_4805"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_352">
              <SourceParameter reference="Metabolite_31"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_354">
              <SourceParameter reference="Parameter_4928"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_356">
              <SourceParameter reference="Parameter_4929"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_358">
              <SourceParameter reference="Parameter_4804"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_360">
              <SourceParameter reference="Metabolite_41"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_19" name="FOXP1 activation" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_19">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T14:35:16Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:reactionType>STATE_TRANSITION</celldesigner:reactionType>
  <celldesigner:baseReactants>
    <celldesigner:baseReactant species="s23" alias="sa39" />
  </celldesigner:baseReactants>
  <celldesigner:baseProducts>
    <celldesigner:baseProduct species="s23" alias="sa36" />
  </celldesigner:baseProducts>
  <celldesigner:connectScheme connectPolicy="square" rectangleIndex="1">
    <celldesigner:listOfLineDirection>
      <celldesigner:lineDirection index="0" value="horizontal" />
      <celldesigner:lineDirection index="1" value="vertical" />
      <celldesigner:lineDirection index="2" value="horizontal" />
    </celldesigner:listOfLineDirection>
  </celldesigner:connectScheme>
  <celldesigner:editPoints>0.4516129032258065,0.0 0.4516129032258065,0.0</celldesigner:editPoints>
  <celldesigner:line width="1.0" color="ff000000" />
  <celldesigner:listOfModification>
    <celldesigner:modification type="CATALYSIS" modifiers="s22" aliases="sa35" targetLineIndex="-1,2" editPoints="0.7140189160672046,0.17056694403568073">
      <celldesigner:connectScheme connectPolicy="direct">
        <celldesigner:listOfLineDirection>
          <celldesigner:lineDirection index="0" value="horizontal" />
          <celldesigner:lineDirection index="1" value="vertical" />
        </celldesigner:listOfLineDirection>
      </celldesigner:connectScheme>
      <celldesigner:line width="1.0" color="ff33cc00" />
    </celldesigner:modification>
  </celldesigner:listOfModification>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_63" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_43" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_41" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4806" name="Vf" value="0.10955"/>
          <Constant key="Parameter_4807" name="exp1" value="1.193"/>
          <Constant key="Parameter_4808" name="K1" value="0.0836"/>
          <Constant key="Parameter_4809" name="Vr" value="0.31685"/>
        </ListOfConstants>
        <KineticLaw function="Function_48">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_342">
              <SourceParameter reference="Parameter_4806"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_338">
              <SourceParameter reference="Metabolite_63"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_334">
              <SourceParameter reference="Metabolite_41"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_275">
              <SourceParameter reference="Parameter_4807"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_327">
              <SourceParameter reference="Parameter_4808"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_343">
              <SourceParameter reference="Parameter_4809"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_345">
              <SourceParameter reference="Metabolite_43"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_20" name="NFkB activation" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_20">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T14:35:25Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfUnsupportedAnnotations>
          <UnsupportedAnnotation name="http://www.sbml.org/2001/ns/celldesigner">
<celldesigner:extension xmlns:celldesigner="http://www.sbml.org/2001/ns/celldesigner">
  <celldesigner:reactionType>STATE_TRANSITION</celldesigner:reactionType>
  <celldesigner:baseReactants>
    <celldesigner:baseReactant species="s24" alias="sa38" />
  </celldesigner:baseReactants>
  <celldesigner:baseProducts>
    <celldesigner:baseProduct species="s24" alias="sa32" />
  </celldesigner:baseProducts>
  <celldesigner:connectScheme connectPolicy="square" rectangleIndex="1">
    <celldesigner:listOfLineDirection>
      <celldesigner:lineDirection index="0" value="horizontal" />
      <celldesigner:lineDirection index="1" value="vertical" />
      <celldesigner:lineDirection index="2" value="horizontal" />
    </celldesigner:listOfLineDirection>
  </celldesigner:connectScheme>
  <celldesigner:editPoints>0.46875,0.0 0.46875,0.0</celldesigner:editPoints>
  <celldesigner:line width="1.0" color="ff000000" />
  <celldesigner:listOfModification>
    <celldesigner:modification type="CATALYSIS" modifiers="s20" aliases="sa33" targetLineIndex="-1,3" editPoints="0.06144361778014895,0.3017753548226918 0.9667696822482243,0.11744450148224495">
      <celldesigner:connectScheme connectPolicy="direct">
        <celldesigner:listOfLineDirection>
          <celldesigner:lineDirection index="0" value="horizontal" />
          <celldesigner:lineDirection index="1" value="unknown" />
          <celldesigner:lineDirection index="2" value="vertical" />
        </celldesigner:listOfLineDirection>
      </celldesigner:connectScheme>
      <celldesigner:line width="1.0" color="ff33cc00" />
    </celldesigner:modification>
    <celldesigner:modification type="INHIBITION" modifiers="s21" aliases="sa34" targetLineIndex="-1,2" editPoints="0.13870040494727487,0.049593976851363686 0.039512451244547275,0.3269947867459134 0.6933857888531287,0.5607949633309138 0.9059314039304018,-0.033635343585978306">
      <celldesigner:connectScheme connectPolicy="direct">
        <celldesigner:listOfLineDirection>
          <celldesigner:lineDirection index="0" value="horizontal" />
          <celldesigner:lineDirection index="1" value="vertical" />
          <celldesigner:lineDirection index="2" value="unknown" />
          <celldesigner:lineDirection index="3" value="unknown" />
          <celldesigner:lineDirection index="4" value="unknown" />
        </celldesigner:listOfLineDirection>
      </celldesigner:connectScheme>
      <celldesigner:line width="1.0" color="ffff0033" />
    </celldesigner:modification>
  </celldesigner:listOfModification>
</celldesigner:extension>
          </UnsupportedAnnotation>
        </ListOfUnsupportedAnnotations>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_75" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_45" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_41" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_37" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4810" name="Vf" value="0.139789"/>
          <Constant key="Parameter_4811" name="K" value="0.316437"/>
          <Constant key="Parameter_4812" name="K1" value="0.015346"/>
          <Constant key="Parameter_4813" name="Vr" value="0.481511"/>
          <Constant key="Parameter_4814" name="exp1" value="1.73699"/>
          <Constant key="Parameter_4930" name="B" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_51">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_361">
              <SourceParameter reference="Parameter_4810"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_357">
              <SourceParameter reference="Metabolite_75"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_353">
              <SourceParameter reference="Parameter_4811"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_336">
              <SourceParameter reference="Parameter_4814"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_362">
              <SourceParameter reference="Metabolite_41"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_364">
              <SourceParameter reference="Parameter_4930"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_366">
              <SourceParameter reference="Metabolite_37"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_368">
              <SourceParameter reference="Parameter_4812"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_370">
              <SourceParameter reference="Parameter_4813"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_372">
              <SourceParameter reference="Metabolite_45"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_21" name="cAMP degradation" reversible="false" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_21">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T14:38:12Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_11" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_4931" name="k1" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_13">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Parameter_4931"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_79">
              <SourceParameter reference="Metabolite_11"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_22" name="DAP12 degradation" reversible="false" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_22">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T14:39:58Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_3" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_4697" name="k1" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_13">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Parameter_4697"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_79">
              <SourceParameter reference="Metabolite_3"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_23" name="IL10 degradation" reversible="false" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_23">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T15:52:39Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_17" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_4696" name="k1" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_13">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Parameter_4696"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_79">
              <SourceParameter reference="Metabolite_17"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_24" name="IFNg degradation" reversible="false" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_24">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T15:52:59Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_95" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_4695" name="k1" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_13">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Parameter_4695"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_79">
              <SourceParameter reference="Metabolite_95"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_25" name="M-CSF degradation" reversible="false" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_25">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-16T15:53:17Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_23" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_4694" name="k1" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_13">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Parameter_4694"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_79">
              <SourceParameter reference="Metabolite_23"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_26" name="KLF4 activation" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_26">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-17T17:36:23Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_89" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_87" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_13" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4693" name="Vf" value="0.1"/>
          <Constant key="Parameter_4692" name="B" value="0.1"/>
          <Constant key="Parameter_4691" name="exp1" value="1.1"/>
          <Constant key="Parameter_4690" name="K1" value="0.0743"/>
          <Constant key="Parameter_4689" name="Vr" value="0.114"/>
        </ListOfConstants>
        <KineticLaw function="Function_50">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_351">
              <SourceParameter reference="Parameter_4693"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_347">
              <SourceParameter reference="Metabolite_89"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_323">
              <SourceParameter reference="Parameter_4692"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_352">
              <SourceParameter reference="Metabolite_13"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_354">
              <SourceParameter reference="Parameter_4691"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_356">
              <SourceParameter reference="Parameter_4690"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_358">
              <SourceParameter reference="Parameter_4689"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_360">
              <SourceParameter reference="Metabolite_87"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_27" name="CX3CL1 activation" reversible="false" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_27">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-17T17:37:20Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_93" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_91" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_87" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4688" name="Vf" value="0.126"/>
          <Constant key="Parameter_4687" name="B" value="0.1"/>
          <Constant key="Parameter_4686" name="exp1" value="1"/>
          <Constant key="Parameter_4685" name="K" value="0.0678"/>
        </ListOfConstants>
        <KineticLaw function="Function_49">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_346">
              <SourceParameter reference="Parameter_4688"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_331">
              <SourceParameter reference="Metabolite_93"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_316">
              <SourceParameter reference="Parameter_4687"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_340">
              <SourceParameter reference="Metabolite_87"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_348">
              <SourceParameter reference="Parameter_4686"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_350">
              <SourceParameter reference="Parameter_4685"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_28" name="CX3CL1 degradation" reversible="false" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_28">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2016-02-17T17:38:11Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_91" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_4684" name="k1" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_13">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Parameter_4684"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_79">
              <SourceParameter reference="Metabolite_91"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
    </ListOfReactions>
    <ListOfModelParameterSets activeSet="ModelParameterSet_0">
      <ModelParameterSet key="ModelParameterSet_0" name="Initial State">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=NoName" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[CX3CR1]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[DAP12]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[ERK]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[Ca2+]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[AC]" value="6.02214179e+23" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[cAMP]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[PKA]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[CREB]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[IL10]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[IL10R]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[Akt]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[M-CSF]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[CSF1R]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[SIRPb1]" value="6.02214179e+23" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[NFAT]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[LANCL2]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[Mreg]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[HP]" value="1.5055354475e+25" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[Traf2]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[Fbxo7]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[NCOR2]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[FOXP1]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[NFkB]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[ABA]" value="6.02214179e+23" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[pAkt]" value="6.02214179e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[eCa2+]" value="6.02214179e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[iCa2+]" value="3.011070895e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[pCREB]" value="6.02214179e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[pCX3CR1]" value="6.02214179e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[pERK]" value="6.02214179e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[pFbxo7]" value="6.02214179e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[pFOXP1]" value="6.02214179e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[pIL10]" value="6.02214179e+23" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[pLANCL2]" value="6.02214179e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[pM-CSF]" value="6.02214179e+23" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[pNCOR2]" value="6.02214179e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[pNFAT]" value="6.02214179e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[pNFkB]" value="6.02214179e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[pPKA]" value="6.02214179e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[pTraf2]" value="6.02214179e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[pIL10R]" value="6.02214179e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[pCSF1R]" value="6.02214179e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[Mono]" value="6.02214179e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[KLF4]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[pKLF4]" value="6.02214179e+23" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[CX3CL1]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[pCX3CL1]" value="6.02214179e+23" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[IFNg]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[pIFNg]" value="6.02214179e+23" type="Species" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=NoName,Vector=Reactions[ERK activation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[ERK activation],ParameterGroup=Parameters,Parameter=Vf" value="0.0487012" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[ERK activation],ParameterGroup=Parameters,Parameter=exp1" value="1.0115" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[ERK activation],ParameterGroup=Parameters,Parameter=K1" value="0.1043" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[ERK activation],ParameterGroup=Parameters,Parameter=K2" value="0.08510000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[ERK activation],ParameterGroup=Parameters,Parameter=Vr" value="0.1607" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=NoName,Vector=Reactions[Ca2+ transport]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[Ca2+ transport],ParameterGroup=Parameters,Parameter=K1" value="0.3076" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[Ca2+ transport],ParameterGroup=Parameters,Parameter=K2" value="0.1292" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=NoName,Vector=Reactions[cAMP production]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[cAMP production],ParameterGroup=Parameters,Parameter=Vf" value="0.029" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[cAMP production],ParameterGroup=Parameters,Parameter=exp1" value="1.0895" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[cAMP production],ParameterGroup=Parameters,Parameter=K" value="0.185" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=NoName,Vector=Reactions[PKA activation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[PKA activation],ParameterGroup=Parameters,Parameter=Vf" value="0.1199" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[PKA activation],ParameterGroup=Parameters,Parameter=exp1" value="1.301" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[PKA activation],ParameterGroup=Parameters,Parameter=K1" value="0.0515" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[PKA activation],ParameterGroup=Parameters,Parameter=Vr" value="0.18635" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[PKA activation],ParameterGroup=Parameters,Parameter=B" value="0.1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=NoName,Vector=Reactions[CREB activation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[CREB activation],ParameterGroup=Parameters,Parameter=Vf" value="0.1493" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[CREB activation],ParameterGroup=Parameters,Parameter=exp1" value="1.508" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[CREB activation],ParameterGroup=Parameters,Parameter=K1" value="0.0635" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[CREB activation],ParameterGroup=Parameters,Parameter=K2" value="0.0728" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[CREB activation],ParameterGroup=Parameters,Parameter=Vr" value="0.19685" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=NoName,Vector=Reactions[IL10 production]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[IL10 production],ParameterGroup=Parameters,Parameter=Vf" value="1.6680788" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[IL10 production],ParameterGroup=Parameters,Parameter=K1" value="0.05930000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[IL10 production],ParameterGroup=Parameters,Parameter=K2" value="0.09815000000000002" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[IL10 production],ParameterGroup=Parameters,Parameter=exp1" value="1.193" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[IL10 production],ParameterGroup=Parameters,Parameter=K" value="0.0536" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[IL10 production],ParameterGroup=Parameters,Parameter=K3" value="0.01589" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=NoName,Vector=Reactions[IL10R activation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[IL10R activation],ParameterGroup=Parameters,Parameter=Vf" value="0.169468775" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[IL10R activation],ParameterGroup=Parameters,Parameter=exp1" value="1.042" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[IL10R activation],ParameterGroup=Parameters,Parameter=K1" value="0.463615" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[IL10R activation],ParameterGroup=Parameters,Parameter=Vr" value="0.188" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[IL10R activation],ParameterGroup=Parameters,Parameter=A1" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[IL10],Reference=InitialParticleNumber&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[IL10R activation],ParameterGroup=Parameters,Parameter=P" value="0" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[IL10R],Reference=InitialParticleNumber&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[IL10R activation],ParameterGroup=Parameters,Parameter=B" value="0" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[IL10R activation],ParameterGroup=Parameters,Parameter=K" value="40" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=NoName,Vector=Reactions[NFAT activation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[NFAT activation],ParameterGroup=Parameters,Parameter=Vf" value="0.11105" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[NFAT activation],ParameterGroup=Parameters,Parameter=exp1" value="1.5755" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[NFAT activation],ParameterGroup=Parameters,Parameter=K1" value="0.1586" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[NFAT activation],ParameterGroup=Parameters,Parameter=Vr" value="0.18755" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[NFAT activation],ParameterGroup=Parameters,Parameter=K" value="0.1307" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[NFAT activation],ParameterGroup=Parameters,Parameter=B" value="0.1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=NoName,Vector=Reactions[CSF1R activation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[CSF1R activation],ParameterGroup=Parameters,Parameter=Vf" value="0.185" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[CSF1R activation],ParameterGroup=Parameters,Parameter=exp1" value="1.907" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[CSF1R activation],ParameterGroup=Parameters,Parameter=K1" value="0.36647" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[CSF1R activation],ParameterGroup=Parameters,Parameter=Vr" value="0.2" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[CSF1R activation],ParameterGroup=Parameters,Parameter=K2" value="0.0551" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=NoName,Vector=Reactions[CX3CR1 activation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[CX3CR1 activation],ParameterGroup=Parameters,Parameter=K1" value="0.19115" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[CX3CR1 activation],ParameterGroup=Parameters,Parameter=Vf" value="0.13385" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[CX3CR1 activation],ParameterGroup=Parameters,Parameter=exp1" value="1.6325" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[CX3CR1 activation],ParameterGroup=Parameters,Parameter=Vr" value="0.1715" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[CX3CR1 activation],ParameterGroup=Parameters,Parameter=K2" value="0.05" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=NoName,Vector=Reactions[DAP12 activation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[DAP12 activation],ParameterGroup=Parameters,Parameter=k1" value="0.03843595" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=NoName,Vector=Reactions[Akt activation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[Akt activation],ParameterGroup=Parameters,Parameter=Vf" value="0.1115" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[Akt activation],ParameterGroup=Parameters,Parameter=K1" value="0.01779" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[Akt activation],ParameterGroup=Parameters,Parameter=K2" value="0.11105" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[Akt activation],ParameterGroup=Parameters,Parameter=K3" value="0.1328" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[Akt activation],ParameterGroup=Parameters,Parameter=exp1" value="1.136" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[Akt activation],ParameterGroup=Parameters,Parameter=Vr" value="0.1922" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=NoName,Vector=Reactions[LANCL2 activation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[LANCL2 activation],ParameterGroup=Parameters,Parameter=Vf" value="0.1328" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[LANCL2 activation],ParameterGroup=Parameters,Parameter=exp1" value="1.643" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[LANCL2 activation],ParameterGroup=Parameters,Parameter=K1" value="0.06395000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[LANCL2 activation],ParameterGroup=Parameters,Parameter=Vr" value="0.1835" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[LANCL2 activation],ParameterGroup=Parameters,Parameter=B" value="0.1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=NoName,Vector=Reactions[M-CSF production]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[M-CSF production],ParameterGroup=Parameters,Parameter=Vf" value="0.03888000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[M-CSF production],ParameterGroup=Parameters,Parameter=exp1" value="1.049" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[M-CSF production],ParameterGroup=Parameters,Parameter=K" value="0.13325" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[M-CSF production],ParameterGroup=Parameters,Parameter=B" value="0.1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=NoName,Vector=Reactions[IFNg production]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[IFNg production],ParameterGroup=Parameters,Parameter=Vf" value="0.4675751" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[IFNg production],ParameterGroup=Parameters,Parameter=K1" value="0.06755" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[IFNg production],ParameterGroup=Parameters,Parameter=K2" value="0.0785" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[IFNg production],ParameterGroup=Parameters,Parameter=exp1" value="1.151" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[IFNg production],ParameterGroup=Parameters,Parameter=K" value="0.06035" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[IFNg production],ParameterGroup=Parameters,Parameter=K3" value="0.06920000000000001" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=NoName,Vector=Reactions[Mreg differentiation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[Mreg differentiation],ParameterGroup=Parameters,Parameter=K" value="1.49275" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[Mreg differentiation],ParameterGroup=Parameters,Parameter=K1" value="0.08075" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[Mreg differentiation],ParameterGroup=Parameters,Parameter=K2" value="0.1589" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[Mreg differentiation],ParameterGroup=Parameters,Parameter=exp1" value="1.001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[Mreg differentiation],ParameterGroup=Parameters,Parameter=exp2" value="2.428" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[Mreg differentiation],ParameterGroup=Parameters,Parameter=exp3" value="1.001" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=NoName,Vector=Reactions[Fbxo7 activation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[Fbxo7 activation],ParameterGroup=Parameters,Parameter=Vf" value="0.1235" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[Fbxo7 activation],ParameterGroup=Parameters,Parameter=exp1" value="1.349" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[Fbxo7 activation],ParameterGroup=Parameters,Parameter=K1" value="0.1536" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[Fbxo7 activation],ParameterGroup=Parameters,Parameter=Vr" value="0.19115" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[Fbxo7 activation],ParameterGroup=Parameters,Parameter=B" value="0.1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=NoName,Vector=Reactions[Traf2 activation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[Traf2 activation],ParameterGroup=Parameters,Parameter=Vf" value="0.9849486249999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[Traf2 activation],ParameterGroup=Parameters,Parameter=exp1" value="1.493" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[Traf2 activation],ParameterGroup=Parameters,Parameter=K1" value="0.06815" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[Traf2 activation],ParameterGroup=Parameters,Parameter=Vr" value="0.262" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[Traf2 activation],ParameterGroup=Parameters,Parameter=K2" value="0.01646" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[Traf2 activation],ParameterGroup=Parameters,Parameter=K" value="0.09545000000000001" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=NoName,Vector=Reactions[NCOR2 activation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[NCOR2 activation],ParameterGroup=Parameters,Parameter=Vf" value="0.124465" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[NCOR2 activation],ParameterGroup=Parameters,Parameter=exp1" value="1.8185" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[NCOR2 activation],ParameterGroup=Parameters,Parameter=K1" value="0.05315" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[NCOR2 activation],ParameterGroup=Parameters,Parameter=Vr" value="0.5907500000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[NCOR2 activation],ParameterGroup=Parameters,Parameter=B" value="0.1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=NoName,Vector=Reactions[FOXP1 activation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[FOXP1 activation],ParameterGroup=Parameters,Parameter=Vf" value="0.10955" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[FOXP1 activation],ParameterGroup=Parameters,Parameter=exp1" value="1.193" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[FOXP1 activation],ParameterGroup=Parameters,Parameter=K1" value="0.08360000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[FOXP1 activation],ParameterGroup=Parameters,Parameter=Vr" value="0.31685" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=NoName,Vector=Reactions[NFkB activation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[NFkB activation],ParameterGroup=Parameters,Parameter=Vf" value="0.13978945" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[NFkB activation],ParameterGroup=Parameters,Parameter=K" value="0.316436725" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[NFkB activation],ParameterGroup=Parameters,Parameter=K1" value="0.015346" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[NFkB activation],ParameterGroup=Parameters,Parameter=Vr" value="0.4815114999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[NFkB activation],ParameterGroup=Parameters,Parameter=exp1" value="1.73699275" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[NFkB activation],ParameterGroup=Parameters,Parameter=B" value="0.1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=NoName,Vector=Reactions[cAMP degradation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[cAMP degradation],ParameterGroup=Parameters,Parameter=k1" value="0.1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=NoName,Vector=Reactions[DAP12 degradation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[DAP12 degradation],ParameterGroup=Parameters,Parameter=k1" value="0.1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=NoName,Vector=Reactions[IL10 degradation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[IL10 degradation],ParameterGroup=Parameters,Parameter=k1" value="0.1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=NoName,Vector=Reactions[IFNg degradation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[IFNg degradation],ParameterGroup=Parameters,Parameter=k1" value="0.1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=NoName,Vector=Reactions[M-CSF degradation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[M-CSF degradation],ParameterGroup=Parameters,Parameter=k1" value="0.1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=NoName,Vector=Reactions[KLF4 activation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[KLF4 activation],ParameterGroup=Parameters,Parameter=Vf" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[KLF4 activation],ParameterGroup=Parameters,Parameter=B" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[KLF4 activation],ParameterGroup=Parameters,Parameter=exp1" value="1.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[KLF4 activation],ParameterGroup=Parameters,Parameter=K1" value="0.0743" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[KLF4 activation],ParameterGroup=Parameters,Parameter=Vr" value="0.114" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=NoName,Vector=Reactions[CX3CL1 activation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[CX3CL1 activation],ParameterGroup=Parameters,Parameter=Vf" value="0.126" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[CX3CL1 activation],ParameterGroup=Parameters,Parameter=B" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[CX3CL1 activation],ParameterGroup=Parameters,Parameter=exp1" value="1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[CX3CL1 activation],ParameterGroup=Parameters,Parameter=K" value="0.0678" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=NoName,Vector=Reactions[CX3CL1 degradation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=NoName,Vector=Reactions[CX3CL1 degradation],ParameterGroup=Parameters,Parameter=k1" value="0.1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
    </ListOfModelParameterSets>
    <StateTemplate>
      <StateTemplateVariable objectReference="Model_4"/>
      <StateTemplateVariable objectReference="Metabolite_3"/>
      <StateTemplateVariable objectReference="Metabolite_11"/>
      <StateTemplateVariable objectReference="Metabolite_17"/>
      <StateTemplateVariable objectReference="Metabolite_23"/>
      <StateTemplateVariable objectReference="Metabolite_91"/>
      <StateTemplateVariable objectReference="Metabolite_95"/>
      <StateTemplateVariable objectReference="Metabolite_5"/>
      <StateTemplateVariable objectReference="Metabolite_19"/>
      <StateTemplateVariable objectReference="Metabolite_21"/>
      <StateTemplateVariable objectReference="Metabolite_1"/>
      <StateTemplateVariable objectReference="Metabolite_25"/>
      <StateTemplateVariable objectReference="Metabolite_29"/>
      <StateTemplateVariable objectReference="Metabolite_31"/>
      <StateTemplateVariable objectReference="Metabolite_33"/>
      <StateTemplateVariable objectReference="Metabolite_37"/>
      <StateTemplateVariable objectReference="Metabolite_39"/>
      <StateTemplateVariable objectReference="Metabolite_41"/>
      <StateTemplateVariable objectReference="Metabolite_43"/>
      <StateTemplateVariable objectReference="Metabolite_45"/>
      <StateTemplateVariable objectReference="Metabolite_51"/>
      <StateTemplateVariable objectReference="Metabolite_55"/>
      <StateTemplateVariable objectReference="Metabolite_77"/>
      <StateTemplateVariable objectReference="Metabolite_87"/>
      <StateTemplateVariable objectReference="Metabolite_13"/>
      <StateTemplateVariable objectReference="Metabolite_73"/>
      <StateTemplateVariable objectReference="Metabolite_15"/>
      <StateTemplateVariable objectReference="Metabolite_53"/>
      <StateTemplateVariable objectReference="Metabolite_67"/>
      <StateTemplateVariable objectReference="Metabolite_71"/>
      <StateTemplateVariable objectReference="Metabolite_59"/>
      <StateTemplateVariable objectReference="Metabolite_75"/>
      <StateTemplateVariable objectReference="Metabolite_63"/>
      <StateTemplateVariable objectReference="Metabolite_79"/>
      <StateTemplateVariable objectReference="Metabolite_81"/>
      <StateTemplateVariable objectReference="Metabolite_83"/>
      <StateTemplateVariable objectReference="Metabolite_85"/>
      <StateTemplateVariable objectReference="Metabolite_49"/>
      <StateTemplateVariable objectReference="Metabolite_89"/>
      <StateTemplateVariable objectReference="Metabolite_57"/>
      <StateTemplateVariable objectReference="Metabolite_61"/>
      <StateTemplateVariable objectReference="Metabolite_9"/>
      <StateTemplateVariable objectReference="Metabolite_27"/>
      <StateTemplateVariable objectReference="Metabolite_47"/>
      <StateTemplateVariable objectReference="Metabolite_65"/>
      <StateTemplateVariable objectReference="Metabolite_69"/>
      <StateTemplateVariable objectReference="Metabolite_93"/>
      <StateTemplateVariable objectReference="Metabolite_97"/>
      <StateTemplateVariable objectReference="Metabolite_7"/>
      <StateTemplateVariable objectReference="Metabolite_35"/>
      <StateTemplateVariable objectReference="Compartment_1"/>
    </StateTemplate>
    <InitialState type="initialState">
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6.02214179e+23 6.02214179e+23 6.02214179e+23 0 0 6.02214179e+23 0 3.011070895e+23 6.02214179e+23 6.02214179e+23 6.02214179e+23 6.02214179e+23 6.02214179e+23 6.02214179e+23 6.02214179e+23 6.02214179e+23 6.02214179e+23 6.02214179e+23 6.02214179e+23 6.02214179e+23 6.02214179e+23 6.02214179e+23 6.02214179e+23 6.02214179e+23 6.02214179e+23 6.02214179e+23 6.02214179e+23 6.02214179e+23 0 1.5055354475e+25 1 
    </InitialState>
  </Model>
  <ListOfTasks>
    <Task key="Task_12" name="Steady-State" type="steadyState" scheduled="false" updateModel="false">
      <Report reference="Report_8" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="JacobianRequested" type="bool" value="1"/>
        <Parameter name="StabilityAnalysisRequested" type="bool" value="1"/>
      </Problem>
      <Method name="Enhanced Newton" type="EnhancedNewton">
        <Parameter name="Resolution" type="unsignedFloat" value="1e-09"/>
        <Parameter name="Derivation Factor" type="unsignedFloat" value="0.001"/>
        <Parameter name="Use Newton" type="bool" value="1"/>
        <Parameter name="Use Integration" type="bool" value="1"/>
        <Parameter name="Use Back Integration" type="bool" value="1"/>
        <Parameter name="Accept Negative Concentrations" type="bool" value="0"/>
        <Parameter name="Iteration Limit" type="unsignedInteger" value="50"/>
        <Parameter name="Maximum duration for forward integration" type="unsignedFloat" value="1000000000"/>
        <Parameter name="Maximum duration for backward integration" type="unsignedFloat" value="1000000"/>
      </Method>
    </Task>
    <Task key="Task_11" name="Time-Course" type="timeCourse" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="StepNumber" type="unsignedInteger" value="80"/>
        <Parameter name="StepSize" type="float" value="1.25"/>
        <Parameter name="Duration" type="float" value="100"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
        <Parameter name="Output Event" type="bool" value="0"/>
        <Parameter name="Continue on Simultaneous Events" type="bool" value="1"/>
      </Problem>
      <Method name="Deterministic (LSODA)" type="Deterministic(LSODA)">
        <Parameter name="Integrate Reduced Model" type="bool" value="0"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="1e-06"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="1e-12"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="10000"/>
      </Method>
    </Task>
    <Task key="Task_10" name="Scan" type="scan" scheduled="false" updateModel="true">
      <Problem>
        <Parameter name="Subtask" type="unsignedInteger" value="1"/>
        <ParameterGroup name="ScanItems">
          <ParameterGroup name="ScanItem">
            <Parameter name="Maximum" type="float" value="10"/>
            <Parameter name="Minimum" type="float" value="0"/>
            <Parameter name="Number of steps" type="unsignedInteger" value="10"/>
            <Parameter name="Object" type="cn" value="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[IL10],Reference=InitialConcentration"/>
            <Parameter name="Type" type="unsignedInteger" value="1"/>
            <Parameter name="log" type="bool" value="0"/>
          </ParameterGroup>
          <ParameterGroup name="ScanItem">
            <Parameter name="Maximum" type="float" value="10"/>
            <Parameter name="Minimum" type="float" value="0"/>
            <Parameter name="Number of steps" type="unsignedInteger" value="10"/>
            <Parameter name="Object" type="cn" value="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[IFNg],Reference=InitialConcentration"/>
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
    <Task key="Task_9" name="Elementary Flux Modes" type="fluxMode" scheduled="false" updateModel="false">
      <Report reference="Report_7" target="" append="1" confirmOverwrite="1"/>
      <Problem>
      </Problem>
      <Method name="EFM Algorithm" type="EFMAlgorithm">
      </Method>
    </Task>
    <Task key="Task_8" name="Optimization" type="optimization" scheduled="false" updateModel="false">
      <Report reference="Report_6" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Subtask" type="cn" value="CN=Root,Vector=TaskList[Sensitivities]"/>
        <ParameterText name="ObjectiveExpression" type="expression">
          &lt;TaskList[Sensitivities].Scaled sensitivities array[.]&gt;
        </ParameterText>
        <Parameter name="Maximize" type="bool" value="0"/>
        <Parameter name="Randomize Start Values" type="bool" value="0"/>
        <Parameter name="Calculate Statistics" type="bool" value="1"/>
        <ParameterGroup name="OptimizationItemList">
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.001"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[Akt activation],ParameterGroup=Parameters,Parameter=K1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.01779"/>
            <Parameter name="UpperBound" type="cn" value="0.1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[Akt activation],ParameterGroup=Parameters,Parameter=K2,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.11105"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[Akt activation],ParameterGroup=Parameters,Parameter=K3,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.1328"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[Akt activation],ParameterGroup=Parameters,Parameter=Vf,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.1115"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[Akt activation],ParameterGroup=Parameters,Parameter=Vr,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.1922"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.5"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[Akt activation],ParameterGroup=Parameters,Parameter=exp1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="1.136"/>
            <Parameter name="UpperBound" type="cn" value="1.5"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[CREB activation],ParameterGroup=Parameters,Parameter=K1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.0635"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[CREB activation],ParameterGroup=Parameters,Parameter=K2,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.0728"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[CREB activation],ParameterGroup=Parameters,Parameter=Vf,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.1493"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[CREB activation],ParameterGroup=Parameters,Parameter=Vr,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.19685"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.5"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[CREB activation],ParameterGroup=Parameters,Parameter=exp1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="1.508"/>
            <Parameter name="UpperBound" type="cn" value="2"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[CSF1R activation],ParameterGroup=Parameters,Parameter=K1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.36647"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[CSF1R activation],ParameterGroup=Parameters,Parameter=K2,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.0551"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[CSF1R activation],ParameterGroup=Parameters,Parameter=Vf,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.185"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[CSF1R activation],ParameterGroup=Parameters,Parameter=Vr,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.2"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.5"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[CSF1R activation],ParameterGroup=Parameters,Parameter=exp1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="1.907"/>
            <Parameter name="UpperBound" type="cn" value="2"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[CX3CL1 activation],ParameterGroup=Parameters,Parameter=B,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.1"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[CX3CL1 activation],ParameterGroup=Parameters,Parameter=K,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.0678"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[CX3CL1 activation],ParameterGroup=Parameters,Parameter=Vf,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.126"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.5"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[CX3CL1 activation],ParameterGroup=Parameters,Parameter=exp1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="1"/>
            <Parameter name="UpperBound" type="cn" value="2"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[CX3CL1 degradation],ParameterGroup=Parameters,Parameter=k1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.1"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[CX3CR1 activation],ParameterGroup=Parameters,Parameter=K1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.19115"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[CX3CR1 activation],ParameterGroup=Parameters,Parameter=K2,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.05"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[CX3CR1 activation],ParameterGroup=Parameters,Parameter=Vf,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.13385"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[CX3CR1 activation],ParameterGroup=Parameters,Parameter=Vr,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.1715"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.5"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[CX3CR1 activation],ParameterGroup=Parameters,Parameter=exp1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="1.6325"/>
            <Parameter name="UpperBound" type="cn" value="2"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[Ca2+ transport],ParameterGroup=Parameters,Parameter=K1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.3076"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[Ca2+ transport],ParameterGroup=Parameters,Parameter=K2,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.1292"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.001"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[DAP12 activation],ParameterGroup=Parameters,Parameter=k1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.0384359"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[DAP12 degradation],ParameterGroup=Parameters,Parameter=k1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.1"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[ERK activation],ParameterGroup=Parameters,Parameter=K1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.1043"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[ERK activation],ParameterGroup=Parameters,Parameter=K2,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.0851"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[ERK activation],ParameterGroup=Parameters,Parameter=Vf,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.0487012"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[ERK activation],ParameterGroup=Parameters,Parameter=Vr,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.1607"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.5"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[ERK activation],ParameterGroup=Parameters,Parameter=exp1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="1.0115"/>
            <Parameter name="UpperBound" type="cn" value="2"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[FOXP1 activation],ParameterGroup=Parameters,Parameter=K1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.08359999999999999"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[FOXP1 activation],ParameterGroup=Parameters,Parameter=Vf,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.10955"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[FOXP1 activation],ParameterGroup=Parameters,Parameter=Vr,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.31685"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.5"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[FOXP1 activation],ParameterGroup=Parameters,Parameter=exp1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="1.193"/>
            <Parameter name="UpperBound" type="cn" value="2"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[Fbxo7 activation],ParameterGroup=Parameters,Parameter=B,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.1"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[Fbxo7 activation],ParameterGroup=Parameters,Parameter=K1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.1536"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[Fbxo7 activation],ParameterGroup=Parameters,Parameter=Vf,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.1235"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[Fbxo7 activation],ParameterGroup=Parameters,Parameter=Vr,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.19115"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.5"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[Fbxo7 activation],ParameterGroup=Parameters,Parameter=exp1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="1.349"/>
            <Parameter name="UpperBound" type="cn" value="2"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[IL10 degradation],ParameterGroup=Parameters,Parameter=k1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.1"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[IL10 production],ParameterGroup=Parameters,Parameter=K,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.0536"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.001"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[IL10 production],ParameterGroup=Parameters,Parameter=K1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.0593"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[IL10 production],ParameterGroup=Parameters,Parameter=K2,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.09815"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.001"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[IL10 production],ParameterGroup=Parameters,Parameter=K3,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.01589"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.1"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[IL10 production],ParameterGroup=Parameters,Parameter=Vf,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="1.66808"/>
            <Parameter name="UpperBound" type="cn" value="10"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.5"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[IL10 production],ParameterGroup=Parameters,Parameter=exp1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="1.193"/>
            <Parameter name="UpperBound" type="cn" value="2"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[IL10R activation],ParameterGroup=Parameters,Parameter=B,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[IL10R activation],ParameterGroup=Parameters,Parameter=K1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.463615"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[IL10R activation],ParameterGroup=Parameters,Parameter=Vf,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.169469"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[IL10R activation],ParameterGroup=Parameters,Parameter=Vr,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.188"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.5"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[IL10R activation],ParameterGroup=Parameters,Parameter=exp1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="1.042"/>
            <Parameter name="UpperBound" type="cn" value="2"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[IFNg degradation],ParameterGroup=Parameters,Parameter=k1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.1"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[IFNg production],ParameterGroup=Parameters,Parameter=K,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.06035"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[IFNg production],ParameterGroup=Parameters,Parameter=K1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.06755"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[IFNg production],ParameterGroup=Parameters,Parameter=K2,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.0785"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[IFNg production],ParameterGroup=Parameters,Parameter=K3,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.0692"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[IFNg production],ParameterGroup=Parameters,Parameter=Vf,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.467575"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.5"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[IFNg production],ParameterGroup=Parameters,Parameter=exp1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="1.151"/>
            <Parameter name="UpperBound" type="cn" value="2"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[KLF4 activation],ParameterGroup=Parameters,Parameter=B,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.1"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[KLF4 activation],ParameterGroup=Parameters,Parameter=K1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.0743"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[KLF4 activation],ParameterGroup=Parameters,Parameter=Vf,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.1"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[KLF4 activation],ParameterGroup=Parameters,Parameter=Vr,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.114"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.5"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[KLF4 activation],ParameterGroup=Parameters,Parameter=exp1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="1.1"/>
            <Parameter name="UpperBound" type="cn" value="2"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[LANCL2 activation],ParameterGroup=Parameters,Parameter=B,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.1"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[LANCL2 activation],ParameterGroup=Parameters,Parameter=K1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.06395000000000001"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[LANCL2 activation],ParameterGroup=Parameters,Parameter=Vf,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.1328"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[LANCL2 activation],ParameterGroup=Parameters,Parameter=Vr,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.1835"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.5"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[LANCL2 activation],ParameterGroup=Parameters,Parameter=exp1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="1.643"/>
            <Parameter name="UpperBound" type="cn" value="2"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[M-CSF degradation],ParameterGroup=Parameters,Parameter=k1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.1"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[M-CSF production],ParameterGroup=Parameters,Parameter=B,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.1"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[M-CSF production],ParameterGroup=Parameters,Parameter=K,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.13325"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[M-CSF production],ParameterGroup=Parameters,Parameter=Vf,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.03888"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.5"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[M-CSF production],ParameterGroup=Parameters,Parameter=exp1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="1.049"/>
            <Parameter name="UpperBound" type="cn" value="2"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[Mreg differentiation],ParameterGroup=Parameters,Parameter=K,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="1.49275"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[Mreg differentiation],ParameterGroup=Parameters,Parameter=K1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.08075"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[Mreg differentiation],ParameterGroup=Parameters,Parameter=K2,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.1589"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.5"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[Mreg differentiation],ParameterGroup=Parameters,Parameter=exp1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="1.001"/>
            <Parameter name="UpperBound" type="cn" value="2"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.5"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[Mreg differentiation],ParameterGroup=Parameters,Parameter=exp2,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="2.428"/>
            <Parameter name="UpperBound" type="cn" value="4"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.5"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[Mreg differentiation],ParameterGroup=Parameters,Parameter=exp3,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="1.001"/>
            <Parameter name="UpperBound" type="cn" value="2"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[NCOR2 activation],ParameterGroup=Parameters,Parameter=B,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.1"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[NCOR2 activation],ParameterGroup=Parameters,Parameter=K1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.05315"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[NCOR2 activation],ParameterGroup=Parameters,Parameter=Vf,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.124465"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[NCOR2 activation],ParameterGroup=Parameters,Parameter=Vr,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.59075"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.5"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[NCOR2 activation],ParameterGroup=Parameters,Parameter=exp1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="1.8185"/>
            <Parameter name="UpperBound" type="cn" value="2"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[NFAT activation],ParameterGroup=Parameters,Parameter=B,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.1"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[NFAT activation],ParameterGroup=Parameters,Parameter=K,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.1307"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[NFAT activation],ParameterGroup=Parameters,Parameter=K1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.1586"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[NFAT activation],ParameterGroup=Parameters,Parameter=Vf,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.11105"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[NFAT activation],ParameterGroup=Parameters,Parameter=Vr,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.18755"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.5"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[NFAT activation],ParameterGroup=Parameters,Parameter=exp1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="1.5755"/>
            <Parameter name="UpperBound" type="cn" value="2"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[NFkB activation],ParameterGroup=Parameters,Parameter=B,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.1"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[NFkB activation],ParameterGroup=Parameters,Parameter=K,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.316437"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.001"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[NFkB activation],ParameterGroup=Parameters,Parameter=K1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.015346"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[NFkB activation],ParameterGroup=Parameters,Parameter=Vf,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.139789"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.1"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[NFkB activation],ParameterGroup=Parameters,Parameter=Vr,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.481511"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.5"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[NFkB activation],ParameterGroup=Parameters,Parameter=exp1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="1.73699"/>
            <Parameter name="UpperBound" type="cn" value="2"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[PKA activation],ParameterGroup=Parameters,Parameter=B,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.1"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[PKA activation],ParameterGroup=Parameters,Parameter=K1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.0515"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[PKA activation],ParameterGroup=Parameters,Parameter=Vf,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.1199"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[PKA activation],ParameterGroup=Parameters,Parameter=Vr,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.18635"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.5"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[PKA activation],ParameterGroup=Parameters,Parameter=exp1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="1.301"/>
            <Parameter name="UpperBound" type="cn" value="2"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[Traf2 activation],ParameterGroup=Parameters,Parameter=K,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.09544999999999999"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.001"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[Traf2 activation],ParameterGroup=Parameters,Parameter=K1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.06815"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.001"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[Traf2 activation],ParameterGroup=Parameters,Parameter=K2,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.01646"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[Traf2 activation],ParameterGroup=Parameters,Parameter=Vf,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.984949"/>
            <Parameter name="UpperBound" type="cn" value="2"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.1"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[Traf2 activation],ParameterGroup=Parameters,Parameter=Vr,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.262"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.5"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[Traf2 activation],ParameterGroup=Parameters,Parameter=exp1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="1.493"/>
            <Parameter name="UpperBound" type="cn" value="2"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.05"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[cAMP degradation],ParameterGroup=Parameters,Parameter=k1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.1"/>
            <Parameter name="UpperBound" type="cn" value="0.5"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[cAMP production],ParameterGroup=Parameters,Parameter=K,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.185"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.01"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[cAMP production],ParameterGroup=Parameters,Parameter=Vf,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="0.029"/>
            <Parameter name="UpperBound" type="cn" value="0.1"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="LowerBound" type="cn" value="0.5"/>
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=NoName,Vector=Reactions[cAMP production],ParameterGroup=Parameters,Parameter=exp1,Reference=Value"/>
            <Parameter name="StartValue" type="float" value="1.0895"/>
            <Parameter name="UpperBound" type="cn" value="2"/>
          </ParameterGroup>
        </ParameterGroup>
        <ParameterGroup name="OptimizationConstraintList">
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
    <Task key="Task_7" name="Parameter Estimation" type="parameterFitting" scheduled="false" updateModel="false">
      <Report reference="Report_5" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Maximize" type="bool" value="0"/>
        <Parameter name="Randomize Start Values" type="bool" value="0"/>
        <Parameter name="Calculate Statistics" type="bool" value="1"/>
        <ParameterGroup name="OptimizationItemList">
        </ParameterGroup>
        <ParameterGroup name="OptimizationConstraintList">
        </ParameterGroup>
        <Parameter name="Steady-State" type="cn" value="CN=Root,Vector=TaskList[Steady-State]"/>
        <Parameter name="Time-Course" type="cn" value="CN=Root,Vector=TaskList[Time-Course]"/>
        <Parameter name="Create Parameter Sets" type="bool" value="0"/>
        <ParameterGroup name="Experiment Set">
        </ParameterGroup>
        <ParameterGroup name="Validation Set">
          <Parameter name="Threshold" type="unsignedInteger" value="5"/>
          <Parameter name="Weight" type="unsignedFloat" value="1"/>
        </ParameterGroup>
      </Problem>
      <Method name="Evolutionary Programming" type="EvolutionaryProgram">
        <Parameter name="Number of Generations" type="unsignedInteger" value="200"/>
        <Parameter name="Population Size" type="unsignedInteger" value="20"/>
        <Parameter name="Random Number Generator" type="unsignedInteger" value="1"/>
        <Parameter name="Seed" type="unsignedInteger" value="0"/>
      </Method>
    </Task>
    <Task key="Task_6" name="Metabolic Control Analysis" type="metabolicControlAnalysis" scheduled="false" updateModel="false">
      <Report reference="Report_4" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Steady-State" type="key" value="Task_12"/>
      </Problem>
      <Method name="MCA Method (Reder)" type="MCAMethod(Reder)">
        <Parameter name="Modulation Factor" type="unsignedFloat" value="1e-09"/>
        <Parameter name="Use Reeder" type="bool" value="1"/>
        <Parameter name="Use Smallbone" type="bool" value="1"/>
      </Method>
    </Task>
    <Task key="Task_5" name="Lyapunov Exponents" type="lyapunovExponents" scheduled="false" updateModel="false">
      <Report reference="Report_3" target="" append="1" confirmOverwrite="1"/>
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
    <Task key="Task_4" name="Time Scale Separation Analysis" type="timeScaleSeparationAnalysis" scheduled="false" updateModel="false">
      <Report reference="Report_2" target="" append="1" confirmOverwrite="1"/>
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
    <Task key="Task_3" name="Sensitivities" type="sensitivities" scheduled="false" updateModel="false">
      <Report reference="Report_1" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="SubtaskType" type="unsignedInteger" value="2"/>
        <ParameterGroup name="TargetFunctions">
          <Parameter name="SingleObject" type="cn" value="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[Mreg],Reference=Concentration"/>
          <Parameter name="ObjectListType" type="unsignedInteger" value="1"/>
        </ParameterGroup>
        <ParameterGroup name="ListOfVariables">
          <ParameterGroup name="Variables">
            <Parameter name="SingleObject" type="cn" value=""/>
            <Parameter name="ObjectListType" type="unsignedInteger" value="42"/>
          </ParameterGroup>
        </ParameterGroup>
      </Problem>
      <Method name="Sensitivities Method" type="SensitivitiesMethod">
        <Parameter name="Delta factor" type="unsignedFloat" value="0.001"/>
        <Parameter name="Delta minimum" type="unsignedFloat" value="1e-12"/>
      </Method>
    </Task>
    <Task key="Task_2" name="Moieties" type="moieties" scheduled="false" updateModel="false">
      <Problem>
      </Problem>
      <Method name="Householder Reduction" type="Householder">
      </Method>
    </Task>
    <Task key="Task_1" name="Cross Section" type="crosssection" scheduled="false" updateModel="false">
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
    <Task key="Task_13" name="Linear Noise Approximation" type="linearNoiseApproximation" scheduled="false" updateModel="false">
      <Report reference="Report_0" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Steady-State" type="key" value="Task_12"/>
      </Problem>
      <Method name="Linear Noise Approximation" type="LinearNoiseApproximation">
      </Method>
    </Task>
  </ListOfTasks>
  <ListOfReports>
    <Report key="Report_8" name="Steady-State" taskType="steadyState" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Steady-State]"/>
      </Footer>
    </Report>
    <Report key="Report_7" name="Elementary Flux Modes" taskType="fluxMode" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Elementary Flux Modes],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_6" name="Optimization" taskType="optimization" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
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
        Automatically generated report.
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
        Automatically generated report.
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
        Automatically generated report.
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
        Automatically generated report.
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
        Automatically generated report.
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
    <PlotSpecification name="Concentrations, Volumes, and Global Quantity Values" type="Plot2D" active="1">
      <Parameter name="log X" type="bool" value="0"/>
      <Parameter name="log Y" type="bool" value="0"/>
      <ListOfPlotItems>
        <PlotItem name="[CX3CR1]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[CX3CR1],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[DAP12]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[DAP12],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[ERK]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[ERK],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[Ca2+]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[Ca2+],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[cAMP]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[cAMP],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[PKA]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[PKA],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[CREB]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[CREB],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL10]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[IL10],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IL10R]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[IL10R],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[Akt]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[Akt],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[M-CSF]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[M-CSF],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[CSF1R]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[CSF1R],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[NFAT]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[NFAT],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[LANCL2]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[LANCL2],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[Mreg]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[Mreg],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[HP]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[HP],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[Traf2]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[Traf2],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[Fbxo7]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[Fbxo7],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[NCOR2]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[NCOR2],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[FOXP1]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[FOXP1],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[NFkB]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[NFkB],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[pAkt]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[pAkt],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[eCa2+]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[eCa2+],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[iCa2+]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[iCa2+],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[pCREB]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[pCREB],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[pCX3CR1]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[pCX3CR1],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[pERK]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[pERK],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[pFbxo7]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[pFbxo7],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[pFOXP1]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[pFOXP1],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[pLANCL2]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[pLANCL2],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[pNCOR2]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[pNCOR2],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[pNFAT]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[pNFAT],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[pNFkB]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[pNFkB],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[pPKA]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[pPKA],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[pTraf2]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[pTraf2],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[pIL10R]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[pIL10R],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[pCSF1R]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[pCSF1R],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[Mono]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[Mono],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[KLF4]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[KLF4],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[pKLF4]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[pKLF4],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[CX3CL1]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[CX3CL1],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="[IFNg]" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=NoName,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[IFNg],Reference=Concentration"/>
          </ListOfChannels>
        </PlotItem>
      </ListOfPlotItems>
    </PlotSpecification>
  </ListOfPlots>
  <GUI>
    <ListOfSliders>
      <Slider key="Slider_0" associatedEntityKey="Task_11" objectCN="CN=Root,Model=NoName,Vector=Compartments[default],Vector=Metabolites[HP],Reference=InitialConcentration" objectType="float" objectValue="25" minValue="0.5" maxValue="25" tickNumber="1000" tickFactor="100" scaling="linear"/>
      <Slider key="Slider_1" associatedEntityKey="Task_11" objectCN="CN=Root,Model=NoName,Vector=Reactions[Mreg differentiation],ParameterGroup=Parameters,Parameter=K,Reference=Value" objectType="float" objectValue="1.49275" minValue="0.05" maxValue="10" tickNumber="1000" tickFactor="100" scaling="linear"/>
      <Slider key="Slider_2" associatedEntityKey="Task_11" objectCN="CN=Root,Model=NoName,Vector=Reactions[Mreg differentiation],ParameterGroup=Parameters,Parameter=K1,Reference=Value" objectType="float" objectValue="0.08075" minValue="0.05" maxValue="0.2" tickNumber="1000" tickFactor="100" scaling="linear"/>
      <Slider key="Slider_3" associatedEntityKey="Task_11" objectCN="CN=Root,Model=NoName,Vector=Reactions[Mreg differentiation],ParameterGroup=Parameters,Parameter=K2,Reference=Value" objectType="float" objectValue="0.1589" minValue="0.05" maxValue="0.2" tickNumber="1000" tickFactor="100" scaling="linear"/>
      <Slider key="Slider_4" associatedEntityKey="Task_11" objectCN="CN=Root,Model=NoName,Vector=Reactions[DAP12 activation],ParameterGroup=Parameters,Parameter=k1,Reference=Value" objectType="float" objectValue="0.038436" minValue="0.033775" maxValue="0.1351" tickNumber="1000" tickFactor="100" scaling="linear"/>
      <Slider key="Slider_5" associatedEntityKey="Task_11" objectCN="CN=Root,Model=NoName,Vector=Reactions[ERK activation],ParameterGroup=Parameters,Parameter=K1,Reference=Value" objectType="float" objectValue="0.1043" minValue="0.05215" maxValue="0.2086" tickNumber="1000" tickFactor="100" scaling="linear"/>
      <Slider key="Slider_6" associatedEntityKey="Task_11" objectCN="CN=Root,Model=NoName,Vector=Reactions[ERK activation],ParameterGroup=Parameters,Parameter=K2,Reference=Value" objectType="float" objectValue="0.0851" minValue="0.04255" maxValue="0.1702" tickNumber="1000" tickFactor="100" scaling="linear"/>
      <Slider key="Slider_7" associatedEntityKey="Task_11" objectCN="CN=Root,Model=NoName,Vector=Reactions[ERK activation],ParameterGroup=Parameters,Parameter=Vf,Reference=Value" objectType="float" objectValue="0.0487012" minValue="0.0436" maxValue="0.1744" tickNumber="1000" tickFactor="100" scaling="linear"/>
      <Slider key="Slider_8" associatedEntityKey="Task_11" objectCN="CN=Root,Model=NoName,Vector=Reactions[ERK activation],ParameterGroup=Parameters,Parameter=Vr,Reference=Value" objectType="float" objectValue="0.1607" minValue="0.08035" maxValue="0.3214" tickNumber="1000" tickFactor="100" scaling="linear"/>
      <Slider key="Slider_9" associatedEntityKey="Task_11" objectCN="CN=Root,Model=NoName,Vector=Reactions[ERK activation],ParameterGroup=Parameters,Parameter=exp1,Reference=Value" objectType="float" objectValue="1.0115" minValue="0.50575" maxValue="2.023" tickNumber="1000" tickFactor="100" scaling="linear"/>
      <Slider key="Slider_10" associatedEntityKey="Task_11" objectCN="CN=Root,Model=NoName,Vector=Reactions[Mreg differentiation],ParameterGroup=Parameters,Parameter=exp1,Reference=Value" objectType="float" objectValue="1.001" minValue="0.5" maxValue="2" tickNumber="1000" tickFactor="100" scaling="linear"/>
      <Slider key="Slider_11" associatedEntityKey="Task_11" objectCN="CN=Root,Model=NoName,Vector=Reactions[Mreg differentiation],ParameterGroup=Parameters,Parameter=exp2,Reference=Value" objectType="float" objectValue="2.428" minValue="1" maxValue="4" tickNumber="1000" tickFactor="100" scaling="linear"/>
      <Slider key="Slider_12" associatedEntityKey="Task_11" objectCN="CN=Root,Model=NoName,Vector=Reactions[Mreg differentiation],ParameterGroup=Parameters,Parameter=exp3,Reference=Value" objectType="float" objectValue="1.001" minValue="0.5" maxValue="2" tickNumber="1000" tickFactor="100" scaling="linear"/>
      <Slider key="Slider_13" associatedEntityKey="Task_11" objectCN="CN=Root,Model=NoName,Vector=Reactions[NFkB activation],ParameterGroup=Parameters,Parameter=K,Reference=Value" objectType="float" objectValue="0.316437" minValue="0.164725" maxValue="0.6589" tickNumber="1000" tickFactor="100" scaling="linear"/>
      <Slider key="Slider_14" associatedEntityKey="Task_11" objectCN="CN=Root,Model=NoName,Vector=Reactions[NFkB activation],ParameterGroup=Parameters,Parameter=K1,Reference=Value" objectType="float" objectValue="0.015346" minValue="0.01" maxValue="0.1072" tickNumber="1000" tickFactor="100" scaling="linear"/>
      <Slider key="Slider_15" associatedEntityKey="Task_11" objectCN="CN=Root,Model=NoName,Vector=Reactions[NFkB activation],ParameterGroup=Parameters,Parameter=Vf,Reference=Value" objectType="float" objectValue="0.139789" minValue="0.063025" maxValue="0.2521" tickNumber="1000" tickFactor="100" scaling="linear"/>
      <Slider key="Slider_16" associatedEntityKey="Task_11" objectCN="CN=Root,Model=NoName,Vector=Reactions[NFkB activation],ParameterGroup=Parameters,Parameter=Vr,Reference=Value" objectType="float" objectValue="0.481511" minValue="0.15325" maxValue="0.613" tickNumber="1000" tickFactor="100" scaling="linear"/>
      <Slider key="Slider_17" associatedEntityKey="Task_11" objectCN="CN=Root,Model=NoName,Vector=Reactions[NFkB activation],ParameterGroup=Parameters,Parameter=exp1,Reference=Value" objectType="float" objectValue="1.73699" minValue="0.73075" maxValue="2.923" tickNumber="1000" tickFactor="100" scaling="linear"/>
      <Slider key="Slider_18" associatedEntityKey="Task_11" objectCN="CN=Root,Model=NoName,Vector=Reactions[Traf2 activation],ParameterGroup=Parameters,Parameter=K,Reference=Value" objectType="float" objectValue="0.09545" minValue="0.047725" maxValue="0.1909" tickNumber="1000" tickFactor="100" scaling="linear"/>
      <Slider key="Slider_19" associatedEntityKey="Task_11" objectCN="CN=Root,Model=NoName,Vector=Reactions[Traf2 activation],ParameterGroup=Parameters,Parameter=K1,Reference=Value" objectType="float" objectValue="0.06815" minValue="0.034075" maxValue="0.1363" tickNumber="1000" tickFactor="100" scaling="linear"/>
      <Slider key="Slider_20" associatedEntityKey="Task_11" objectCN="CN=Root,Model=NoName,Vector=Reactions[Traf2 activation],ParameterGroup=Parameters,Parameter=K2,Reference=Value" objectType="float" objectValue="0.01646" minValue="0.00823" maxValue="0.03292" tickNumber="1000" tickFactor="100" scaling="linear"/>
      <Slider key="Slider_21" associatedEntityKey="Task_11" objectCN="CN=Root,Model=NoName,Vector=Reactions[Traf2 activation],ParameterGroup=Parameters,Parameter=Vf,Reference=Value" objectType="float" objectValue="0.984949" minValue="0.114625" maxValue="1" tickNumber="1000" tickFactor="100" scaling="linear"/>
      <Slider key="Slider_22" associatedEntityKey="Task_11" objectCN="CN=Root,Model=NoName,Vector=Reactions[Traf2 activation],ParameterGroup=Parameters,Parameter=Vr,Reference=Value" objectType="float" objectValue="0.262" minValue="0.131" maxValue="0.524" tickNumber="1000" tickFactor="100" scaling="linear"/>
      <Slider key="Slider_23" associatedEntityKey="Task_11" objectCN="CN=Root,Model=NoName,Vector=Reactions[Traf2 activation],ParameterGroup=Parameters,Parameter=exp1,Reference=Value" objectType="float" objectValue="1.493" minValue="0.7465" maxValue="2.986" tickNumber="1000" tickFactor="100" scaling="linear"/>
      <Slider key="Slider_24" associatedEntityKey="Task_11" objectCN="CN=Root,Model=NoName,Vector=Reactions[IL10 production],ParameterGroup=Parameters,Parameter=K,Reference=Value" objectType="float" objectValue="0.0536" minValue="0.0268" maxValue="0.1072" tickNumber="1000" tickFactor="100" scaling="linear"/>
      <Slider key="Slider_25" associatedEntityKey="Task_11" objectCN="CN=Root,Model=NoName,Vector=Reactions[IL10 production],ParameterGroup=Parameters,Parameter=K1,Reference=Value" objectType="float" objectValue="0.0593" minValue="0.02965" maxValue="0.1186" tickNumber="1000" tickFactor="100" scaling="linear"/>
      <Slider key="Slider_26" associatedEntityKey="Task_11" objectCN="CN=Root,Model=NoName,Vector=Reactions[IL10 production],ParameterGroup=Parameters,Parameter=K2,Reference=Value" objectType="float" objectValue="0.09815" minValue="0.049075" maxValue="0.1963" tickNumber="1000" tickFactor="100" scaling="linear"/>
      <Slider key="Slider_27" associatedEntityKey="Task_11" objectCN="CN=Root,Model=NoName,Vector=Reactions[IL10 production],ParameterGroup=Parameters,Parameter=K3,Reference=Value" objectType="float" objectValue="0.01589" minValue="0.007945" maxValue="0.03178" tickNumber="1000" tickFactor="100" scaling="linear"/>
      <Slider key="Slider_28" associatedEntityKey="Task_11" objectCN="CN=Root,Model=NoName,Vector=Reactions[IL10 production],ParameterGroup=Parameters,Parameter=Vf,Reference=Value" objectType="float" objectValue="1.66808" minValue="0.0982" maxValue="6" tickNumber="1000" tickFactor="100" scaling="linear"/>
      <Slider key="Slider_29" associatedEntityKey="Task_11" objectCN="CN=Root,Model=NoName,Vector=Reactions[IL10 production],ParameterGroup=Parameters,Parameter=exp1,Reference=Value" objectType="float" objectValue="1.193" minValue="0.5965" maxValue="2.386" tickNumber="1000" tickFactor="100" scaling="linear"/>
      <Slider key="Slider_30" associatedEntityKey="Task_11" objectCN="CN=Root,Model=NoName,Vector=Reactions[IFNg production],ParameterGroup=Parameters,Parameter=K,Reference=Value" objectType="float" objectValue="0.06035" minValue="0.030175" maxValue="0.1207" tickNumber="1000" tickFactor="100" scaling="linear"/>
      <Slider key="Slider_31" associatedEntityKey="Task_11" objectCN="CN=Root,Model=NoName,Vector=Reactions[IFNg production],ParameterGroup=Parameters,Parameter=K1,Reference=Value" objectType="float" objectValue="0.06755" minValue="0.033775" maxValue="0.1351" tickNumber="1000" tickFactor="100" scaling="linear"/>
      <Slider key="Slider_32" associatedEntityKey="Task_11" objectCN="CN=Root,Model=NoName,Vector=Reactions[IFNg production],ParameterGroup=Parameters,Parameter=K2,Reference=Value" objectType="float" objectValue="0.0785" minValue="0.03925" maxValue="0.157" tickNumber="1000" tickFactor="100" scaling="linear"/>
      <Slider key="Slider_33" associatedEntityKey="Task_11" objectCN="CN=Root,Model=NoName,Vector=Reactions[IFNg production],ParameterGroup=Parameters,Parameter=K3,Reference=Value" objectType="float" objectValue="0.0692" minValue="0.0346" maxValue="0.1384" tickNumber="1000" tickFactor="100" scaling="linear"/>
      <Slider key="Slider_34" associatedEntityKey="Task_11" objectCN="CN=Root,Model=NoName,Vector=Reactions[IFNg production],ParameterGroup=Parameters,Parameter=Vf,Reference=Value" objectType="float" objectValue="0.467575" minValue="0.05035" maxValue="2" tickNumber="1000" tickFactor="100" scaling="linear"/>
      <Slider key="Slider_35" associatedEntityKey="Task_11" objectCN="CN=Root,Model=NoName,Vector=Reactions[IFNg production],ParameterGroup=Parameters,Parameter=exp1,Reference=Value" objectType="float" objectValue="1.151" minValue="0.5755" maxValue="2.302" tickNumber="1000" tickFactor="100" scaling="linear"/>
      <Slider key="Slider_36" associatedEntityKey="Task_11" objectCN="CN=Root,Model=NoName,Vector=Reactions[IL10R activation],ParameterGroup=Parameters,Parameter=Vf,Reference=Value" objectType="float" objectValue="0.169469" minValue="0.159425" maxValue="0.6377" tickNumber="1000" tickFactor="100" scaling="linear"/>
      <Slider key="Slider_37" associatedEntityKey="Task_11" objectCN="CN=Root,Model=NoName,Vector=Reactions[IL10R activation],ParameterGroup=Parameters,Parameter=exp1,Reference=Value" objectType="float" objectValue="1.042" minValue="1" maxValue="4" tickNumber="1000" tickFactor="100" scaling="linear"/>
      <Slider key="Slider_38" associatedEntityKey="Task_11" objectCN="CN=Root,Model=NoName,Vector=Reactions[IL10R activation],ParameterGroup=Parameters,Parameter=Vr,Reference=Value" objectType="float" objectValue="0.188" minValue="0.05" maxValue="0.3" tickNumber="1000" tickFactor="100" scaling="linear"/>
      <Slider key="Slider_39" associatedEntityKey="Task_11" objectCN="CN=Root,Model=NoName,Vector=Reactions[IL10R activation],ParameterGroup=Parameters,Parameter=B,Reference=Value" objectType="float" objectValue="0" minValue="0" maxValue="1" tickNumber="1000" tickFactor="100" scaling="linear"/>
      <Slider key="Slider_40" associatedEntityKey="Task_11" objectCN="CN=Root,Model=NoName,Vector=Reactions[IL10R activation],ParameterGroup=Parameters,Parameter=K1,Reference=Value" objectType="float" objectValue="0.463615" minValue="0.02125" maxValue="0.5" tickNumber="1000" tickFactor="100" scaling="linear"/>
    </ListOfSliders>
  </GUI>
  <SBMLReference file="hplancl2.xml">
    <SBMLMap SBMLid="default" COPASIkey="Compartment_1"/>
    <SBMLMap SBMLid="re1" COPASIkey="Reaction_0"/>
    <SBMLMap SBMLid="re11" COPASIkey="Reaction_9"/>
    <SBMLMap SBMLid="re12" COPASIkey="Reaction_10"/>
    <SBMLMap SBMLid="re16" COPASIkey="Reaction_11"/>
    <SBMLMap SBMLid="re18" COPASIkey="Reaction_12"/>
    <SBMLMap SBMLid="re19" COPASIkey="Reaction_13"/>
    <SBMLMap SBMLid="re2" COPASIkey="Reaction_1"/>
    <SBMLMap SBMLid="re20" COPASIkey="Reaction_14"/>
    <SBMLMap SBMLid="re24" COPASIkey="Reaction_15"/>
    <SBMLMap SBMLid="re25" COPASIkey="Reaction_16"/>
    <SBMLMap SBMLid="re26" COPASIkey="Reaction_17"/>
    <SBMLMap SBMLid="re27" COPASIkey="Reaction_18"/>
    <SBMLMap SBMLid="re28" COPASIkey="Reaction_19"/>
    <SBMLMap SBMLid="re29" COPASIkey="Reaction_20"/>
    <SBMLMap SBMLid="re3" COPASIkey="Reaction_2"/>
    <SBMLMap SBMLid="re4" COPASIkey="Reaction_3"/>
    <SBMLMap SBMLid="re5" COPASIkey="Reaction_4"/>
    <SBMLMap SBMLid="re6" COPASIkey="Reaction_5"/>
    <SBMLMap SBMLid="re7" COPASIkey="Reaction_6"/>
    <SBMLMap SBMLid="re8" COPASIkey="Reaction_7"/>
    <SBMLMap SBMLid="re9" COPASIkey="Reaction_8"/>
    <SBMLMap SBMLid="s1" COPASIkey="Metabolite_1"/>
    <SBMLMap SBMLid="s10" COPASIkey="Metabolite_19"/>
    <SBMLMap SBMLid="s11" COPASIkey="Metabolite_21"/>
    <SBMLMap SBMLid="s12" COPASIkey="Metabolite_23"/>
    <SBMLMap SBMLid="s13" COPASIkey="Metabolite_25"/>
    <SBMLMap SBMLid="s14" COPASIkey="Metabolite_27"/>
    <SBMLMap SBMLid="s15" COPASIkey="Metabolite_29"/>
    <SBMLMap SBMLid="s16" COPASIkey="Metabolite_31"/>
    <SBMLMap SBMLid="s17" COPASIkey="Metabolite_33"/>
    <SBMLMap SBMLid="s19" COPASIkey="Metabolite_35"/>
    <SBMLMap SBMLid="s2" COPASIkey="Metabolite_3"/>
    <SBMLMap SBMLid="s20" COPASIkey="Metabolite_37"/>
    <SBMLMap SBMLid="s21" COPASIkey="Metabolite_39"/>
    <SBMLMap SBMLid="s22" COPASIkey="Metabolite_41"/>
    <SBMLMap SBMLid="s23" COPASIkey="Metabolite_43"/>
    <SBMLMap SBMLid="s24" COPASIkey="Metabolite_45"/>
    <SBMLMap SBMLid="s25" COPASIkey="Metabolite_47"/>
    <SBMLMap SBMLid="s3" COPASIkey="Metabolite_5"/>
    <SBMLMap SBMLid="s4" COPASIkey="Metabolite_7"/>
    <SBMLMap SBMLid="s5" COPASIkey="Metabolite_9"/>
    <SBMLMap SBMLid="s6" COPASIkey="Metabolite_11"/>
    <SBMLMap SBMLid="s7" COPASIkey="Metabolite_13"/>
    <SBMLMap SBMLid="s8" COPASIkey="Metabolite_15"/>
    <SBMLMap SBMLid="s9" COPASIkey="Metabolite_17"/>
  </SBMLReference>
</COPASI>
