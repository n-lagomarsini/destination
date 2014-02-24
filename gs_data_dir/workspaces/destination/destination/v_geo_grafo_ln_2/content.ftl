<div id="main" class="links">
    <a href="http://destination.geo-solutions.it/MapStore" target="_blank"><img src="http://destination.geo-solutions.it/MapStore/theme/app/img/BannerDestination_ftl.jpg" width="230" height="83" Hspace="10" Vspace="5"/></a>
</div>

<#assign locale = {"en":0,"it":1,"fr":2,"de":3}[request.ENV.LOCALE]/>

<#list features as feature>
<table class="featureInfo">
  <tr>

    <th class="title">${["Attribute","Attribute","Attribute","Attribut"][locale]}</th><th class="title">${["Value","Value","Value","Wert"][locale]}</th>

  </tr>

<#assign odd = false>
    <#list feature.attributes as attribute>
        <#if !attribute.isGeometry>
         <#if odd>
         <tr class="odd">
         <#else>
                <tr>
                </#if>  

                <#assign odd = !odd>
					<#if attribute.name == 'nr_incidenti'>
						<th>${["N. Incidenti","N. Incidenti","N. Incidenti","N. Incidenti"][locale]}</th><td>${attribute.value}</td> 
                    </#if>
                    <#if attribute.name == 'flg_nr_incidenti'>
						<th>${["Flag N. Incidenti","Flag N. Incidenti","Flag N. Incidenti","Flag N. Incidenti"][locale]}</th><td>${attribute.value}</td> 
                    </#if>                    
					<#if attribute.name == 'nr_corsie'>
						<th>${["N. Corsie","N. Corsie","N. Corsie","N. Corsie"][locale]}</th><td>${attribute.value}</td> 
                    </#if> 
                    <#if attribute.name == 'fl_nr_corsie'>
						<th>${["Flag N. Corsie","Flag N. Corsie","Flag N. Corsie","Flag N. Corsie"][locale]}</th><td>${attribute.value}</td> 
                    </#if> 
					<#if attribute.name == 'lunghezza'>
						<th>${["Lunghezza","Lunghezza","Lunghezza","Lunghezza"][locale]}</th><td>${attribute.value}</td> 
                    </#if>                                                             
					<#if attribute.name == 'densita_veicolare'>
						<th>${["Densità Veicolare","Densità Veicolare","Densità Veicolare","Densità Veicolare"][locale]}</th><td>${attribute.value}</td> 
                    </#if>                                                             
					<#if attribute.name == 'tipo_densita_veicolare_leggeri_pesanti_it'>
						<th>${["Tipo Densità Veicolare","Tipo Densità Veicolare","Tipo Densità Veicolare","Tipo Densità Veicolare"][locale]}</th><td>${attribute.value}</td> 
                    </#if>                                                             
					<#if attribute.name == 'velocita_media'>
						<th>${["Velocità media","Velocità media","Velocità media","Velocità media"][locale]}</th><td>${attribute.value}</td> 
                    </#if>                                                             
					<#if attribute.name == 'tipo_velocita_media_leggeri_pesanti_it'>
						<th>${["Tipo Velocità media","Tipo Velocità media","Tipo Velocità media","Tipo Velocità media"][locale]}</th><td>${attribute.value}</td> 
                    </#if>                                                             
					<#if attribute.name == 'elenco_dissesti'>
						<th>${["Elenco Dissesti","Elenco Dissesti","Elenco Dissesti","Elenco Dissesti"][locale]}</th><td>${attribute.value}</td> 
                    </#if>                                                             
									
                </tr>
        </#if>
    </#list>
	
    </tr>

</table>
<hr />
</#list>
<br/>
