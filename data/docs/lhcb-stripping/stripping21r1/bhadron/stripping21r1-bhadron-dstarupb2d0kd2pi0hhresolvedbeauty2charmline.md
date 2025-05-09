[[stripping21r1 lines]](./stripping21r1-index)

# StrippingDstarUPB2D0KD2Pi0HHResolvedBeauty2CharmLine

## Properties:

|                |                                                                              |
|----------------|------------------------------------------------------------------------------|
| OutputLocation | Phys/DstarUPB2D0KD2Pi0HHResolvedBeauty2CharmLine/Particles                   |
| Postscale      | 1.0000000                                                                    |
| HLT            | (HLT_PASS_RE('Hlt2Topo.\*Decision') \| HLT_PASS_RE('Hlt2IncPhi.\*Decision')) |
| Prescale       | 1.0000000                                                                    |
| L0DU           | None                                                                         |
| ODIN           | None                                                                         |

## Filter sequence:

LoKi::VoidFilter/StrippingDstarUPB2D0KD2Pi0HHResolvedBeauty2CharmLineVOIDFilter

|      |                                                                |
|------|----------------------------------------------------------------|
| Code | (recSummaryTrack(LHCb.RecSummary.nLongTracks, TrLONG) \< 500 ) |

CheckPV/checkPVmin1

|        |     |
|--------|-----|
| MinPVs | 1   |
| MaxPVs | -1  |

LoKi::VoidFilter/SelFilterPhys_StdNoPIDsUpPions_Particles

|      |                                                                                                    |
|------|----------------------------------------------------------------------------------------------------|
| Code | CONTAINS('Phys/[StdNoPIDsUpPions](./stripping21r1-commonparticles-stdnopidsuppions)/Particles')\>0 |

FilterDesktop/PiUPInputsBeauty2CharmFilter

|                 |                                                                                   |
|-----------------|-----------------------------------------------------------------------------------|
| Code            | (TRCHI2DOF\<4.0) & (PT\>100\*MeV) & (P\>1000\*MeV) & (MIPCHI2DV(PRIMARY)\>4.0)    |
| Inputs          | [ 'Phys/[StdNoPIDsUpPions](./stripping21r1-commonparticles-stdnopidsuppions)' ] |
| DecayDescriptor | None                                                                              |
| Output          | Phys/PiUPInputsBeauty2CharmFilter/Particles                                       |

LoKi::VoidFilter/SelFilterPhys_StdAllNoPIDsPions_Particles

|      |                                                                                                      |
|------|------------------------------------------------------------------------------------------------------|
| Code | CONTAINS('Phys/[StdAllNoPIDsPions](./stripping21r1-commonparticles-stdallnopidspions)/Particles')\>0 |

FilterDesktop/PiInputsBeauty2CharmFilter

|                 |                                                                                               |
|-----------------|-----------------------------------------------------------------------------------------------|
| Code            | (TRCHI2DOF\<3.0) & (PT\>100\*MeV) & (P\>1000\*MeV) & (MIPCHI2DV(PRIMARY)\>4.0) & (TRGHP\<0.4) |
| Inputs          | [ 'Phys/[StdAllNoPIDsPions](./stripping21r1-commonparticles-stdallnopidspions)' ]           |
| DecayDescriptor | None                                                                                          |
| Output          | Phys/PiInputsBeauty2CharmFilter/Particles                                                     |

LoKi::VoidFilter/SelFilterPhys_StdLooseResolvedPi0_Particles

|      |                                                                                                          |
|------|----------------------------------------------------------------------------------------------------------|
| Code | CONTAINS('Phys/[StdLooseResolvedPi0](./stripping21r1-commonparticles-stdlooseresolvedpi0)/Particles')\>0 |

FilterDesktop/Pi0ResolvedInputsBeauty2CharmFilter

|                 |                                                                                            |
|-----------------|--------------------------------------------------------------------------------------------|
| Code            | (ABSID==111) & (PT\>500\*MeV) & (P\>1000\*MeV) & (CHILD(CL,1)\>0.25) & (CHILD(CL,2)\>0.25) |
| Inputs          | [ 'Phys/[StdLooseResolvedPi0](./stripping21r1-commonparticles-stdlooseresolvedpi0)' ]    |
| DecayDescriptor | None                                                                                       |
| Output          | Phys/Pi0ResolvedInputsBeauty2CharmFilter/Particles                                         |

CombineParticles/ProtoD2Pi0HH_ResolvedBeauty2Charm

