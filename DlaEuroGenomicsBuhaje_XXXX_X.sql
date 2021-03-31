Use wycena --Genomowa

select * from buhaje_2020_3



select * from buhaje_temp  -- Sprawdzenie zawartoœci tabeli buhaje_temp
--delete from buhaje_temp  -- W razie potrzeby usuniêcie wszystkich danych




select a.numer_oryg, b.numer_oryg from  buhaje_temp a, buhaje_2020_2 b where a.numer_oryg = b.numer_oryg -- Sprawdzenie iloœciowo które buhaje z listy s¹ w bazie.

select * from buhaje_temp  where numer_oryg not in (select numer_oryg from buhaje_XXXX_X)     -- Sprawdzenie których osobników z otrzymanej listy nie ma w bazie buhaje_XXXX_X 



select a.nazwa+a.numer_oryg'ITB_ID19',
(case 
 when a.o_numer_oryg = 'NUL0000000000000' then ''
 else a.nazwa+a.o_numer_oryg
 end)'National ID',
'YES'Published,
 (case 
	when b.mleko_typ_oceny = 2 then 'EBV'
	when b.mleko_typ_oceny = 3 then 'MACE'
	when b.mleko_typ_oceny = 4 then 'GEBV'
	when b.mleko_typ_oceny = 6 then 'GMACE'
	end)'Type',
 cast(b.i_pf/100 as int)'PF',
 cast(b.pi_prod/100 as int)'Prod index',
 --MLEKO
 b.mleko_po'mleko r2',
 cast(b.mleko_wh/100 as int)'mleko ebv',
 b.bikg_po'bialko r2',
 cast(b.bikg_wh/10 as int)'bialko ebv',
 ----------------------------------------------------------
 b.bipr_po'bialko % r2',
 cast(b.bipr_wh/100 as numeric(18,2))'bialko % ebv',
 ----------------------------------------------------------
 b.tlkg_po'tluszcz r2',
 cast(b.tlkg_wh/10 as int)'tluszcz ebv',
 -----------------------------------------------------------
 b.tlpr_po'tluszcz % r2',
 cast(b.tlpr_wh/100 as numeric(18,2))'tluszcz % ebv',
 ----------------------------------------------------------------
 --Pokroj
 b.wwk_po'Stature r2',
 cast(b.wwk_wh/100 as int)'Stature ebv',
 b.gt_po'B.D r2',
 cast(b.gt_wh/100 as int)'B.D ebv',
 b.skp_po'C.W r2',
 cast(b.skp_wh/100 as int)'C.W ebv',
 b.uz_po'R.A r2',
 cast(b.uz_wh/100 as int)'R.A ebv',
 b.sz_po'R.W r2',
 cast(b.sz_wh/100 as int)'R.W ebv',
 b.ntwzb_po'R.L.S.S.V r2',
 cast(b.ntwzb_wh/100 as int)'R.L.S.S.V ebv',
 b.r_po'F.A r2',
 cast(b.r_wh/100 as int)'F.A ebv',
 b.ntwzt_po'R.L.S.R.V r2',
 cast(b.ntwzt_wh/100 as int)'R.L.S.R.V ebv',
 b.zpw_po'F.U r2',
 cast(b.zpw_wh/100 as int)'F.U ebv',
 b.ztw_po'R.U.H r2',
 cast(b.ztw_wh/100 as int)'R.U.H ebv',
 b.wsw_po'U.S r2',
 cast(b.wsw_wh/100 as int)'U.S ebv',
 b.pw_po'U.D r2',
 cast(b.pw_wh/100 as int)'U.D ebv',
 b.sw_po'U.W r2',
 cast(b.sw_wh/100 as int)'U.W ebv',
 b.us_po'F.T.P r2',
 cast(b.us_wh/100 as int)'F.T.P ebv',
 b.ds_po'T.L r2',
 cast(b.ds_wh/100 as int)'T.L ebv',
 b.ust_po'R.T.P r2',
 cast(b.ust_wh/100 as int)'R.T.P ebv',
 b.cm_po'D.C r2',
 cast(b.cm_wh/100 as int)'D.C ebv',
 --P£odnosc-----
 b.wnpuk_po'C.R.C r2',
 cast(b.wnpuk_wh/100 as int)'C.R.C ebv',
 b.wnpuj_po'C.R.H r2',
 cast(b.wnpuj_wh/100 as int)'C.R.H ebv',
 b.pp_po'D.B.C.a.F.I r2',
 cast(b.pp_wh/100 as int)'D.B.C.a.F.I ebv',
 b.omc_po'D.O r2',
 cast(b.omc_wh/100 as int)'D.O ebv',
 ----------------------------------------------------
 cast(b.pi_ogolny_pokroju/100 as int)'Conf. Index',
 cast (b.pi_kalibru/100 as int)'Body Frame index',
 cast (b.pi_typu/100 as int)'Dairy Strenght Index',
 cast (b.pi_nog_i_racic/100 as int)'Feet and Legs Index',
 cast (b.pi_wymienia/100 as int)'Udder Index',
 cast (b.pi_plodnosc/100 as int)'Fertility Index',
 b.ks_po'scs r2',
 cast (b.ks_wh/100 as int)'scs ebv',
 b.przez_po'long r2',
 cast(b.przez_wh/100 as int)'long ebv',
 -------------------------------------------------------EBV fro lactose laktoza
 b.lakg_po'lactose r2',
 cast(b.lakg_wh/10 as int)'lactose ebv',
 b.lapr_po'lactose% r2',
 cast(b.lapr_wh/100 as numeric(18,2))'lactose% ebv',

 --------------------------------------------------------Cechy zdolnoœci udojowej (Workability traits) - dwie cechy:

b.udoj_msp_po'milking speed r2',
cast(b.udoj_msp_wh/100 as int)'milking speed ebv',
b.udoj_tem_po'Temperament r2',
cast(b.udoj_tem_wh/100 as int)'Temperament ebv',

------------------------------------------------------------ Calving 4cechy
b.por_dce_po' Direct C.E. r2',
cast(b.por_dce_wh/100 as int)'Direct C.E. ebv',
b.por_mce_po'Maternal C.E. r2',
cast(b.por_mce_wh/100 as int)'Maternal C.E.ebv',

----------------------------------------------------------------
b.por_dsb_po'DaughterS.B. r2',
cast(b.por_dsb_wh/100 as int)'DaughterS.B. ebv',
b.por_msb_po'Maternal S.B. r2',
cast(b.por_msb_wh/100 as int)'Maternal S.B. ebv'

 from  buhaje_temp a, buhaje_2020_3 b where a.numer_oryg = b.numer_oryg






































































































































































































































































































































































































































































































































































































































































































































































































































































