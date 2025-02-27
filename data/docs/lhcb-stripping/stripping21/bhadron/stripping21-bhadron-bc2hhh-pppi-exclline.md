[[stripping21 lines]](./stripping21-index)

# StrippingBc2hhh_pppi_exclLine

## Properties:

|                |                                     |
|----------------|-------------------------------------|
| OutputLocation | Phys/Bc2hhh_pppi_exclLine/Particles |
| Postscale      | 1.0000000                           |
| HLT            | None                                |
| Prescale       | 1.0000000                           |
| L0DU           | None                                |
| ODIN           | None                                |

## Filter sequence:

CheckPV/checkPVmin1

|        |     |
|--------|-----|
| MinPVs | 1   |
| MaxPVs | -1  |

LoKi::VoidFilter/Bc2hhhGlobalEventCutFilter

|      |                                                                |
|------|----------------------------------------------------------------|
| Code | (recSummaryTrack(LHCb.RecSummary.nLongTracks, TrLONG) \< 200 ) |

LoKi::VoidFilter/SelFilterPhys_StdAllNoPIDsPions_Particles

|      |                                                                                                    |
|------|----------------------------------------------------------------------------------------------------|
| Code | CONTAINS('Phys/[StdAllNoPIDsPions](./stripping21-commonparticles-stdallnopidspions)/Particles')\>0 |

LoKi::VoidFilter/SelFilterPhys_StdAllLooseProtons_Particles

|      |                                                                                                      |
|------|------------------------------------------------------------------------------------------------------|
| Code | CONTAINS('Phys/[StdAllLooseProtons](./stripping21-commonparticles-stdalllooseprotons)/Particles')\>0 |

CombineParticles/Bc2hhh_pppi_exclLine

|                  |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
|------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Inputs           | [ 'Phys/[StdAllLooseProtons](./stripping21-commonparticles-stdalllooseprotons)' , 'Phys/[StdAllNoPIDsPions](./stripping21-commonparticles-stdallnopidspions)' ]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| DaughtersCuts    | { '' : 'ALL' , 'p+' : '(PT \> 250.0\*MeV) & (P \> 2500.0\*MeV) & (MIPCHI2DV(PRIMARY) \> 1.0) & (TRCHI2DOF \< 3.0) & (PROBNNp \> 0.05) & (PROBNNghost \< 0.5)' , 'pi+' : '(PT \> 250.0\*MeV) & (P \> 2500.0\*MeV) & (MIPCHI2DV(PRIMARY) \> 1.0) & (TRCHI2DOF \< 3.0) & (PROBNNpi \> 0.15) & (PROBNNghost \< 0.5)' , 'pi-' : '(PT \> 250.0\*MeV) & (P \> 2500.0\*MeV) & (MIPCHI2DV(PRIMARY) \> 1.0) & (TRCHI2DOF \< 3.0) & (PROBNNpi \> 0.15) & (PROBNNghost \< 0.5)' , 'p~-' : '(PT \> 250.0\*MeV) & (P \> 2500.0\*MeV) & (MIPCHI2DV(PRIMARY) \> 1.0) & (TRCHI2DOF \< 3.0) & (PROBNNp \> 0.05) & (PROBNNghost \< 0.5)' }                                                                          |
| CombinationCut   | (((AM \< 6500.0\*MeV) & (AM \> 6000.0\*MeV)) \| ((AM \< 5500.0\*MeV) & (AM \> 5100.0\*MeV))) & (AMAXDOCA('LoKi::TrgDistanceCalculator') \< 0.2)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| MotherCut        | (MAXTREE(((ABSID=='p+') \|(ABSID=='p~-') \|(ABSID=='pi+') \| (ABSID=='pi-')),PT) \> 1500\*MeV) & (BPVDIRA \> 0.9999) & (BPVVDCHI2 \> 150.0) & (VFASPF(VMINVDDV(PRIMARY)) \> 1.5) & (VFASPF(VCHI2) \< 20.0) & (MIPCHI2DV(PRIMARY) \< 10.0) & (PT \> 1000.0\*MeV) & (SUMTREE(PT,((ABSID=='p+') \|(ABSID=='p~-') \|(ABSID=='pi+') \| (ABSID=='pi-')),0.0) \> 4500.0\*MeV) & (SUMTREE(P,((ABSID=='p+') \|(ABSID=='p~-') \|(ABSID=='pi+') \| (ABSID=='pi-')),0.0) \> 22000.0\*MeV) & (SUMTREE(MIPCHI2DV(PRIMARY),((ABSID=='p+') \|(ABSID=='p~-') \|(ABSID=='pi+') \| (ABSID=='pi-')),0.0) \> 200.0) & (MINTREE(((ABSID=='p+') \|(ABSID=='p~-') \|('pi+'==ABSID) \| ('pi-'==ABSID)),TRCHI2DOF) \< 3.0) |
| DecayDescriptor  | None                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| DecayDescriptors | [ '[B_c+ -\> p+ p~- pi+]cc' ]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| Output           | Phys/Bc2hhh_pppi_exclLine/Particles                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
