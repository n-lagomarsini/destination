/*
 *    GeoTools - The Open Source Java GIS Toolkit
 *    http://geotools.org
 *
 *    (C) 2002-2011, Open Source Geospatial Foundation (OSGeo)
 *
 *    This library is free software; you can redistribute it and/or
 *    modify it under the terms of the GNU Lesser General Public
 *    License as published by the Free Software Foundation;
 *    version 2.1 of the License.
 *
 *    This library is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *    Lesser General Public License for more details.
 */
package it.geosolutions.geobatch.destination.action;

import it.geosolutions.geobatch.destination.ingestion.ArcsIngestionProcess;
import it.geosolutions.geobatch.destination.ingestion.MetadataIngestionHandler;
import it.geosolutions.geobatch.destination.streetuser.StreetUserComputation;
import it.geosolutions.geobatch.destination.vulnerability.TargetManager.TargetInfo;
import it.geosolutions.geobatch.destination.vulnerability.VulnerabilityComputation;
import it.geosolutions.geobatch.flow.event.ProgressListenerForwarder;

import java.awt.image.RenderedImage;
import java.io.IOException;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ConcurrentSkipListSet;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import javax.media.jai.JAI;
import javax.media.jai.PlanarImage;

import org.geotools.data.DataStoreFinder;
import org.geotools.jdbc.JDBCDataStore;
import org.geotools.resources.image.ImageUtilities;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @author "Mauro Bartolomeoli - mauro.bartolomeoli@geo-solutions.it"
 * 
 */
public class RoadRunner {

    private static final Logger LOGGER = LoggerFactory.getLogger(RoadRunner.class);

    private static final long TIMEOUT = 30;

    private static CountDownLatch latch;

