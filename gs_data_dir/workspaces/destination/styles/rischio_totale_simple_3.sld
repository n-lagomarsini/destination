<?xml version="1.0" encoding="ISO-8859-1"?>
<StyledLayerDescriptor version="1.0.0" xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.0.0/StyledLayerDescriptor.xsd">
  <NamedLayer>
    <Name>risk</Name>
    <UserStyle>
      <Title>risk</Title>
      <Abstract>risk</Abstract>
      <FeatureTypeStyle>
   <Rule>
    <Title>Basso Rischio
      <Localized lang="it">Basso Rischio</Localized>
      <Localized lang="en">Low Risk</Localized>
      <Localized lang="fr">Basso Rischio</Localized>
      <Localized lang="de">Basso Rischio</Localized>
    </Title>
    <Abstract>Basso Rischio</Abstract>
   <ogc:Filter>
        <ogc:PropertyIsLessThanOrEqualTo>
        <ogc:Function name="round">
        <ogc:PropertyName>rischio</ogc:PropertyName>
        </ogc:Function>
          <ogc:Function name="env">
            <ogc:Literal>low</ogc:Literal>
            <ogc:Literal>100</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyIsLessThanOrEqualTo>
        <ogc:Function name="round">
        <ogc:PropertyName>rischio</ogc:PropertyName>
        </ogc:Function>
          <ogc:Function name="env">
            <ogc:Literal>low</ogc:Literal>
            <ogc:Literal>100</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsLessThanOrEqualTo>
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
    <Title>Medio Rischio
      <Localized lang="it">Medio Rischio</Localized>
      <Localized lang="en">Medium Risk</Localized>
      <Localized lang="fr">Medio Rischio</Localized>
      <Localized lang="de">Medio Rischio</Localized>
    </Title>
    <Abstract>Medio Rischio</Abstract>
   <ogc:Filter>
     <ogc:And>
        <ogc:PropertyIsLessThanOrEqualTo>
        <ogc:Function name="round">
        <ogc:PropertyName>rischio</ogc:PropertyName>
        </ogc:Function>
          <ogc:Function name="env">
            <ogc:Literal>medium</ogc:Literal>
            <ogc:Literal>500</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:Function name="round">
        <ogc:PropertyName>rischio</ogc:PropertyName>
        </ogc:Function>
          <ogc:Function name="env">
            <ogc:Literal>low</ogc:Literal>
            <ogc:Literal>100</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyIsLessThanOrEqualTo>
        <ogc:Function name="round">
        <ogc:PropertyName>rischio</ogc:PropertyName>
        </ogc:Function>
          <ogc:Function name="env">
            <ogc:Literal>medium</ogc:Literal>
            <ogc:Literal>500</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:Function name="round">
        <ogc:PropertyName>rischio</ogc:PropertyName>
        </ogc:Function>
          <ogc:Function name="env">
            <ogc:Literal>low</ogc:Literal>
            <ogc:Literal>100</ogc:Literal>
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
    <Title>Alto Rischio
      <Localized lang="it">Alto Rischio</Localized>
      <Localized lang="en">High Risk</Localized>
      <Localized lang="fr">Alto Rischio</Localized>
      <Localized lang="de">Alto Rischio</Localized>
    </Title>
    <Abstract>Alto Rischio</Abstract>
   <ogc:Filter>
        <ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:Function name="round">
        <ogc:PropertyName>rischio</ogc:PropertyName>
        </ogc:Function>
          <ogc:Function name="env">
            <ogc:Literal>medium</ogc:Literal>
            <ogc:Literal>500</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:Function name="round">
        <ogc:PropertyName>rischio</ogc:PropertyName>
        </ogc:Function>
          <ogc:Function name="env">
            <ogc:Literal>medium</ogc:Literal>
            <ogc:Literal>500</ogc:Literal>
          </ogc:Function>
        </ogc:PropertyIsGreaterThanOrEqualTo>
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