#Infrastructure for Card Application

##Hva Inneholder Infrastructuren.
- Hvordan sette secrets for statuscake, LogzIo og OpsGenie.
- Infrastructur for applikasjonen, her ved bruk av terraform.
- Kort om hvordan ting henger sammen og er satt opp.


####Infrastructuren bygget av terraform.
- Her kan en endre konfigurasjonen til å passe egne behov.
    - Det er vedlagt Oppsett for statuscake, logzio og Opsgenie, samt hvordan disse hemmeloghetene settes.
    - Minne for containeren har blitt satt til 512, dette kan en selv velge å justere.
    - Alt av terraform kan endres til å passe eget behov. En må endre gcp prosjekt til 
    sitt eget med riktig id for å kunne benytte seg av denne ferdigoppsatte infrastrukturen.
    
- OpsGenie er en annen form for å sette opp varsling av problemer med deoplyert kode, 
    fungerer på mange måter likt som statuscake, Denne kan konfigureres i terraform koden etter en har laget en bruker 
    og lagt inn api nøkkel. Her kan en i infrastructur koden legge til teams, medlemmer og deres epost og brukernavn 
    og lage teams for varsling rett fra terraform. I denne løsningen ligger det kun ved eksempel av hvordan dette kan se ut.

###How to set travis secrets
#### Statuscake secret.
- Create an account at: https://app.statuscake.com
- Find your own statuscake api key.
- Encrypt this in your infrastructure with the following command.
- ````travis encrypt STATUSCAKE_APIKEY=<YOUR API KEY> --add --pro````

####OpsGenie Secret.
- Create an account at https://www.atlassian.com/software/opsgenie
- Go to settings and create your own api key here.
- Encrypt this in your infrastructure with the following command.
- ``travis encrypt OPSGENIE_API_KEY=YOUR API KEY --add --pro ``

####Logz io Secrets
- Create an account at: https://app.logz.io/
- Go under ``send your data -> libraries -> JAVA - logback appender`` 
    and find your own logz token and the logz url
- Encrypt the token with: ```travis encrypt LOGZ_TOKEN=YOUR TOKEN```
- Encrypt the URL with: ``travis encrypt LOGZ_URL= YOUR LOGZI OURL``