    public static void main(String[] args) {
        Map<String, Serializable> datastoreParams = new HashMap<String, Serializable>();
        datastoreParams.put("port", 5432);
        datastoreParams.put("schema", "siig_p");
        datastoreParams.put("passwd", "siig_p");
        datastoreParams.put("dbtype", "postgis");
        datastoreParams.put("host", "192.168.1.31");
        datastoreParams.put("Expose primary keys", "true");
        datastoreParams.put("user", "siig_p");
        datastoreParams.put("database", "destination_staging");

        JDBCDataStore dataStore = null;
        MetadataIngestionHandler metadataHandler = null;
        try {

            // String inputFeature = "RL_C_Grafo_20130918";
            // String inputFeature = "AO_C_Grafo_20130704";
            String inputFeature = "RL_C_Grafo_20131126";

            dataStore = (JDBCDataStore) DataStoreFinder.getDataStore(datastoreParams);
            metadataHandler = new MetadataIngestionHandler(dataStore);
            /*
             * OriginalArcsIngestionProcess arcIngestion = new OriginalArcsIngestionProcess(inputFeature, new ProgressListenerForwarder(null),
             * metadataHandler, dataStore, -1, -1); arcIngestion.importArcs(null, false);
             */
            ArcsIngestionProcess arcIngestion = new ArcsIngestionProcess(inputFeature,
                    new ProgressListenerForwarder(null), metadataHandler, dataStore);

            // arcIngestion.importArcs(null, 1, false, false, true, null);

            /*
             * arcIngestion.importArcs(null, 2, false, false, null); arcIngestion.importArcs(null, 3, false, false, null);
             * arcIngestion.importArcs(null, 3, true, false, "A");
             * 
             * // Spalmatore ZeroRemovalComputation zeroComputation = new ZeroRemovalComputation( inputFeature, new ProgressListenerForwarder(null),
             * metadataHandler, dataStore);
             * 
             * 
             * zeroComputation.removeZeros(null, 1, null); zeroComputation.removeZeros(null, 2, null); zeroComputation.removeZeros(null, 3, null);
             */

            JAI.getDefaultInstance().getTileCache().setMemoryCapacity(512 * 1024 * 1024);

            VulnerabilityComputation vulnerability1 = new VulnerabilityComputation(inputFeature,
                    new ProgressListenerForwarder(null), metadataHandler, dataStore);

            VulnerabilityComputation vulnerability2 = new VulnerabilityComputation(inputFeature,
                    new ProgressListenerForwarder(null), metadataHandler, dataStore);

            VulnerabilityComputation vulnerability3 = new VulnerabilityComputation(inputFeature,
                    new ProgressListenerForwarder(null), metadataHandler, dataStore);

            VulnerabilityComputation vulnerability4 = new VulnerabilityComputation(inputFeature,
                    new ProgressListenerForwarder(null), metadataHandler, dataStore);

            // vulnerability.computeVulnerability(null, 1, "INSERT", null, true);
            // vulnerability.computeVulnerability(null, 1, "PURGE_INSERT", null);

            Map<Integer, TargetInfo> bandPerTargetH = new TreeMap<Integer, TargetInfo>();
            Map<Integer, TargetInfo> bandPerTargetNH = new TreeMap<Integer, TargetInfo>();
            // Calculation of the input Rasters
            RenderedImage[] images = vulnerability1.rasterCalculation(bandPerTargetH,
                    bandPerTargetNH);
            // Launch of multiple vulnerability computation inside threads
            // vulnerability.computeVulnerability(null, 2, "PURGE_INSERT", null, false, null, null,
            // null, null, null);
            int threadMaxNumber = 4;
            ThreadPoolExecutor executor = new ThreadPoolExecutor(threadMaxNumber, threadMaxNumber,
                    60, TimeUnit.SECONDS, new ArrayBlockingQueue<Runnable>(1000000));

            ConcurrentSkipListSet<BigDecimal> set = new ConcurrentSkipListSet<BigDecimal>();

            // NOT HUMAN TARGETS
            int minTileX = images[1].getMinTileX();
            int minTileY = images[1].getMinTileY();

            int maxTileX = minTileX + images[1].getNumXTiles();
            int maxTileY = minTileY + images[1].getNumYTiles();

            int calcWidth = images[1].getNumXTiles() / 2;
            int calcHeight = images[1].getNumYTiles() / 2;

            int aggregationLevel = 2;
            String writeMode = "PURGE_INSERT";
            String targetID = "NotHuman";

            MyRunnable run1 = new MyRunnable(vulnerability1, aggregationLevel, writeMode, null,
                    images[1], bandPerTargetNH, set, targetID, minTileX,
                    minTileX + calcWidth, minTileY, minTileY + calcHeight, null, null, false, null,
                    null, null);

            MyRunnable run2 = new MyRunnable(vulnerability2, aggregationLevel, writeMode, null,
                    images[1], bandPerTargetNH, set, targetID, minTileX + calcWidth + 1,
                    maxTileX, minTileY, minTileY + calcHeight, null, null, false, null, null, null);

            MyRunnable run3 = new MyRunnable(vulnerability3, aggregationLevel, writeMode, null,
                    images[1], bandPerTargetNH, set, targetID, minTileX,
                    minTileX + calcWidth, minTileY + calcHeight + 1, maxTileY, null, null, false,
                    null, null, null);

            MyRunnable run4 = new MyRunnable(vulnerability4, aggregationLevel, writeMode, null,
                    images[1], bandPerTargetNH, set, targetID, minTileX + calcWidth + 1,
                    maxTileX, minTileY + calcHeight + 1, maxTileY, null, null, false, null, null,
                    null);           


            latch = new CountDownLatch(threadMaxNumber);

            executor.execute(run1);
            executor.execute(run2);
            executor.execute(run3);
            executor.execute(run4);

            latch.await();

            executor.shutdown();

            executor.awaitTermination(TIMEOUT, TimeUnit.SECONDS);
            
            // Image Disposal
            ImageUtilities.disposePlanarImageChain(PlanarImage.wrapRenderedImage(images[1]));
            
            // HUMAN TARGETS
            
            set.clear();
            
            executor = new ThreadPoolExecutor(threadMaxNumber, threadMaxNumber,
                    60, TimeUnit.SECONDS, new ArrayBlockingQueue<Runnable>(1000000));
            
            targetID = "Human";
            run1 = new MyRunnable(vulnerability1, aggregationLevel, writeMode, null, images[0],
                    bandPerTargetH, set, targetID, minTileX, minTileX + calcWidth, minTileY,
                    minTileY + calcHeight, null, null, false, null, null, null);

            run2 = new MyRunnable(vulnerability2, aggregationLevel, writeMode, null, images[0],
                    bandPerTargetH, set, targetID, minTileX + calcWidth + 1, maxTileX, minTileY,
                    minTileY + calcHeight, null, null, false, null, null, null);

            run3 = new MyRunnable(vulnerability3, aggregationLevel, writeMode, null, images[0],
                    bandPerTargetH, set, targetID, minTileX, minTileX + calcWidth, minTileY
                            + calcHeight + 1, maxTileY, null, null, false, null, null, null);

            run4 = new MyRunnable(vulnerability4, aggregationLevel, writeMode, null, images[0],
                    bandPerTargetH, set, targetID, minTileX + calcWidth + 1, maxTileX, minTileY
                            + calcHeight + 1, maxTileY, null, null, false, null, null, null);

            latch = new CountDownLatch(threadMaxNumber);

            executor.execute(run1);
            executor.execute(run2);
            executor.execute(run3);
            executor.execute(run4);

            latch.await();

            executor.shutdown();

            executor.awaitTermination(TIMEOUT, TimeUnit.SECONDS);

            // Image Disposal
            ImageUtilities.disposePlanarImageChain(PlanarImage.wrapRenderedImage(images[0]));
            
            // Datastore disposal
            if(dataStore!=null){
                dataStore.dispose();
            }
            
            // vulnerability.computeVulnerability(null, 3, "PURGE_INSERT", null, false);
            /*
             * RiskComputation riskComputation = new RiskComputation( inputFeature, new ProgressListenerForwarder(null), metadataHandler, dataStore);
             * 
             * 
             * 
             * riskComputation.prefetchRiskAtLevel(3, 1, 1, 26, 100, "1,2,3,4,5,6,7,8,9,10", "1,2,3,4,5,6,7,8,9,10,11", "0,1", "1,2,3,4,5",
             * "fp_scen_centrale", "PURGE_INSERT", null); riskComputation.prefetchRiskAtLevel(3, 2, 1, 26, 100, "1,2,3,4,5,6,7,8,9,10",
             * "1,2,3,4,5,6,7,8,9,10,11", "0,1", "1,2,3,4,5", "fp_scen_centrale", "PURGE_INSERT", null); riskComputation.prefetchRiskAtLevel(3, 3, 1,
             * 29, 100, "1,2,3,4,5,6,7,8,9,10", "1,2,3,4,5,6,7,8,9,10,11", "0,1", "1,2,3,4,5", "fp_scen_centrale", "PURGE_INSERT", "B");
             */

            StreetUserComputation streetUserComputation = new StreetUserComputation(inputFeature,
                    new ProgressListenerForwarder(null), metadataHandler, dataStore);

            /*
             * streetUserComputation.execute(1); streetUserComputation.execute(2); streetUserComputation.execute(3);
             */
        } catch (Exception e) {
            LOGGER.error(e.getMessage());
        } finally {
            if (metadataHandler != null) {
                metadataHandler.dispose();
            }

            if (dataStore != null) {
                dataStore.dispose();
            }
        }

    }

