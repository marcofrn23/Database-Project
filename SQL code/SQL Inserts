# Insertions in the database
# Language: Italian

# INSERIMENTO NUOVO PREVENTIVO
INSERT INTO Impianto(DataInst, DataRichiesta, Cliente, Categoria, Stato, Valore)
     values(<DataPrevista>, <DataRic>, <Cliente>, <Categoria>,  
     default, NULL);

# INSERIMENTO NUOVO IMPIANTO INSTALLATO
INSERT INTO Es_Lavoro(DataEs, LuogoEs, CostoSic, CostoMan, Descrizione, NumeroOre, DataInst, Cliente) 
      values(Current_Date, <LuogoEs>, <CostoSic>, <CostoMan>,               
      ‘Installazione’, <NumeroOre>, <Current_Date>, 
      <Cliente>);

# TANTE QUANTI I DIPENDENTI CHE HANNO PARTECIPATO
INSERT INTO Effettuazione_Manodopera(Num_Ore, DataEs, LuogoEs, Esecutore)
      values(<Num_Ore>, Current_Date, <LuogoEs>, <Esecutore>);

# EVENTUALE
INSERT INTO Effettuazione_Manodopera_SP(Num_Ore, DataEs, LuogoEs, Esecutore)
      values(<Num_Ore>, Current_Date, <LuogoEs>, <Esecutore>);

UPDATE Impianto SET DataInst = Current_Date, 
                    Valore = <CostoSic>+<CostoMan>
WHERE Luogo = <LuogoEs>;

# INSERIMENTO NORMATIVA
INSERT INTO Normativa(DataIntro, Titolo)   
      values(…);

UPDATE Impianto SET Stato=‘no_norma’
WHERE Impianto.DataInst <= (SELECT DataIntro 
                            FROM Normativa
                            WHERE Titolo = Impianto.Categoria)

# INSERIMENTO NUOVO CLIENTE
INSERT INTO  Cliente(Nome, Cognome, CF/P.IVA, Via, N.civico, Città, CAP, Mail, FAX)
      values(…);

# EVENTUALE 
INSERT INTO Ente_Pubblico(Cliente, Metratura, TipoEnte)
      values(…);

INSERT INTO Industria(Cliente, Metratura, TipoInd)
      values(…);

# INSERIMENTO NUOVO TELEFONO CLIENTE
INSERT INTO Telefono(Cliente, Numero)
      values(…);

# INSERIMENTO NUOVO ABB.ASSISTENZA CLIENTE
INSERT INTO Contratto_assistenza(Annuale, Scadenza, Tipologia_Ass, TotOre_Ass, Cliente, DataInst)
      values(…);
      
# INSERIMENTO RAPPORTO D’INTERVENTO MANUTENZIONE
INSERT INTO Es_Lavoro(DataEs, LuogoEs, CostoSic, CostoMan, Descrizione, NumeroOre, Lavoratore, DataInst, Cliente) 
      values(<Current_Date>, <LuogoEs>, <CostoSic>, <CostoMan>,               
      ’Manutenzione/Sost.Parti’, <NumeroOre>, <Current_Date>, 
      <Cliente>);

# TANTE QUANTI SONO I DIPENDENTI CHE VI HANNO PRESO PARTE
INSERT INTO Effettuazione_Manodopera(Num_Ore, DataEs, LuogoEs, Esecutore)
      values(…);

# TANTE QUANTE SONO I COLLABORATORI CHE VI HANNO PRESO PARTE
INSERT INTO Effettuazione_Manodopera_SP(Num_Ore, DataEs, LuogoEs, Esecutore)
      values(…);

# INSERIMENTO NUOVO DIPENDENTE
INSERT INTO Dipendente(CF/P.IVA, Nome, Cognome, Via, N.civico, Città, CAP, Mail, Telefono)
      values(…);

# INSERIMENTO NUOVO COLLABORATORE
INSERT INTO Collaboratore(P.IVA, Nome, Cognome, Professione, TempoPer, Retrib, Mail)   
      values(…);

# INSERIMENTO NUOVA BUSTA PAGA
INSERT INTO Busta_Paga(Dipendente, CorrAnnuale, Mensilita)
      values(…);

# INSERIMENTO NUOVO COMPONENTE DI UN IMPIANTO
INSERT INTO Componente(CodComp, DataInst, Cliente, Nome, CasaProd, PrezzoUn)
      values(…);

UPDATE Impianto SET Valore = Valore+PrezzoUn

# EVENTUALI
INSERT INTO Cablaggio_Antifurto(CodCabAF, Sez, Cat)
      values(…);

INSERT INTO Comb_Telefonico(CodCombin.,VettoreTel, Connessione)
      values(…);

INSERT INTO Rilevatore(CodRilevatore, Tecnologia, Portata)
      values(…);

INSERT INTO Interfaccia(CodInterf.,Tecnologia)
      values(…);

INSERT INTO Sirena(CodSirena, Potenza, Locazione)
      values(…);

INSERT INTO Cablaggio_Automaz(CodCabAut, Sez, Cat)
      values(…);

INSERT INTO Fotocellula(CodFotocellula, PortataFot, Connessione)      values(…);

INSERT INTO Costa_Antisk(CodCosta, Altezza)
      values(…);

INSERT INTO Motore(CodMotore, TipoMot)
      values(…);

INSERT INTO Comando_Aut(CodComando, Tipologia)
      values(…);

INSERT INTO Segnalatore(CodSegn., Segnale)
      values(…);

INSERT INTO Telecamera(CodTelecamera, Focale, Risoluz, Motore)
      values(…);

INSERT INTO Videoreg(CodVideoreg., NCanali, ConnVR, Tecnologia)
      values(…);

INSERT INTO Memorizzazione(CodMem., Archiviazione, Dimensione)           
      values(…);

INSERT INTO Ponte_Radio(CodPonte, PortRadio)      
      values(…);

INSERT INTO Switch(CodSwitch, DimSwitch)      
      values(…);

INSERT INTO Cablaggio_Videos(CodCabVS, Sez, Cat)
      values(…);


