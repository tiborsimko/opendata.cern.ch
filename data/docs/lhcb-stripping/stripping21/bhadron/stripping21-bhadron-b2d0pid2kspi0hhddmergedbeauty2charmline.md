[[stripping21 lines]](./stripping21-index)

# StrippingB2D0PiD2KSPi0HHDDMergedBeauty2CharmLine

## Properties:

|                |                                                                              |
|----------------|------------------------------------------------------------------------------|
| OutputLocation | Phys/B2D0PiD2KSPi0HHDDMergedBeauty2CharmLine/Particles                       |
| Postscale      | 1.0000000                                                                    |
| HLT            | (HLT_PASS_RE('Hlt2Topo.\*Decision') \| HLT_PASS_RE('Hlt2IncPhi.\*Decision')) |
| Prescale       | 1.0000000                                                                    |
| L0DU           | None                                                                         |
| ODIN           | None                                                                         |

## Filter sequence:

LoKi::VoidFilter/StrippingB2D0PiD2KSPi0HHDDMergedBeauty2CharmLineVOIDFilter

|      |                                                                |
|------|----------------------------------------------------------------|
| Code | (recSummaryTrack(LHCb.RecSummary.nLongTracks, TrLONG) \< 500 ) |

CheckPV/checkPVmin1

|        |     |
|--------|-----|
| MinPVs | 1   |
| MaxPVs | -1  |

LoKi::VoidFilter/SelFilterPhys_StdAllNoPIDsPions_Particles

|      |                                                                                                    |
|------|----------------------------------------------------------------------------------------------------|
| Code | CONTAINS('Phys/[StdAllNoPIDsPions](./stripping21-commonparticles-stdallnopidspions)/Particles')\>0 |

FilterDesktop/PiInputsBeauty2CharmFilter

|                 |                                                                                               |
|-----------------|-----------------------------------------------------------------------------------------------|
| Code            | (TRCHI2DOF\<3.0) & (PT\>100\*MeV) & (P\>1000\*MeV) & (MIPCHI2DV(PRIMARY)\>4.0) & (TRGHP\<0.4) |
| Inputs          | [ 'Phys/[StdAllNoPIDsPions](./stripping21-commonparticles-stdallnopidspions)' ]             |
| DecayDescriptor | None                                                                                          |
| Output          | Phys/PiInputsBeauty2CharmFilter/Particles                                                     |

LoKi::VoidFilter/SelFilterPhys_StdLooseMergedPi0_Particles

|      |                                                                                                    |
|------|----------------------------------------------------------------------------------------------------|
| Code | CONTAINS('Phys/[StdLooseMergedPi0](./stripping21-commonparticles-stdloosemergedpi0)/Particles')\>0 |

FilterDesktop/Pi0MergedInputsBeauty2CharmFilter

|                 |                                                                                   |
|-----------------|-----------------------------------------------------------------------------------|
| Code            | (ABSID==111) & (PT\>500\*MeV) & (P\>1000\*MeV)                                    |
| Inputs          | [ 'Phys/[StdLooseMergedPi0](./stripping21-commonparticles-stdloosemergedpi0)' ] |
| DecayDescriptor | None                                                                              |
| Output          | Phys/Pi0MergedInputsBeauty2CharmFilter/Particles                                  |

LoKi::VoidFilter/SelFilterPhys_StdLooseKsDD_Particles

|      |                                                                                          |
|------|------------------------------------------------------------------------------------------|
| Code | CONTAINS('Phys/[StdLooseKsDD](./stripping21-commonparticles-stdlooseksdd)/Particles')\>0 |

FilterDesktop/KS0_DDInputsBeauty2CharmFilter

|                 |                                                                         |
|-----------------|-------------------------------------------------------------------------|
| Code            | (PT\>250\*MeV) & (MM\>467.\*MeV) & (MM\<527.\*MeV)                      |
| Inputs          | [ 'Phys/[StdLooseKsDD](./stripping21-commonparticles-stdlooseksdd)' ] |
| DecayDescriptor | None                                                                    |
| Output          | Phys/KS0_DDInputsBeauty2CharmFilter/Particles                           |

CombineParticles/ProtoD2KSPi0HH_DD_MergedBeauty2Charm

