# Installare FitPulse su iPhone da Windows

Questa guida usa GitHub Actions per compilare l'app su un Mac online. Non serve avere un Mac fisico. Poi Sideloadly firma l'app e la installa sull'iPhone.

## Cosa ti serve

- Un account GitHub.
- Un PC Windows con Internet.
- Un iPhone e un cavo USB.
- Il file `FitPulse-iOS.zip`.
- Il tuo Apple ID per firmare l'app con Sideloadly.

**Non rinominare lo ZIP in IPA:** non funzionerebbe. L'IPA viene creato dalla compilazione cloud.

## Parte 1 — Prepara il progetto su GitHub

1. Scarica `FitPulse-iOS.zip` sul PC.
2. Fai clic destro sullo ZIP e scegli **Estrai tutto**. Otterrai la cartella `FitPulse-iOS`.
3. Apri GitHub nel browser e accedi o crea un account.
4. Crea un nuovo repository. Dagli un nome, per esempio `FitPulse-iOS`, e seleziona **Private** per non rendere pubblico il codice. Puoi inizializzarlo con un README.
5. Installa **GitHub Desktop** dal sito ufficiale GitHub e accedi con il tuo account.
6. In GitHub Desktop scegli **File → Clone repository**, seleziona il repository appena creato e scegli una posizione sul PC.
7. Apri la cartella locale del repository. Torna nella cartella estratta `FitPulse-iOS` e copia **tutto il contenuto** dentro la cartella locale del repository, accettando l'unione delle cartelle quando richiesto.
8. Assicurati di copiare anche `.github`. Se non la vedi in Esplora file, attiva **Visualizza → Mostra → Elementi nascosti**.
9. In GitHub Desktop dovresti vedere i file modificati. Inserisci un riepilogo, per esempio `Add FitPulse iOS project`, poi seleziona **Commit to main**.
10. Premi **Push origin** per caricare i file su GitHub.

## Parte 2 — Fai creare l'IPA

1. Nel browser apri il repository GitHub che hai appena aggiornato.
2. Seleziona **Actions**. Se GitHub chiede di abilitare i workflow, conferma.
3. Nella colonna a sinistra seleziona **Build FitPulse IPA**.
4. Premi **Run workflow**, lascia selezionato il branch `main` e conferma con **Run workflow**.
5. Attendi che la compilazione finisca e che la run diventi verde. Aprila.
6. In fondo alla pagina trova **Artifacts** e scarica `FitPulse-unsigned-ipa`.
7. Estrai lo ZIP dell'artifact. Al suo interno troverai `FitPulse-unsigned.ipa`.

Se la compilazione fallisce, apri la run e leggi i passaggi in rosso nei dettagli. Non proseguire con un artifact mancante o di una compilazione fallita.

## Parte 3 — Firma e installa con Sideloadly

1. Scarica Sideloadly solo dal sito ufficiale: [sideloadly.io](https://sideloadly.io/). Installalo e avvialo su Windows.
2. Collega l'iPhone al PC con il cavo, sbloccalo e, se compare la richiesta, premi **Autorizza/Fidati**.
3. In Sideloadly seleziona il tuo iPhone.
4. Trascina `FitPulse-unsigned.ipa` nella finestra di Sideloadly, oppure selezionalo con il pulsante per scegliere un file IPA.
5. Inserisci il tuo Apple ID quando Sideloadly lo richiede e premi **Start**. Non inviare a nessuno password o codici di verifica.
6. Attendi il completamento e controlla che l'app FitPulse compaia sull'iPhone.
7. Se iOS blocca l'apertura, vai in **Impostazioni → Generali → VPN e gestione dispositivo**, scegli il profilo sviluppatore associato al tuo Apple ID e autorizzalo. I nomi dei menu possono variare leggermente in base alla versione di iOS.
8. Se iOS richiede la **Modalità sviluppatore**, attivala da **Impostazioni → Privacy e sicurezza → Modalità sviluppatore** e riavvia l'iPhone quando richiesto.

## Da sapere

- Con un Apple ID gratuito, la firma personale di solito scade dopo circa 7 giorni. Quando FitPulse smette di aprirsi, ripeti il sideload con Sideloadly.
- Per rifare l'installazione puoi riutilizzare l'IPA già scaricato, finché non cambi il progetto. Per includere modifiche recenti all'app, carica i file aggiornati su GitHub e avvia di nuovo il workflow.
- GitHub Actions compila il progetto su un runner macOS ospitato da GitHub. I limiti e l'eventuale costo dipendono dal piano GitHub; controlla la quota Actions del tuo account prima di avviare il workflow.
- Usa un repository privato se non vuoi che il codice sia visibile pubblicamente.
- FitPulse carica alcuni font, icone e stili da Internet; per visualizzarli l'app ha bisogno di una connessione.