|                  |                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
|------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Inputs           | [ 'Phys/Pi0ResolvedInputsBeauty2CharmFilter' , 'Phys/PiInputsBeauty2CharmFilter' ]                                                                                                                                                                                                                                                                                                                                                                                    |
| DaughtersCuts    | { '' : 'ALL' , 'pi+' : 'ALL' , 'pi-' : 'ALL' , 'pi0' : 'ALL' }                                                                                                                                                                                                                                                                                                                                                                                                          |
| CombinationCut   | (ASUM(PT)\>1800\*MeV) & (in_range(1614.84\*MeV,AWM('pi0','pi+','pi-'),2114.84\*MeV)\|in_range(1614.84\*MeV,AWM('pi0','pi+','K-'),2114.84\*MeV)\|in_range(1614.84\*MeV,AWM('pi0','K+','pi-'),2114.84\*MeV)\|in_range(1614.84\*MeV,AWM('pi0','K+','K-'),2114.84\*MeV)) & (AHASCHILD((ISBASIC & HASTRACK & (TRCHI2DOF\<2.5) & (PT \> 500\*MeV) & (P \> 5000\*MeV))\|((ABSID=='KS0') & (PT \> 500\*MeV) & (P \> 5000\*MeV) & (BPVVDCHI2 \> 1000)))) & (ADOCA(2,3)\<0.5\*mm) |
| MotherCut        | (VFASPF(VCHI2/VDOF)\<10) & (BPVVDCHI2\>36) & (BPVDIRA\>0)                                                                                                                                                                                                                                                                                                                                                                                                               |
| DecayDescriptor  | None                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| DecayDescriptors | [ 'D0 -\> pi0 pi+ pi-' ]                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Output           | Phys/ProtoD2Pi0HH_ResolvedBeauty2Charm/Particles                                                                                                                                                                                                                                                                                                                                                                                                                        |

SubPIDMMFilter/D2Pi0HHSubPIDSelBeauty2CharmResolved

|                 |                                                                                                                         |
|-----------------|-------------------------------------------------------------------------------------------------------------------------|
| Code            | ALL                                                                                                                     |
| Inputs          | [ 'Phys/ProtoD2Pi0HH_ResolvedBeauty2Charm' ]                                                                          |
| DecayDescriptor | None                                                                                                                    |
| Output          | Phys/D2Pi0HHSubPIDSelBeauty2CharmResolved/Particles                                                                     |
| MaxMM           | 2114.8400                                                                                                               |
| MinMM           | 1614.8400                                                                                                               |
| PIDs            | [ [ 'pi0' , 'pi+' , 'pi-' ] , [ 'pi0' , 'pi+' , 'K-' ] , [ 'pi0' , 'K+' , 'pi-' ] , [ 'pi0' , 'K+' , 'K-' ] ] |

FilterDesktop/D2Pi0HHResolvedBeauty2CharmFilter

|                 |                                                   |
|-----------------|---------------------------------------------------|
| Code            | in_range(1614.84,MM,2114.84)                      |
| Inputs          | [ 'Phys/D2Pi0HHSubPIDSelBeauty2CharmResolved' ] |
| DecayDescriptor | None                                              |
| Output          | Phys/D2Pi0HHResolvedBeauty2CharmFilter/Particles  |

LoKi::VoidFilter/SelFilterPhys_StdAllNoPIDsKaons_Particles

|      |                                                                                                      |
|------|------------------------------------------------------------------------------------------------------|
| Code | CONTAINS('Phys/[StdAllNoPIDsKaons](./stripping21r1-commonparticles-stdallnopidskaons)/Particles')\>0 |

FilterDesktop/KInputsBeauty2CharmFilter

|                 |                                                                                               |
|-----------------|-----------------------------------------------------------------------------------------------|
| Code            | (TRCHI2DOF\<3.0) & (PT\>100\*MeV) & (P\>1000\*MeV) & (MIPCHI2DV(PRIMARY)\>4.0) & (TRGHP\<0.4) |
| Inputs          | [ 'Phys/[StdAllNoPIDsKaons](./stripping21r1-commonparticles-stdallnopidskaons)' ]           |
| DecayDescriptor | None                                                                                          |
| Output          | Phys/KInputsBeauty2CharmFilter/Particles                                                      |

FilterDesktop/KTopoInputsBeauty2CharmFilter

|                 |                                                                   |
|-----------------|-------------------------------------------------------------------|
| Code            | HASTRACK & (TRCHI2DOF\<2.5) & (PT \> 500\*MeV) & (P \> 5000\*MeV) |
| Inputs          | [ 'Phys/KInputsBeauty2CharmFilter' ]                            |
| DecayDescriptor | None                                                              |
| Output          | Phys/KTopoInputsBeauty2CharmFilter/Particles                      |

