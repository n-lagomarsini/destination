package it.geosolutions.peoplecalculator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class InputData {
	
	static final Logger logger = LoggerFactory.getLogger(ShpProcessor.class);

	private String pointShp;
	private String inputField;
	private String areaShp;
	private String outputFeild;
	private String outputDir;
	private Integer maxDsitance = Constant.DEFAULT_DISTANCE;
	private String attrField = Constant.DEFAULT_OUTPUT_ATTRIBUTION_REL;

    public InputData(String areaShp, String pointShp, String inputField,
			String outputFeild, String outputDir, Integer maxDsitance,
			String attrField) {
		super();
		this.areaShp = areaShp;
		this.pointShp = pointShp;
		this.inputField = inputField;
		this.outputFeild = outputFeild;
		this.outputDir = outputDir;
		if(maxDsitance != null){
			this.maxDsitance = maxDsitance;
		}
		if(attrField !=null){
		    this.attrField = attrField;
		}
	}	
	
	public String getOutputDir() {
		return outputDir;
	}
	
	public String getPointShp() {
		return pointShp;
	}

	public String getInputField() {
		return inputField;
	}

	public String getAreaShp() {
		return areaShp;
	}

	public String getOutputFeild() {
		return outputFeild;
	}

	public Integer getMaxDsitance() {
		return maxDsitance;
	}

        public String getAttrField() {
            return attrField;
        }
    
        public void setAttrField(String attrField) {
            this.attrField = attrField;
        }
}
