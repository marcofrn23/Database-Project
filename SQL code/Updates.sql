# Data updates
# Language: Italian, used BNF

# MODIFICA DATI CLIENTE
UPDATE Cliente
      SET Nome = <Nome>
          Cognome = <Cognome>
          Via = <Via>
          N.civico = <Nciv>
          Città = <citta>
          CAP = <Cap>
          Mail = <Mail> 
          FAX = <Fax>
WHERE CF/P.IVA = <CFPIVA>;

# MODIFICA DATI DIPENDENTE FISSO
UPDATE Dipendente
      SET Nome = <Nome>
          Cognome = <Cognome>
          Via = <Via>
          N.civico = <Nciv>
          Città = <citta>
          CAP = <Cap>
          Mail = <Mail> 
          Telefono = <Telefono>
WHERE CF/P.IVA = <CFPIVA>;

# MODIFICA DATI COLLABORATORE OCCASIONALE
UPDATE Collaboratore
      SET Nome = <Nome>
          Cognome = <Cognome>
          Professione = <Prof>
          TempoPer = <TempoPer>
          Retrib = <Retrib>
          Mail = <Mail> 
          Telefono = <Telefono> 
WHERE P.IVA = <PIVA>;

# MODIFICA DATI NORMATIVA
UPDATE Normativa SET
          DataIntro= <Nuovadata>
WHERE Titolo = <Titolo>
UPDATE Impianto SET Stato = ‘no_norma’
WHERE Impianto.DataInst <= (SELECT DataIntro
                            FROM Normativa
                            WHERE Titolo = Categoria);

# MODIFICA DATI BUSTA PAGA
UPDATE Busta_paga SET
         CorrAnnuale = <Annuale>
         Mensilita = <Mensilita>
WHERE Dipendente = <CFPIVA>;


# ELIMINAZIONE DI UN COMPONENTE DALLA SCHEDA TECNICA DI UN IMPIANTO
DELETE FROM Componente 
WHERE CodComp = <Codcomp>;

UPDATE Impianto SET Valore = Valore - <PrezzoUnComponente>