CombineParticles/B2D0KD2Pi0HHResolvedBeauty2Charm

|                  |                                                                                                                                                                                                                                                                                                                                                                                                          |
|------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Inputs           | [ 'Phys/D2Pi0HHResolvedBeauty2CharmFilter' , 'Phys/KTopoInputsBeauty2CharmFilter' ]                                                                                                                                                                                                                                                                                                                    |
| DaughtersCuts    | { '' : 'ALL' , 'D0' : 'ALL' , 'D~0' : 'ALL' , 'K+' : 'ALL' , 'K-' : 'ALL' }                                                                                                                                                                                                                                                                                                                              |
| CombinationCut   | (ASUM(SUMTREE(PT,(ISBASIC \| (ID=='gamma')),0.0))\>5000\*MeV) & (AM\<7000\*MeV) & (AM\>4750\*MeV)                                                                                                                                                                                                                                                                                                        |
| MotherCut        | (VFASPF(VCHI2/VDOF)\<10) & (INTREE(HASTRACK & (P\>10000\*MeV) & (PT\>1700\*MeV) & (TRCHI2DOF\<2.5) & (MIPCHI2DV(PRIMARY)\>16) & (MIPDV(PRIMARY)\>0.1\*mm))) & (NINTREE((ISBASIC & HASTRACK & (TRCHI2DOF\<2.5) & (PT \> 500\*MeV) & (P \> 5000\*MeV))\|((ABSID=='KS0') & (PT \> 500\*MeV) & (P \> 5000\*MeV) & (BPVVDCHI2 \> 1000))) \> 1) & (BPVLTIME()\>0.2\*ps) & (BPVIPCHI2()\<25) & (BPVDIRA\>0.999) |
| DecayDescriptor  | None                                                                                                                                                                                                                                                                                                                                                                                                     |
| DecayDescriptors | [ 'B+ -\> D0 K+' , 'B- -\> D0 K-' ]                                                                                                                                                                                                                                                                                                                                                                    |
| Output           | Phys/B2D0KD2Pi0HHResolvedBeauty2Charm/Particles                                                                                                                                                                                                                                                                                                                                                          |

TisTosParticleTagger/B2D0KD2Pi0HHResolvedBeauty2CharmTISTOS

|                 |                                                                                                                                       |
|-----------------|---------------------------------------------------------------------------------------------------------------------------------------|
| Inputs          | [ 'Phys/B2D0KD2Pi0HHResolvedBeauty2Charm' ]                                                                                         |
| DecayDescriptor | None                                                                                                                                  |
| Output          | Phys/B2D0KD2Pi0HHResolvedBeauty2CharmTISTOS/Particles                                                                                 |
| TisTosSpecs     | { 'Hlt2IncPhi.\*Decision%TIS' : 0 , 'Hlt2IncPhi.\*Decision%TOS' : 0 , 'Hlt2Topo.\*Decision%TIS' : 0 , 'Hlt2Topo.\*Decision%TOS' : 0 } |

FilterDesktop/B2D0KD2Pi0HHResolvedBeauty2CharmB2CBBDTBeauty2CharmFilter

|                 |                                                                          |
|-----------------|--------------------------------------------------------------------------|
| Code            | FILTER('BBDecTreeTool/B2CBBDT')                                          |
| Inputs          | [ 'Phys/B2D0KD2Pi0HHResolvedBeauty2CharmTISTOS' ]                      |
| DecayDescriptor | None                                                                     |
| Output          | Phys/B2D0KD2Pi0HHResolvedBeauty2CharmB2CBBDTBeauty2CharmFilter/Particles |

SubstitutePID/B2D0KD2Pi0HHResolvedBeauty2CharmB2CBBDTBeauty2CharmFilterDstarUPSel

|                 |                                                                                    |
|-----------------|------------------------------------------------------------------------------------|
| Code            | DECTREE('Beauty -\> Charm ...')                                                    |
| Inputs          | [ 'Phys/B2D0KD2Pi0HHResolvedBeauty2CharmB2CBBDTBeauty2CharmFilter' ]             |
| DecayDescriptor | None                                                                               |
| Output          | Phys/B2D0KD2Pi0HHResolvedBeauty2CharmB2CBBDTBeauty2CharmFilterDstarUPSel/Particles |
| Substitutions   | { 'Beauty -\> Charm ...' : 'J/psi(1S)' }                                           |