|                  |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
|------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Inputs           | [ 'Phys/KS0_DDInputsBeauty2CharmFilter' , 'Phys/Pi0MergedInputsBeauty2CharmFilter' , 'Phys/PiInputsBeauty2CharmFilter' ]                                                                                                                                                                                                                                                                                                                                                                      |
| DaughtersCuts    | { '' : 'ALL' , 'KS0' : 'ALL' , 'pi+' : 'ALL' , 'pi-' : 'ALL' , 'pi0' : 'ALL' }                                                                                                                                                                                                                                                                                                                                                                                                                  |
| CombinationCut   | (ASUM(PT)\>1800\*MeV) & (in_range(1614.84\*MeV,AWM('KS0','pi0','pi+','pi-'),2114.84\*MeV)\|in_range(1614.84\*MeV,AWM('KS0','pi0','pi+','K-'),2114.84\*MeV)\|in_range(1614.84\*MeV,AWM('KS0','pi0','K+','pi-'),2114.84\*MeV)\|in_range(1614.84\*MeV,AWM('KS0','pi0','K+','K-'),2114.84\*MeV)) & (AHASCHILD((ISBASIC & HASTRACK & (TRCHI2DOF\<2.5) & (PT \> 500\*MeV) & (P \> 5000\*MeV))\|((ABSID=='KS0') & (PT \> 500\*MeV) & (P \> 5000\*MeV) & (BPVVDCHI2 \> 1000)))) & (ADOCA(3,4)\<0.5\*mm) |
| MotherCut        | (VFASPF(VCHI2/VDOF)\<10) & (BPVVDCHI2\>36) & (BPVDIRA\>0)                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| DecayDescriptor  | None                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| DecayDescriptors | [ 'D0 -\> KS0 pi0 pi+ pi-' ]                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| Output           | Phys/ProtoD2KSPi0HH_DD_MergedBeauty2Charm/Particles                                                                                                                                                                                                                                                                                                                                                                                                                                             |

SubPIDMMFilter/D2KsPi0HHSubPIDSelBeauty2CharmDD_Merged

|                 |                                                                                                                                                         |
|-----------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|
| Code            | ALL                                                                                                                                                     |
| Inputs          | [ 'Phys/ProtoD2KSPi0HH_DD_MergedBeauty2Charm' ]                                                                                                       |
| DecayDescriptor | None                                                                                                                                                    |
| Output          | Phys/D2KsPi0HHSubPIDSelBeauty2CharmDD_Merged/Particles                                                                                                  |
| MaxMM           | 2114.8400                                                                                                                                               |
| MinMM           | 1614.8400                                                                                                                                               |
| PIDs            | [ [ 'KS0' , 'pi0' , 'pi+' , 'pi-' ] , [ 'KS0' , 'pi0' , 'pi+' , 'K-' ] , [ 'KS0' , 'pi0' , 'K+' , 'pi-' ] , [ 'KS0' , 'pi0' , 'K+' , 'K-' ] ] |

FilterDesktop/D2KsPi0HHDD_MergedBeauty2CharmFilter

|                 |                                                      |
|-----------------|------------------------------------------------------|
| Code            | in_range(1614.84,MM,2114.84)                         |
| Inputs          | [ 'Phys/D2KsPi0HHSubPIDSelBeauty2CharmDD_Merged' ] |
| DecayDescriptor | None                                                 |
| Output          | Phys/D2KsPi0HHDD_MergedBeauty2CharmFilter/Particles  |

FilterDesktop/PiTopoInputsBeauty2CharmFilter

|                 |                                                                   |
|-----------------|-------------------------------------------------------------------|
| Code            | HASTRACK & (TRCHI2DOF\<2.5) & (PT \> 500\*MeV) & (P \> 5000\*MeV) |
| Inputs          | [ 'Phys/PiInputsBeauty2CharmFilter' ]                           |
| DecayDescriptor | None                                                              |
| Output          | Phys/PiTopoInputsBeauty2CharmFilter/Particles                     |

CombineParticles/B2D0PiD2KSPi0HHDDMergedBeauty2Charm

