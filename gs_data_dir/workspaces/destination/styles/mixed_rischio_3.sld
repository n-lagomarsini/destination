<?xml version="1.0" encoding="ISO-8859-1"?>
<StyledLayerDescriptor version="1.0.0" xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.0.0/StyledLayerDescriptor.xsd">
  <NamedLayer>
    <Name>risk</Name>
    <UserStyle>
      <Title>risk</Title>
      <Abstract>risk</Abstract>
      <FeatureTypeStyle>
        <Transformation>
            <ogc:Function name="gs:RiskCalculator">
              <ogc:Function name="parameter">
                <ogc:Literal>features</ogc:Literal>
              </ogc:Function>
              <ogc:Function name="parameter">
                <ogc:Literal>store</ogc:Literal>
                <ogc:Literal>destination</ogc:Literal>
              </ogc:Function>
              
              <ogc:Function name="parameter">
                <ogc:Literal>formula</ogc:Literal>
                <ogc:Function name="env">
                   <ogc:Literal>formula</ogc:Literal>
                   <ogc:Literal>16</ogc:Literal>
                </ogc:Function>
              </ogc:Function>
              <ogc:Function name="parameter">
                <ogc:Literal>target</ogc:Literal>
                <ogc:Function name="env">
                  <ogc:Literal>target</ogc:Literal>
                  <ogc:Literal>0</ogc:Literal>
                </ogc:Function>
              </ogc:Function>
              <ogc:Function name="parameter">
                <ogc:Literal>materials</ogc:Literal>
                <ogc:Function name="env">
                   <ogc:Literal>materials</ogc:Literal>
                   <ogc:Literal>1,4</ogc:Literal>
                </ogc:Function>
              </ogc:Function>
              <ogc:Function name="parameter">
                <ogc:Literal>scenarios</ogc:Literal>
                <ogc:Function name="env">
                   <ogc:Literal>scenarios</ogc:Literal>
                   <ogc:Literal>4,5</ogc:Literal>
                </ogc:Function>
              </ogc:Function>
              <ogc:Function name="parameter">
                <ogc:Literal>entities</ogc:Literal>
                <ogc:Function name="env">
                  <ogc:Literal>entities</ogc:Literal>
                  <ogc:Literal>0,1</ogc:Literal>
                </ogc:Function>
              </ogc:Function>
             <ogc:Function name="parameter">
                <ogc:Literal>severeness</ogc:Literal>
                <ogc:Function name="env">
                   <ogc:Literal>severeness</ogc:Literal>
                   <ogc:Literal>1,2,3,4,5</ogc:Literal>
                </ogc:Function>
              </ogc:Function>
              <ogc:Function name="parameter">
                <ogc:Literal>fp</ogc:Literal>
                <ogc:Function name="env">
                  <ogc:Literal>fp</ogc:Literal>
                  <ogc:Literal>fp_scen_centrale</ogc:Literal>
                </ogc:Function>
              </ogc:Function>
              <ogc:Function name="parameter">
                <ogc:Literal>processing</ogc:Literal>
                <ogc:Function name="env">
                  <ogc:Literal>processing</ogc:Literal>
                  <ogc:Literal>1</ogc:Literal>
                </ogc:Function>
              </ogc:Function>
              <ogc:Function name="parameter">
                <ogc:Literal>pis</ogc:Literal>
                <ogc:Function name="env">
                  <ogc:Literal>pis</ogc:Literal>
                  <ogc:Literal></ogc:Literal>
                </ogc:Function>
              </ogc:Function>
               <ogc:Function name="parameter">
                <ogc:Literal>padr</ogc:Literal>
                <ogc:Function name="env">
                  <ogc:Literal>padr</ogc:Literal>
                  <ogc:Literal></ogc:Literal>
                </ogc:Function>
              </ogc:Function>
               <ogc:Function name="parameter">
                <ogc:Literal>cff</ogc:Literal>
                <ogc:Function name="env">
                  <ogc:Literal>cff</ogc:Literal>
                  <ogc:Literal></ogc:Literal>
                </ogc:Function>
              </ogc:Function>
              <ogc:Function name="parameter">
                <ogc:Literal>changedTargets</ogc:Literal>
                <ogc:Function name="env">
                  <ogc:Literal>changedTargets</ogc:Literal>
                  <ogc:Literal></ogc:Literal>
                </ogc:Function>
              </ogc:Function>
              <ogc:Function name="parameter">
                <ogc:Literal>distances</ogc:Literal>
                <ogc:Function name="env">
                  <ogc:Literal>distances</ogc:Literal>
                  <ogc:Literal></ogc:Literal>
                </ogc:Function>
              </ogc:Function>
              <ogc:Function name="parameter">
                <ogc:Literal>damageArea</ogc:Literal>
                <ogc:Function name="env">
                  <ogc:Literal>damageArea</ogc:Literal>
                  <ogc:Literal></ogc:Literal>
                </ogc:Function>
              </ogc:Function>
            </ogc:Function>
          </Transformation>
   <Rule>
    <Title>Basso Rischio-Basso Rischio
    <Localized lang="it">Basso Rischio-Basso Rischio</Localized>
      <Localized lang="en">Low Risk-Low Risk</Localized>
      <Localized lang="fr">Basso Rischio-Basso Rischio</Localized>
      <Localized lang="de">Basso Risiko-Niedriges Risiko</Localized>
  </Title>
    <Abstract>Basso Rischio-Basso Rischio</Abstract>
   <ogc:Filter>
     <ogc:And>
        <ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyName>rischio1</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>lowsociale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyName>rischio2</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>lowambientale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsLessThanOrEqualTo>
     </ogc:And>
   </ogc:Filter>
     <MinScaleDenominator>500000</MinScaleDenominator>
   <PolygonSymbolizer>
   <Fill>
     <CssParameter name="fill">#14F200</CssParameter>
     <CssParameter name="fill-opacity">0.7</CssParameter>
    </Fill>
   </PolygonSymbolizer>
   </Rule>
   <Rule>
    <Title>Basso Rischio-Medio Rischio
    <Localized lang="it">Basso Rischio-Medio Rischio</Localized>
      <Localized lang="en">Low Risk-Medium Risk</Localized>
      <Localized lang="fr">Basso Rischio-Medio Rischio</Localized>
      <Localized lang="de">Niedriges Risiko-Mittleres Risiko</Localized>
  </Title>
    <Abstract>Basso Rischio-Medio Rischio</Abstract>
   <ogc:Filter>
     <ogc:And>
        <ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyName>rischio1</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>lowsociale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyName>rischio2</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>mediumambientale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyName>rischio2</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>lowambientale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsGreaterThanOrEqualTo>
     </ogc:And>
   </ogc:Filter>
     <MinScaleDenominator>500000</MinScaleDenominator>
   <PolygonSymbolizer>
   <Fill>
     <CssParameter name="fill">#0A7900</CssParameter>
     <CssParameter name="fill-opacity">0.7</CssParameter>
    </Fill>
   </PolygonSymbolizer>
   </Rule>
   <Rule>
    <Title>Basso Rischio-Alto Rischio
    <Localized lang="it">Basso Rischio-Alto Rischio</Localized>
      <Localized lang="en">Low Risk-High Risk</Localized>
      <Localized lang="fr">Basso Rischio-Alto Rischio</Localized>
      <Localized lang="de">Niedriges Risiko-Hohes Risiko</Localized>  
  </Title>
    <Abstract>Basso Rischio-Alto Rischio</Abstract>
   <ogc:Filter>
     <ogc:And>
        <ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyName>rischio1</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>lowsociale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyName>rischio2</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>mediumambientale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsGreaterThanOrEqualTo>
     </ogc:And>
   </ogc:Filter>
     <MinScaleDenominator>500000</MinScaleDenominator>
   <PolygonSymbolizer>
   <Fill>
     <CssParameter name="fill">#053800</CssParameter>
     <CssParameter name="fill-opacity">0.7</CssParameter>
    </Fill>
   </PolygonSymbolizer>
   </Rule>
   <Rule>
    <Title>Medio Rischio-Basso Rischio
    <Localized lang="it">Medio Rischio-Basso Rischio</Localized>
      <Localized lang="en">Medium Risk-Low Risk</Localized>
      <Localized lang="fr">Medio Rischio-Basso Rischio</Localized>
      <Localized lang="de">Mittleres Risiko-Niedriges Risiko</Localized>    
  </Title>
    <Abstract>Medio Rischio-Basso Rischio</Abstract>
   <ogc:Filter>
     <ogc:And>
        <ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyName>rischio1</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>mediumsociale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyName>rischio1</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>lowsociale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyName>rischio2</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>lowambientale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsLessThanOrEqualTo>
     </ogc:And>
   </ogc:Filter>
     <MinScaleDenominator>500000</MinScaleDenominator>
   <PolygonSymbolizer>
   <Fill>
     <CssParameter name="fill">#A5FB00</CssParameter>
     <CssParameter name="fill-opacity">0.7</CssParameter>
    </Fill>
   </PolygonSymbolizer>
   </Rule>
   <Rule>
    <Title>Medio Rischio-Medio Rischio
    <Localized lang="it">Medio Rischio-Medio Rischio</Localized>
      <Localized lang="en">Medium Risk-Medium Risk</Localized>
      <Localized lang="fr">Medio Rischio-Medio Rischio</Localized>
      <Localized lang="de">Medio Risiko-Mittleres Risiko</Localized>    
  </Title>
    <Abstract>Medio Rischio-Medio Rischio</Abstract>
   <ogc:Filter>
     <ogc:And>
        <ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyName>rischio1</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>mediumsociale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyName>rischio1</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>lowsociale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyName>rischio2</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>mediumambientale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyName>rischio2</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>lowambientale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsGreaterThanOrEqualTo>
     </ogc:And>
   </ogc:Filter>
     <MinScaleDenominator>500000</MinScaleDenominator>
   <PolygonSymbolizer>
   <Fill>
     <CssParameter name="fill">#FFFB00</CssParameter>
     <CssParameter name="fill-opacity">0.7</CssParameter>
    </Fill>
   </PolygonSymbolizer>
   </Rule>
   <Rule>
    <Title>Medio Rischio-Alto Rischio
    <Localized lang="it">Medio Rischio-Alto Rischio</Localized>
      <Localized lang="en">Medium Risk-High Risk</Localized>
      <Localized lang="fr">Medio Rischio-Alto Rischio</Localized>
      <Localized lang="de">Mittleres Risiko-Hohes Risiko</Localized>  
  </Title>
    <Abstract>Medio Rischio-Alto Rischio</Abstract>
   <ogc:Filter>
     <ogc:And>
        <ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyName>rischio1</ogc:PropertyName>>
          <ogc:Function name="env">
            <ogc:Literal>mediumsociale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyName>rischio1</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>lowsociale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyName>rischio2</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>mediumambientale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsGreaterThanOrEqualTo>
     </ogc:And>
   </ogc:Filter>
     <MinScaleDenominator>500000</MinScaleDenominator>
   <PolygonSymbolizer>
   <Fill>
     <CssParameter name="fill">#FF9800</CssParameter>
     <CssParameter name="fill-opacity">0.7</CssParameter>
    </Fill>
   </PolygonSymbolizer>
   </Rule>
   <Rule>
    <Title>Alto Rischio-Basso Rischio
    <Localized lang="it">Alto Rischio-Basso Rischio</Localized>
      <Localized lang="en">High Risk-Low Risk</Localized>
      <Localized lang="fr">Alto Rischio-Basso Rischio</Localized>
      <Localized lang="de">Hohes Risiko-Niedriges Risiko</Localized>
  </Title>
    <Abstract>Alto Rischio-Basso Rischio</Abstract>
   <ogc:Filter>
     <ogc:And>
        <ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyName>rischio1</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>mediumsociale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyName>rischio2</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>lowambientale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsLessThanOrEqualTo>
     </ogc:And>
   </ogc:Filter>
     <MinScaleDenominator>500000</MinScaleDenominator>
   <PolygonSymbolizer>
   <Fill>
     <CssParameter name="fill">#FFB4B4</CssParameter>
     <CssParameter name="fill-opacity">0.7</CssParameter>
    </Fill>
   </PolygonSymbolizer>
   </Rule>
   <Rule>
    <Title>Alto Rischio-Medio Rischio
    <Localized lang="it">Alto Rischio-Medio Rischio</Localized>
      <Localized lang="en">High Risk-Medium Risk</Localized>
      <Localized lang="fr">Alto Rischio-Medio Rischio</Localized>
      <Localized lang="de">Hohes Risiko-Mittleres Risiko</Localized>  
  </Title>
    <Abstract>Alto Rischio-Medio Rischio</Abstract>
   <ogc:Filter>
     <ogc:And>
        <ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyName>rischio1</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>mediumsociale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyName>rischio2</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>mediumambientale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyName>rischio2</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>lowambientale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsGreaterThanOrEqualTo>
     </ogc:And>
   </ogc:Filter>
     <MinScaleDenominator>500000</MinScaleDenominator>
   <PolygonSymbolizer>
   <Fill>
     <CssParameter name="fill">#FF6A6A</CssParameter>
     <CssParameter name="fill-opacity">0.7</CssParameter>
    </Fill>
   </PolygonSymbolizer>
   </Rule>
   <Rule>
    <Title>Alto Rischio-Alto Rischio
    <Localized lang="it">Alto Rischio-Alto Rischio</Localized>
      <Localized lang="en">High Risk-High Risk</Localized>
      <Localized lang="fr">Alto Rischio-Alto Rischio</Localized>
      <Localized lang="de">Alto Risiko-Hohes Risiko</Localized>  
  </Title>
    <Abstract>Alto Rischio-Alto Rischio</Abstract>
   <ogc:Filter>
     <ogc:And>
        <ogc:PropertyIsGreaterThanOrEqualTo>
       <ogc:PropertyName>rischio1</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>mediumsociale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyName>rischio2</ogc:PropertyName>
          <ogc:Function name="env">
            <ogc:Literal>mediumambientale</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsGreaterThanOrEqualTo>
     </ogc:And>
   </ogc:Filter>
     <MinScaleDenominator>500000</MinScaleDenominator>
   <PolygonSymbolizer>
   <Fill>
     <CssParameter name="fill">#FF0000</CssParameter>
     <CssParameter name="fill-opacity">0.7</CssParameter>
    </Fill>
   </PolygonSymbolizer>
   </Rule>
      </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>