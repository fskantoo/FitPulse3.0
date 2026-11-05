FITPULSE PER IPHONE

Questo progetto contiene un'app iOS nativa che carica la pagina FitPulse inclusa
nell'app. Puoi compilarla senza avere un Mac usando GitHub Actions.

COME CREARE UN IPA SENZA AVERE UN MAC

1. Crea un repository GitHub (puoi impostarlo come privato).
2. Estrai FitPulse-iOS-aggiornato.zip e carica il contenuto della cartella estratta nella
   cartella principale del repository. Includi la cartella nascosta .github.
3. Apri la scheda Actions del repository ed esegui "Build FitPulse IPA" con
   Run workflow. In alternativa, il workflow parte automaticamente quando fai
   push sul branch main o master.
4. Quando il workflow termina, apri la run e scarica l'artifact
   FitPulse-unsigned-ipa. Estrai l'artifact: contiene FitPulse-unsigned.ipa.
5. Sul PC Windows, apri l'IPA con Sideloadly, collega l'iPhone e premi Start.
   Sideloadly firmerà l'app con l'Apple ID usato per il sideload.
6. Su iPhone, se richiesto, vai in Impostazioni > Generali > VPN e gestione dispositivo
   e autorizza il profilo sviluppatore.

GitHub Actions usa un runner macOS temporaneo ospitato da GitHub, quindi non serve
un Mac fisico. Il workflow usa l'etichetta macos-15, supportata da GitHub Actions.
Il codice viene caricato sul repository che scegli: usa un repository privato se non
vuoi renderlo pubblico. Consulta i limiti del tuo piano GitHub Actions.

COME COMPILARE MANUALMENTE SU MAC

1. Apri FitPulse.xcodeproj con Xcode 15 o successivo.
2. Collega l'iPhone oppure seleziona un dispositivo iOS come destinazione.
3. Per generare un IPA non firmato, apri Terminale nella cartella FitPulse-iOS ed esegui:
   chmod +x build-unsigned-ipa.sh
   ./build-unsigned-ipa.sh

Con un account Apple gratuito la firma personale di solito scade dopo 7 giorni:
per continuare a usare l'app sarà necessario reinstallarla/fare il refresh con Sideloadly.
Un account Apple Developer a pagamento consente opzioni di distribuzione e firma diverse.
Non condividere mai password o codici Apple con altre persone.

In alternativa, per provarla direttamente dal Mac, apri FitPulse.xcodeproj in Xcode,
seleziona l'iPhone collegato, scegli il tuo Team Apple in Signing & Capabilities
e premi Run. Per esportare un IPA firmato da Xcode, usa Product > Archive e poi
Distribute App; alcune modalità di distribuzione richiedono un'iscrizione developer
e che l'UDID dell'iPhone sia registrato.

La pagina usa alcune risorse online (Tailwind, icone, font e risultati video YouTube).
La connessione Internet è necessaria per visualizzarle correttamente. I dati dell'app
restano nel dispositivo quando non è configurato Firebase. L'app include un'icona
FitPulse per la schermata Home di iPhone.

COACH IA E SCANNER DEL PIATTO

Per usare il Coach IA e lo scanner fotografico serve una chiave API Gemini personale.
Creala su https://aistudio.google.com/apikey, apri FitPulse, premi Coach IA oppure
Scan AI e scegli "Configura la chiave IA". La chiave viene salvata solo sul dispositivo
e non è inclusa nel progetto o nello ZIP. Domande, obiettivi FitPulse e foto del piatto
vengono inviati a Google Gemini per essere elaborati; verifica limiti, condizioni e costi del tuo account.
Le stime nutrizionali sono indicative e non sostituiscono il parere di un professionista.

AGGIORNARE IL PROGETTO SU GITHUB

Estrai il nuovo pacchetto, copia il contenuto della cartella FitPulse-iOS nella
cartella locale del repository esistente sovrascrivendo i file, quindi fai Commit
e Push con GitHub Desktop. Controlla in particolare che la cartella FitPulse
contenga index.html, AppAssets.xcassets, apple-touch-icon.png, icon.svg e il
manifest.webmanifest. Il push sul branch main avvia una nuova compilazione.