|                  |                                                                                                                                                                                                                                                                                                                                                                                                          |
|------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Inputs           | [ 'Phys/D2KsPi0HHDD_MergedBeauty2CharmFilter' , 'Phys/PiTopoInputsBeauty2CharmFilter' ]                                                                                                                                                                                                                                                                                                                |
| DaughtersCuts    | { '' : 'ALL' , 'D0' : 'ALL' , 'D~0' : 'ALL' , 'pi+' : 'ALL' , 'pi-' : 'ALL' }                                                                                                                                                                                                                                                                                                                            |
| CombinationCut   | (ASUM(SUMTREE(PT,(ISBASIC \| (ID=='gamma')),0.0))\>5000\*MeV) & (AM\<7000\*MeV) & (AM\>4750\*MeV)                                                                                                                                                                                                                                                                                                        |
| MotherCut        | (VFASPF(VCHI2/VDOF)\<10) & (INTREE(HASTRACK & (P\>10000\*MeV) & (PT\>1700\*MeV) & (TRCHI2DOF\<2.5) & (MIPCHI2DV(PRIMARY)\>16) & (MIPDV(PRIMARY)\>0.1\*mm))) & (NINTREE((ISBASIC & HASTRACK & (TRCHI2DOF\<2.5) & (PT \> 500\*MeV) & (P \> 5000\*MeV))\|((ABSID=='KS0') & (PT \> 500\*MeV) & (P \> 5000\*MeV) & (BPVVDCHI2 \> 1000))) \> 1) & (BPVLTIME()\>0.2\*ps) & (BPVIPCHI2()\<25) & (BPVDIRA\>0.999) |
| DecayDescriptor  | None                                                                                                                                                                                                                                                                                                                                                                                                     |
| DecayDescriptors | [ 'B+ -\> D0 pi+' , 'B- -\> D0 pi-' ]                                                                                                                                                                                                                                                                                                                                                                  |
| Output           | Phys/B2D0PiD2KSPi0HHDDMergedBeauty2Charm/Particles                                                                                                                                                                                                                                                                                                                                                       |

TisTosParticleTagger/B2D0PiD2KSPi0HHDDMergedBeauty2CharmTISTOS

|                 |                                                                                                                                       |
|-----------------|---------------------------------------------------------------------------------------------------------------------------------------|
| Inputs          | [ 'Phys/B2D0PiD2KSPi0HHDDMergedBeauty2Charm' ]                                                                                      |
| DecayDescriptor | None                                                                                                                                  |
| Output          | Phys/B2D0PiD2KSPi0HHDDMergedBeauty2CharmTISTOS/Particles                                                                              |
| TisTosSpecs     | { 'Hlt2IncPhi.\*Decision%TIS' : 0 , 'Hlt2IncPhi.\*Decision%TOS' : 0 , 'Hlt2Topo.\*Decision%TIS' : 0 , 'Hlt2Topo.\*Decision%TOS' : 0 } |

FilterDesktop/B2D0PiD2KSPi0HHDDMergedBeauty2CharmB2CBBDTBeauty2CharmFilter

|                 |                                                                             |
|-----------------|-----------------------------------------------------------------------------|
| Code            | FILTER('BBDecTreeTool/B2CBBDT')                                             |
| Inputs          | [ 'Phys/B2D0PiD2KSPi0HHDDMergedBeauty2CharmTISTOS' ]                      |
| DecayDescriptor | None                                                                        |
| Output          | Phys/B2D0PiD2KSPi0HHDDMergedBeauty2CharmB2CBBDTBeauty2CharmFilter/Particles |

FilterDesktop/B2D0PiD2KSPi0HHDDMergedBeauty2CharmLine

|                 |                                                                           |
|-----------------|---------------------------------------------------------------------------|
| Code            | ALL                                                                       |
| Inputs          | [ 'Phys/B2D0PiD2KSPi0HHDDMergedBeauty2CharmB2CBBDTBeauty2CharmFilter' ] |
| DecayDescriptor | None                                                                      |
| Output          | Phys/B2D0PiD2KSPi0HHDDMergedBeauty2CharmLine/Particles                    |

AddRelatedInfo/RelatedInfo1_B2D0PiD2KSPi0HHDDMergedBeauty2CharmLine

|                 |                                                                     |
|-----------------|---------------------------------------------------------------------|
| Inputs          | [ 'Phys/B2D0PiD2KSPi0HHDDMergedBeauty2CharmLine' ]                |
| DecayDescriptor | None                                                                |
| Output          | Phys/RelatedInfo1_B2D0PiD2KSPi0HHDDMergedBeauty2CharmLine/Particles |

AddRelatedInfo/RelatedInfo2_B2D0PiD2KSPi0HHDDMergedBeauty2CharmLine

|                 |                                                                     |
|-----------------|---------------------------------------------------------------------|
| Inputs          | [ 'Phys/B2D0PiD2KSPi0HHDDMergedBeauty2CharmLine' ]                |
| DecayDescriptor | None                                                                |
| Output          | Phys/RelatedInfo2_B2D0PiD2KSPi0HHDDMergedBeauty2CharmLine/Particles |

AddRelatedInfo/RelatedInfo3_B2D0PiD2KSPi0HHDDMergedBeauty2CharmLine

|                 |                                                                     |
|-----------------|---------------------------------------------------------------------|
| Inputs          | [ 'Phys/B2D0PiD2KSPi0HHDDMergedBeauty2CharmLine' ]                |
| DecayDescriptor | None                                                                |
| Output          | Phys/RelatedInfo3_B2D0PiD2KSPi0HHDDMergedBeauty2CharmLine/Particles |