    static class MyRunnable implements Runnable {

        private VulnerabilityComputation vln;

        private int aggregationLevel;

        private String writeMode;

        private String closePhase;

        private RenderedImage currentImage;

        private Map<Integer, TargetInfo> currentBPT;

        private ConcurrentSkipListSet<BigDecimal> keySet;

        private String targetID;

        private int minTileX;

        private int maxTileX;

        private int minTileY;

        private int maxTileY;

        private String cellStart;

        private String cellStop;

        private boolean skipArcs;

        private Integer xStart;

        private Integer yStart;

        private String idStart;

        public MyRunnable(VulnerabilityComputation vln, int aggregationLevel, String writeMode,
                String closePhase, RenderedImage currentImage, Map<Integer, TargetInfo> currentBPT,
                ConcurrentSkipListSet<BigDecimal> keySet, String targetID, int minTileX,
                int maxTileX, int minTileY, int maxTileY, String cellStart, String cellStop,
                boolean skipArcs, Integer xStart, Integer yStart, String idStart) {
            this.vln = vln;
            this.aggregationLevel = aggregationLevel;
            this.writeMode = writeMode;
            this.closePhase = closePhase;
            this.currentImage = currentImage;
            this.currentBPT = currentBPT;
            this.keySet = keySet;
            this.targetID = targetID;
            this.minTileX = minTileX;
            this.maxTileX = maxTileX;
            this.minTileY = minTileY;
            this.maxTileY = maxTileY;
            this.cellStart = cellStart;
            this.cellStop = cellStop;
            this.skipArcs = skipArcs;
            this.xStart = xStart;
            this.yStart = yStart;
            this.idStart = idStart;
        }

        @Override
        public void run() {
            try {
                vln.computeVulnerability(null, aggregationLevel, writeMode, closePhase,
                        currentImage, currentBPT, keySet, targetID, minTileX, maxTileX, minTileY,
                        maxTileY, cellStart, cellStop, skipArcs, xStart, yStart, idStart);
            } catch (IOException e) {
                LOGGER.error("Error Calculating Vulnerability from tile (" + minTileX + ","
                        + minTileY + ") and (" + maxTileX + "," + maxTileY + ")");
            }

            latch.countDown();
        }

    }

}