FilterDesktop/B2D0KD2Pi0HHResolvedBeauty2CharmB2CBBDTBeauty2CharmFilterDstarUPFilterBeauty2CharmFilter

|                 |                                                                                                         |
|-----------------|---------------------------------------------------------------------------------------------------------|
| Code            | INTREE(ID=='J/psi(1S)')                                                                                 |
| Inputs          | [ 'Phys/B2D0KD2Pi0HHResolvedBeauty2CharmB2CBBDTBeauty2CharmFilterDstarUPSel' ]                        |
| DecayDescriptor | None                                                                                                    |
| Output          | Phys/B2D0KD2Pi0HHResolvedBeauty2CharmB2CBBDTBeauty2CharmFilterDstarUPFilterBeauty2CharmFilter/Particles |

CombineParticles/DstarUPB2D0KD2Pi0HHResolvedBeauty2CharmB2CBBDTBeauty2CharmFilter

|                  |                                                                                                                                                               |
|------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Inputs           | [ 'Phys/B2D0KD2Pi0HHResolvedBeauty2CharmB2CBBDTBeauty2CharmFilterDstarUPFilterBeauty2CharmFilter' , 'Phys/PiUPInputsBeauty2CharmFilter' ]                   |
| DaughtersCuts    | { '' : 'ALL' , 'J/psi(1S)' : 'ALL' , 'pi+' : 'ALL' , 'pi-' : 'ALL' }                                                                                          |
| CombinationCut   | (ACUTDOCA(0.5\*mm,'LoKi::DistanceCalculator')) & ((((IDD1==421)\|(IDD1==411)) & ((MD1PI-MD1) \< 180)) \| (((IDD2==421)\|(IDD2==411)) & ((MD2PI-MD2) \< 180))) |
| MotherCut        | (VFASPF(VCHI2/VDOF)\<10) & (BPVDIRA\>0.999)                                                                                                                   |
| DecayDescriptor  | [B+ -\> J/psi(1S) pi+]cc                                                                                                                                    |
| DecayDescriptors | [ '[B+ -\> J/psi(1S) pi+]cc' ]                                                                                                                            |
| Output           | Phys/DstarUPB2D0KD2Pi0HHResolvedBeauty2CharmB2CBBDTBeauty2CharmFilter/Particles                                                                               |

FilterDesktop/DstarUPB2D0KD2Pi0HHResolvedBeauty2CharmLine

|                 |                                                                               |
|-----------------|-------------------------------------------------------------------------------|
| Code            | ALL                                                                           |
| Inputs          | [ 'Phys/DstarUPB2D0KD2Pi0HHResolvedBeauty2CharmB2CBBDTBeauty2CharmFilter' ] |
| DecayDescriptor | None                                                                          |
| Output          | Phys/DstarUPB2D0KD2Pi0HHResolvedBeauty2CharmLine/Particles                    |

AddRelatedInfo/RelatedInfo1_DstarUPB2D0KD2Pi0HHResolvedBeauty2CharmLine

|                 |                                                                         |
|-----------------|-------------------------------------------------------------------------|
| Inputs          | [ 'Phys/DstarUPB2D0KD2Pi0HHResolvedBeauty2CharmLine' ]                |
| DecayDescriptor | None                                                                    |
| Output          | Phys/RelatedInfo1_DstarUPB2D0KD2Pi0HHResolvedBeauty2CharmLine/Particles |

AddRelatedInfo/RelatedInfo2_DstarUPB2D0KD2Pi0HHResolvedBeauty2CharmLine

|                 |                                                                         |
|-----------------|-------------------------------------------------------------------------|
| Inputs          | [ 'Phys/DstarUPB2D0KD2Pi0HHResolvedBeauty2CharmLine' ]                |
| DecayDescriptor | None                                                                    |
| Output          | Phys/RelatedInfo2_DstarUPB2D0KD2Pi0HHResolvedBeauty2CharmLine/Particles |

AddRelatedInfo/RelatedInfo3_DstarUPB2D0KD2Pi0HHResolvedBeauty2CharmLine

|                 |                                                                         |
|-----------------|-------------------------------------------------------------------------|
| Inputs          | [ 'Phys/DstarUPB2D0KD2Pi0HHResolvedBeauty2CharmLine' ]                |
| DecayDescriptor | None                                                                    |
| Output          | Phys/RelatedInfo3_DstarUPB2D0KD2Pi0HHResolvedBeauty2CharmLine/Particles |
