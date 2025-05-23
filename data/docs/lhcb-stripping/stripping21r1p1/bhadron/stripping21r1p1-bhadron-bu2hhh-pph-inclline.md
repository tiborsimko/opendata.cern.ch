[[stripping21r1p1 lines]](./stripping21r1p1-index)

# StrippingBu2hhh_pph_inclLine

## Properties:

|                |                                    |
|----------------|------------------------------------|
| OutputLocation | Phys/Bu2hhh_pph_inclLine/Particles |
| Postscale      | 1.0000000                          |
| HLT1           | None                               |
| HLT2           | None                               |
| Prescale       | 1.0000000                          |
| L0DU           | None                               |
| ODIN           | None                               |

## Filter sequence:

LoKi::VoidFilter/StrippingGoodEventConditionBhadron

|      |                                                                                                |
|------|------------------------------------------------------------------------------------------------|
| Code | ALG_EXECUTED('StrippingStreamBhadronBadEvent') & ~ALG_PASSED('StrippingStreamBhadronBadEvent') |

LoKi::VoidFilter/StrippingBu2hhh_pph_inclLineVOIDFilter

|      |                                                                |
|------|----------------------------------------------------------------|
| Code | (recSummaryTrack(LHCb.RecSummary.nLongTracks, TrLONG) \< 200 ) |

CheckPV/checkPVmin1

|        |     |
|--------|-----|
| MinPVs | 1   |
| MaxPVs | -1  |

LoKi::VoidFilter/SelFilterPhys_StdAllNoPIDsKaons_Particles

|      |                                                                                                             |
|------|-------------------------------------------------------------------------------------------------------------|
| Code | CONTAINS('Phys/[StdAllNoPIDsKaons](./stripping21r1p1-commonparticles-stdallnopidskaons)/Particles',True)\>0 |

LoKi::VoidFilter/SelFilterPhys_StdAllLooseProtons_Particles

|      |                                                                                                               |
|------|---------------------------------------------------------------------------------------------------------------|
| Code | CONTAINS('Phys/[StdAllLooseProtons](./stripping21r1p1-commonparticles-stdalllooseprotons)/Particles',True)\>0 |

CombineParticles/Bu2hhh_pph_inclLine

|                  |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
|------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Inputs           | [ 'Phys/[StdAllLooseProtons](./stripping21r1p1-commonparticles-stdalllooseprotons)' , 'Phys/[StdAllNoPIDsKaons](./stripping21r1p1-commonparticles-stdallnopidskaons)' ]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| DaughtersCuts    | { '' : 'ALL' , 'K+' : '(PT \> 100.0\*MeV) & (P \> 1500.0\*MeV) & (MIPCHI2DV(PRIMARY) \> 1.0) & (TRCHI2DOF \< 4.0) & (TRGHOSTPROB \< 0.5)' , 'K-' : '(PT \> 100.0\*MeV) & (P \> 1500.0\*MeV) & (MIPCHI2DV(PRIMARY) \> 1.0) & (TRCHI2DOF \< 4.0) & (TRGHOSTPROB \< 0.5)' , 'p+' : '(PT \> 100.0\*MeV) & (P \> 1500.0\*MeV) & (MIPCHI2DV(PRIMARY) \> 1.0) & (TRCHI2DOF \< 4.0) & (TRGHOSTPROB \< 0.5)' , 'p~-' : '(PT \> 100.0\*MeV) & (P \> 1500.0\*MeV) & (MIPCHI2DV(PRIMARY) \> 1.0) & (TRCHI2DOF \< 4.0) & (TRGHOSTPROB \< 0.5)' }                                                                                                                                                                                                              |
| CombinationCut   | (AM \< (5279.15 + 400)\*MeV) & (AM \> (5279.15 - 200)\*MeV) & (AMAXDOCA('LoKi::TrgDistanceCalculator') \< 0.2)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| MotherCut        | (MAXTREE(((ABSID=='p+') \|(ABSID=='p~-') \|(ABSID=='K+') \| (ABSID=='K-')),PT) \> 1500\*MeV) & (BPVDIRA \> 0.99998) & (BPVVDCHI2 \> 500.0) & (VFASPF(VMINVDDV(PRIMARY)) \> 3.0) & (VFASPF(VCHI2) \< 12.0) & (MIPCHI2DV(PRIMARY) \< 10.0) & (PT \> 1000.0\*MeV) & (SUMTREE(PT,((ABSID=='p+') \|(ABSID=='p~-') \|(ABSID=='K+') \| (ABSID=='K-')),0.0) \> 4500.0\*MeV) & (SUMTREE(P,((ABSID=='p+') \|(ABSID=='p~-') \|(ABSID=='K+') \| (ABSID=='K-')),0.0) \> 20000.0\*MeV) & (SUMTREE(MIPCHI2DV(PRIMARY),((ABSID=='p+') \|(ABSID=='p~-') \|(ABSID=='K+') \| (ABSID=='K-')),0.0) \> 500.0) & (MINTREE(((ABSID=='p+') \|(ABSID=='p~-') \|('K+'==ABSID) \| ('K-'==ABSID)),TRCHI2DOF) \< 3.0) & (BPVCORRM \< 7000.0 \* MeV)& (BPVCORRM \> 4000.0\*MeV) |
| DecayDescriptor  | None                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| DecayDescriptors | [ '[B+ -\> p+ p~- K+]cc' ]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| Output           | Phys/Bu2hhh_pph_inclLine/Particles                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |

