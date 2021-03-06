<?xml version="1.0" encoding="ISO-8859-1"?>
<StyledLayerDescriptor version="1.0.0" xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc"
  xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.0.0/StyledLayerDescriptor.xsd">
  <NamedLayer>
    <Name>Default Line</Name>
    <UserStyle>
      <Title>1 px blue line</Title>
      <Abstract>Default line style, 1 pixel wide blue</Abstract>

      <FeatureTypeStyle>
        <Rule>
          <Title>Basso Rischio (0-100)</Title>
          <Abstract>Linea per Basso Rischio Incidentale</Abstract>
          <ogc:Filter>
              <ogc:PropertyIsLessThanOrEqualTo>
                   <ogc:Function name="round">
                     <ogc:Div>
                       <ogc:PropertyName>calc_formula_tot</ogc:PropertyName>
                       <ogc:PropertyName>lunghezza</ogc:PropertyName>
                     </ogc:Div>             
                   </ogc:Function>
                   <ogc:Literal>100</ogc:Literal>
              </ogc:PropertyIsLessThanOrEqualTo>
          </ogc:Filter>
          <MinScaleDenominator>272989</MinScaleDenominator>
          <MaxScaleDenominator>2183920</MaxScaleDenominator>
          <LineSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
            <Stroke>
              <CssParameter name="stroke">#14F200</CssParameter>
              <CssParameter name="stroke-width">14</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>

        <Rule>
          <Title>Medio Rischio (100-500)</Title>
          <Abstract>Linea per Medio Rischio Incidentale</Abstract>
          <ogc:Filter>
              <ogc:And>
                <ogc:PropertyIsLessThanOrEqualTo>
                   <ogc:Function name="round">
                     <ogc:Div>
                       <ogc:PropertyName>calc_formula_tot</ogc:PropertyName>
                       <ogc:PropertyName>lunghezza</ogc:PropertyName>
                     </ogc:Div>             
                   </ogc:Function>
                   <ogc:Literal>500</ogc:Literal>
                </ogc:PropertyIsLessThanOrEqualTo>
                <ogc:PropertyIsGreaterThanOrEqualTo>
                   <ogc:Function name="round">
                     <ogc:Div>
                       <ogc:PropertyName>calc_formula_tot</ogc:PropertyName>
                       <ogc:PropertyName>lunghezza</ogc:PropertyName>
                     </ogc:Div>             
                   </ogc:Function>
                   <ogc:Literal>101</ogc:Literal>
                </ogc:PropertyIsGreaterThanOrEqualTo>
              </ogc:And>
          </ogc:Filter>
          <MinScaleDenominator>272989</MinScaleDenominator>
          <MaxScaleDenominator>2183920</MaxScaleDenominator>
          <LineSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
            <Stroke>
              <CssParameter name="stroke">#FFFB00</CssParameter>
              <CssParameter name="stroke-width">16</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
        
        
        <Rule>
          <Title>Alto Rischio (&gt; 500)</Title>
          <Abstract>Linea per Alto Rischio Incidentale</Abstract>
          <ogc:Filter>
            <ogc:PropertyIsGreaterThanOrEqualTo>
               <ogc:Function name="round">
                   <ogc:Div>
                     <ogc:PropertyName>calc_formula_tot</ogc:PropertyName>
                     <ogc:PropertyName>lunghezza</ogc:PropertyName>
                   </ogc:Div>             
                 </ogc:Function>
               <ogc:Literal>501</ogc:Literal>
            </ogc:PropertyIsGreaterThanOrEqualTo>
          </ogc:Filter>
          <MinScaleDenominator>272989</MinScaleDenominator>
          <MaxScaleDenominator>2183920</MaxScaleDenominator>
          <LineSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
            <Stroke>
              <CssParameter name="stroke">#FF0000</CssParameter>
              <CssParameter name="stroke-width">18</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
        
      </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>