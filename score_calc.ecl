IMPORT $;
dataframe := $.score_table.final;

A := 8; // Peso para rentabilidade
B := 6; // Peso para segurança
C := 10; // Peso para relevo

score_rec := RECORD
  dataframe;
  REAL score;
  STRING7 score_cat;
END;

score_rec MyTransf(dataframe Le) := TRANSFORM
  SELF.score := (A*Le.rentability + B*(1-Le.criminality_index) + C*(1-Le.declividade))/(A+B+C)*1000;
  SELF.score_cat := IF(SELF.score >= 800, 'BOM', IF(SELF.score >= 600, 'REGULAR', 'RUIM'));
  SELF := Le;
END;

p := SORT(PROJECT(dataframe, MyTransf(LEFT)), score_cat);

OUTPUT(p);