AddRelatedInfo/RelatedInfo1_Bu2hhh_pph_inclLine

|                 |                                                 |
|-----------------|-------------------------------------------------|
| Inputs          | [ 'Phys/Bu2hhh_pph_inclLine' ]                |
| DecayDescriptor | None                                            |
| Output          | Phys/RelatedInfo1_Bu2hhh_pph_inclLine/Particles |

AddRelatedInfo/RelatedInfo2_Bu2hhh_pph_inclLine

|                 |                                                 |
|-----------------|-------------------------------------------------|
| Inputs          | [ 'Phys/Bu2hhh_pph_inclLine' ]                |
| DecayDescriptor | None                                            |
| Output          | Phys/RelatedInfo2_Bu2hhh_pph_inclLine/Particles |

AddRelatedInfo/RelatedInfo3_Bu2hhh_pph_inclLine

|                 |                                                 |
|-----------------|-------------------------------------------------|
| Inputs          | [ 'Phys/Bu2hhh_pph_inclLine' ]                |
| DecayDescriptor | None                                            |
| Output          | Phys/RelatedInfo3_Bu2hhh_pph_inclLine/Particles |

AddRelatedInfo/RelatedInfo4_Bu2hhh_pph_inclLine

|                 |                                                 |
|-----------------|-------------------------------------------------|
| Inputs          | [ 'Phys/Bu2hhh_pph_inclLine' ]                |
| DecayDescriptor | None                                            |
| Output          | Phys/RelatedInfo4_Bu2hhh_pph_inclLine/Particles |

AddRelatedInfo/RelatedInfo5_Bu2hhh_pph_inclLine

|                 |                                                 |
|-----------------|-------------------------------------------------|
| Inputs          | [ 'Phys/Bu2hhh_pph_inclLine' ]                |
| DecayDescriptor | None                                            |
| Output          | Phys/RelatedInfo5_Bu2hhh_pph_inclLine/Particles |

AddRelatedInfo/RelatedInfo6_Bu2hhh_pph_inclLine

|                 |                                                 |
|-----------------|-------------------------------------------------|
| Inputs          | [ 'Phys/Bu2hhh_pph_inclLine' ]                |
| DecayDescriptor | None                                            |
| Output          | Phys/RelatedInfo6_Bu2hhh_pph_inclLine/Particles |

AddRelatedInfo/RelatedInfo7_Bu2hhh_pph_inclLine

|                 |                                                 |
|-----------------|-------------------------------------------------|
| Inputs          | [ 'Phys/Bu2hhh_pph_inclLine' ]                |
| DecayDescriptor | None                                            |
| Output          | Phys/RelatedInfo7_Bu2hhh_pph_inclLine/Particles |

AddRelatedInfo/RelatedInfo8_Bu2hhh_pph_inclLine

|                 |                                                 |
|-----------------|-------------------------------------------------|
| Inputs          | [ 'Phys/Bu2hhh_pph_inclLine' ]                |
| DecayDescriptor | None                                            |
| Output          | Phys/RelatedInfo8_Bu2hhh_pph_inclLine/Particles |
