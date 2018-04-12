# Queries for the database
# Language: Italian

# CONSULTAZIONE ANAGRAFICA E INDIRIZZO CLIENTE A CUI E’ STATO INSTALLATO UN IMPIANTO IN UNA CERTA DATA
SELECT Nome, Cognome, CF/P.IVA AS cod, Via, N.civico, Città, CAP
FROM Cliente JOIN Impianto ON cod = Impianto.Cliente
WHERE Impianto.DataInst = <DataInst> and Impianto.Cliente = <CFPIVA>;

# CONSULTAZIONE ANAGRAFICA E INDIRIZZO CLIENTI A CUI E’ STATO INSTALLATO UN IMPIANTO IN UN CERTO INTERVALLO DI TEMPO
SELECT Nome, Cognome, CF/P.IVA AS cod, Via, N.civico, Città, CAP
FROM Cliente JOIN Impianto ON cod = Impianto.Cliente
WHERE Impianto.DataInst ><primadata> and Impianto.DataInst <<secondadata>;

# CONSULTAZIONE NUMERO DI TELEFONO E CONTATTI DI UN CLIENTE 
SELECT Cliente.Nome, Cliente.Cognome, Numero, Mail, FAX
FROM Telefono FULL JOIN Cliente ON Telefono.Cliente = Cliente.CF_Piva
WHERE Cliente.CF_Piva =<CFPIVA>;

# EVENTUALE (TUTTI I CLIENTI DI CUI SI HANNO PIU’ DI 2 NUMERI DI TEL.)
SELECT Cliente, COUNT(Numero) as Numeri
FROM Telefono
GROUP BY Cliente
HAVING COUNT(Numero) >2;

# CONSULTAZIONE DATI DI UN ENTE PUBBLICO/INDUSTRIA CHE POSSIEDE UN CERTO IMPIANTO
SELECT Impianto.Categoria AS Categoria, Tipologia, Metratura
FROM Impianto JOIN Industria ON Impianto.Cliente = Industria.Cliente
WHERE Industria.Cliente = <CFPIVA> and Impianto.Valore is NOT NULL;

# CONSULTAZIONE DATA D’INTRODUZIONE DI UNA CERTA NORMATIVA
SELECT DataIntro
FROM Normativa
WHERE Titolo = <Titolo>;

# CONSULTAZIONE IMPIANTI CHE NON SONO A NORMA 
SELECT I.DataInst, I.Cliente, I.Categoria, Cliente.Nome, Cliente.Cognome
FROM Impianto I JOIN Cliente ON I.Cliente = Cliente.CF_Piva
WHERE I.Stato =‘no_norma’;

# CONTEGGIO, PER TIPO, DEGLI IMPIANTI CHE NON SONO A NORMA
SELECT I.Categoria, I.DataInst, I.Cliente, COUNT(*)
FROM Impianto I
WHERE I.Stato =‘no_norma’;
GROUP BY I.Categoria, I.DataInst, I.Cliente

# CONSULTAZIONE PREVENTIVO
SELECT DataInst AS DataPrevistaInst, Luogo, DataRichiesta, Cliente, Categoria
FROM Impianto 
WHERE Valore is NULL

# CONSULTAZIONE RAPPORTO D’INTERVENTO INSTALLAZIONE/MANUTENZIONE SU UN IMPIANTO DI UN CLIENTE
SELECT DataEs AS Data, LuogoEs AS Luogo, CostoSic, CostoMan, Descrizione, NumeroOre, DataInst, Cliente
FROM Es_Lavoro
WHERE DataInst = <DataInst> and Cliente = <CFPIVA>

# CONSULTAZIONE TOTALE ORE DI MANODOPERA EFFETTUATE DAI DIPENDENTI FISSI CON STIPENDIO MENSILE MAGGIORE DI UN CERTO VALORE 
SELECT Esecutore, D.Nome, D.Cognome sum(Num_Ore)
FROM Effettuazione_Manodopera JOIN Busta_Paga 
ON Effettuazione_Manodopera.Esecutore = Busta_Paga.Dipendente
JOIN Dipendente D
ON Busta_Paga.Dipendente = Dipendente.CF_Piva
WHERE Busta_paga.Mensilita > <mensilita>
GROUP BY Esecutore, D.Nome, D.Cognome;

# CONSULTAZIONE TOTALE ORE DI MANODOPERA EFFETTUATE DA UN CERTO COLLABORATORE OCCASIONALE E LA SUA RETRIBUZIONE 
SELECT sum(Num_Ore)
FROM Effettuazione_Manodopera_SP
WHERE Esecutore in (SELECT Piva
                    FROM Collaboratore 
                    WHERE Piva = <PIVA>)

