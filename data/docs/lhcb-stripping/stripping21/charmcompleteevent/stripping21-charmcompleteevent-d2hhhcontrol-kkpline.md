[[stripping21 lines]](./stripping21-index)

# StrippingD2hhhControl_KKPLine

## Properties:

|                |                                     |
|----------------|-------------------------------------|
| OutputLocation | Phys/D2hhhControl_KKPLine/Particles |
| Postscale      | 1.0000000                           |
| HLT            | None                                |
| Prescale       | 0.030000000                         |
| L0DU           | None                                |
| ODIN           | None                                |

## Filter sequence:

LoKi::VoidFilter/StrippingD2hhhControl_KKPLineVOIDFilter

|      |                                                                 |
|------|-----------------------------------------------------------------|
| Code | (recSummary(LHCb.RecSummary.nTracks, 'Rec/Track/Best') \< 500 ) |

CheckPV/checkPVmin1

|        |     |
|--------|-----|
| MinPVs | 1   |
| MaxPVs | -1  |

LoKi::VoidFilter/SelFilterPhys_StdLooseDplus2KKPi_Particles

|      |                                                                                                      |
|------|------------------------------------------------------------------------------------------------------|
| Code | CONTAINS('Phys/[StdLooseDplus2KKPi](./stripping21-commonparticles-stdloosedplus2kkpi)/Particles')\>0 |

FilterDesktop/D2hhhControl_KKPLine

|                 |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
|-----------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Code            | ( (MINTREE('pi+'==ABSID, PT) \> 250.0 ) & (MINTREE('pi+'==ABSID, P ) \> 2000.0) & (MINTREE('pi+'==ABSID, MIPCHI2DV(PRIMARY)) \> 4.0 ) & (MAXTREE('pi+'==ABSID, PIDK-PIDpi) \< 3.0) & (MINTREE('K-'==ABSID, PIDK-PIDpi) \> 7.0 ) & (MINTREE('K-'==ABSID, PT) \> 250.0 ) & (MINTREE('K-'==ABSID, P ) \> 2000.0) & (MINTREE('K-'==ABSID, MIPCHI2DV(PRIMARY)) \> 4.0 ) & (DOCACHI2MAX \< 50.0) & ((SUMTREE( ISBASIC , PT ) \> 1800.0\*MeV) & (2 \<= NINGENERATION((MIPCHI2DV(PRIMARY) \> 10.0 ) , 1))) & (PT \> 1000.0) & (VFASPF(VCHI2/VDOF) \< 10.0) & (BPVDIRA \> 0.0) & (BPVIPCHI2() \< 12.0) & (VFASPF(VMINVDCHI2DV(PRIMARY)) \> 125.0) & (in_range ( 1800.0 , M , 2040.0 )) ) |
| Inputs          | [ 'Phys/[StdLooseDplus2KKPi](./stripping21-commonparticles-stdloosedplus2kkpi)' ]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| DecayDescriptor | None                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| Output          | Phys/D2hhhControl_KKPLine/Particles                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |

AddRelatedInfo/RelatedInfo1_D2hhhControl_KKPLine

|                 |                                                  |
|-----------------|--------------------------------------------------|
| Inputs          | [ 'Phys/D2hhhControl_KKPLine' ]                |
| DecayDescriptor | None                                             |
| Output          | Phys/RelatedInfo1_D2hhhControl_KKPLine/Particles |

AddRelatedInfo/RelatedInfo2_D2hhhControl_KKPLine

|                 |                                                  |
|-----------------|--------------------------------------------------|
| Inputs          | [ 'Phys/D2hhhControl_KKPLine' ]                |
| DecayDescriptor | None                                             |
| Output          | Phys/RelatedInfo2_D2hhhControl_KKPLine/Particles |

AddRelatedInfo/RelatedInfo3_D2hhhControl_KKPLine

|                 |                                                  |
|-----------------|--------------------------------------------------|
| Inputs          | [ 'Phys/D2hhhControl_KKPLine' ]                |
| DecayDescriptor | None                                             |
| Output          | Phys/RelatedInfo3_D2hhhControl_KKPLine/Particles |

AddRelatedInfo/RelatedInfo4_D2hhhControl_KKPLine

|                 |                                                  |
|-----------------|--------------------------------------------------|
| Inputs          | [ 'Phys/D2hhhControl_KKPLine' ]                |
| DecayDescriptor | None                                             |
| Output          | Phys/RelatedInfo4_D2hhhControl_KKPLine/Particles |