# CONSULTAZIONE DEI LAVORI A CUI HA PARTECIPATO UN CERTO COLLABORATORE
SELECT DataEs, LuogoEs, Descrizione, Num_Ore
FROM Es_Lavoro E JOIN Effettuazione_Manodopera_SP ESP ON E.DataEs = ESP.DataEs and E.LuogoEs = ESP.LuogoEs
WHERE ESP.P_iva = <PIVA>	
ORDER BY Num_Ore;

# CONSULTAZIONE LISTA ESECUTORI (DIPENDENTI FISSI) DI UN LAVORO
SELECT D.CF_Piva, D.Nome, D.Cognome, EM.Num_ore, EL.Descrizione AS Ruolo
FROM Es_Lavoro EL JOIN Effettuazione_Manodopera EM ON EL.DataEs=EM.DataEs AND EL.LuogoEs = EM.LuogoEs
     JOIN Dipendente D ON EM.Esecutore = D.CF_Piva
WHERE EL.DataEs = <DATA_ESECUZIONE> AND EL.LuogoEs = <LUOGO_ESECUZIONE>
UNION
SELECT C.P_iva, C.Nome, C.Cognome, EM.Num_ore, C.Professione
FROM Effettuazione_Manodopera_SP EM JOIN Collaboratore C ON EM.Esecutore = C.P_iva
WHERE EM.DataEs = <DATA_ESECUZIONE> AND EM.LuogoEs = <LUOGO_ESECUZIONE>;

# CONSULTAZIONE ANAGRAFICA DIPENDENTE E ANNUALITA’
SELECT CF_Piva,Nome,Cognome,Via,N_Civico,Citta,CAP,Mail,Telefono,CorrAnnuale AS Annualita
FROM Dipendente D JOIN Busta_Paga B ON D.CF_Piva = B.Dipendente
WHERE D.CF_Piva = <codice_dipendente>;

# CONSULTAZIONE DELL'ELENCO COMPONENTI DI UN IMPIANTO
SELECT C.CodComp AS Codice, C.Nome AS Componente, C.CasaProd, C.PrezzoUn AS Prezzo, I.Categoria
FROM Componente C JOIN Impianto I ON C.Cliente = I.Cliente AND C.DataInst = I.DataInst
WHERE C.Cliente = <Cliente> AND DataInst = <DataInst>;

# DETTAGLI COMPONENTE (es. Telecamera con codice <CODICE TELECAMERA>)
SELECT Telecamera.*, I.DataInst, I.Cliente, I.Categoria
FROM Telecamera JOIN Componente C ON CodTelecamera = CodComp
JOIN Impianto I ON C.DataInst = I.DataInst and C.Cliente = I.Cliente
WHERE CodTelecamera = <CODICE_TELECAMERA>;

# CONSULTAZIONE DEI CONTRATTI DI ASSISTENZA STIPULATI CON UN CLIENTE
SELECT CF_Piva,Nome,Cognome,Annuale, Scadenza, Tipologia_Ass,TotOre_Ass,Categoria
FROM Contratto_Assistenza CA JOIN Impianto I ON CA.Cliente = I.Cliente AND CA.DataInst = I.DataInst
JOIN Cliente C ON CA.Cliente = CF_Piva
WHERE CF_Piva = <Cod_Cliente>;

# CONTEGGIO IMPIANTI INSTALLATI IN UN PERIODO PER TIPOLOGIA
[ SELECT SUM(Num_Impianti) FROM ( ] <---- nel caso si voglia la somma di tutti gli impianti
SELECT Categoria, COUNT(Categoria) AS Num_Impianti
FROM Impianto
WHERE DataInst > <DATA_INIZIO_PERIODO> AND DataInst < <DATA_FINE_PERIODO>
GROUP BY Categoria;
[ HAVING Categoria = <CATEGORIA SCELTA> ] <-- nel caso si voglia solo una categoria;











__________________________________________________________
STATISTICA LAVORI DI MANUTENZIONE AGLI IMPIANTI IN UN DATO PERIODO
SELECT Cliente,DataInst,COUNT(*) AS Numero_interventi
FROM Es_Lavoro
WHERE Tipo_lavoro = ‘Manutenzione/Sost.Parti’ AND
      DataEs > <DATA_INIZIO_PERIODO> AND DataEs < <DATA_FINE_PERIODO>
GROUP BY Cliente, DataInst
ORDER BY Numero_interventi;

// Query che permette di descrivere “la qualità” degli impianti installati andando a vedere i lavori di manutenzione/sostituzione di parti effettuati.

__________________________________________________________
CONSULTAZIONE VALORE ATTUALE DI UN IMPIANTO
SELECT Valore
FROM Impianto
WHERE Valore is NOT NULL and DataInst = <DataInst> and Cliente = <CFPIVA>


// Query che permette di consultare velocemente il valore attuale di un impianto.
