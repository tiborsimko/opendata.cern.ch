[[stripping21r1 lines]](./stripping21r1-index)

# StrippingB02DPiWSD2KSHLLBeauty2CharmLine

## Properties:

|                |                                                                              |
|----------------|------------------------------------------------------------------------------|
| OutputLocation | Phys/B02DPiWSD2KSHLLBeauty2CharmLine/Particles                               |
| Postscale      | 1.0000000                                                                    |
| HLT            | (HLT_PASS_RE('Hlt2Topo.\*Decision') \| HLT_PASS_RE('Hlt2IncPhi.\*Decision')) |
| Prescale       | 0.10000000                                                                   |
| L0DU           | None                                                                         |
| ODIN           | None                                                                         |

## Filter sequence:

LoKi::VoidFilter/StrippingB02DPiWSD2KSHLLBeauty2CharmLineVOIDFilter

|      |                                                                |
|------|----------------------------------------------------------------|
| Code | (recSummaryTrack(LHCb.RecSummary.nLongTracks, TrLONG) \< 500 ) |

CheckPV/checkPVmin1

|        |     |
|--------|-----|
| MinPVs | 1   |
| MaxPVs | -1  |

GaudiSequencer/SeqD2KsHBeauty2Charm_LL

GaudiSequencer/SEQ:D+2KsHLLBeauty2CharmFilter

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

LoKi::VoidFilter/SelFilterPhys_StdLooseKsLL_Particles

|      |                                                                                            |
|------|--------------------------------------------------------------------------------------------|
| Code | CONTAINS('Phys/[StdLooseKsLL](./stripping21r1-commonparticles-stdlooseksll)/Particles')\>0 |

FilterDesktop/KS0_LLInputsBeauty2CharmFilter

|                 |                                                                           |
|-----------------|---------------------------------------------------------------------------|
| Code            | (PT\>250\*MeV) & (MM\>467.\*MeV) & (MM\<527.\*MeV)                        |
| Inputs          | [ 'Phys/[StdLooseKsLL](./stripping21r1-commonparticles-stdlooseksll)' ] |
| DecayDescriptor | None                                                                      |
| Output          | Phys/KS0_LLInputsBeauty2CharmFilter/Particles                             |

CombineParticles/ProtoD+2KsH_LLBeauty2Charm

|                  |                                                                                                                                                                                                                                                                                                                |
|------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Inputs           | [ 'Phys/KS0_LLInputsBeauty2CharmFilter' , 'Phys/PiInputsBeauty2CharmFilter' ]                                                                                                                                                                                                                                |
| DaughtersCuts    | { '' : 'ALL' , 'KS0' : 'ALL' , 'pi+' : 'ALL' , 'pi-' : 'ALL' }                                                                                                                                                                                                                                                 |
| CombinationCut   | (ASUM(PT)\>1800\*MeV) & (in_range(1769.62\*MeV,AWM('KS0','pi+'),2068.49\*MeV)\|in_range(1769.62\*MeV,AWM('KS0','K+'),2068.49\*MeV)) & (AHASCHILD((ISBASIC & HASTRACK & (TRCHI2DOF\<2.5) & (PT \> 500\*MeV) & (P \> 5000\*MeV))\|((ABSID=='KS0') & (PT \> 500\*MeV) & (P \> 5000\*MeV) & (BPVVDCHI2 \> 1000)))) |
| MotherCut        | (VFASPF(VCHI2/VDOF)\<10) & (BPVVDCHI2\>36) & (BPVDIRA\>0)                                                                                                                                                                                                                                                      |
| DecayDescriptor  | None                                                                                                                                                                                                                                                                                                           |
| DecayDescriptors | [ 'D+ -\> KS0 pi+' ]                                                                                                                                                                                                                                                                                         |
| Output           | Phys/ProtoD+2KsH_LLBeauty2Charm/Particles                                                                                                                                                                                                                                                                      |

SubPIDMMFilter/D+2KsHSubPIDSelBeauty2CharmLL

|                 |                                                |
|-----------------|------------------------------------------------|
| Code            | ALL                                            |
| Inputs          | [ 'Phys/ProtoD+2KsH_LLBeauty2Charm' ]        |
| DecayDescriptor | None                                           |
| Output          | Phys/D+2KsHSubPIDSelBeauty2CharmLL/Particles   |
| MaxMM           | 2068.4900                                      |
| MinMM           | 1769.6200                                      |
| PIDs            | [ [ 'KS0' , 'pi+' ] , [ 'KS0' , 'K+' ] ] |

FilterDesktop/D+2KsHLLBeauty2CharmFilter

|                 |                                            |
|-----------------|--------------------------------------------|
| Code            | in_range(1769.62,MM,2068.49)               |
| Inputs          | [ 'Phys/D+2KsHSubPIDSelBeauty2CharmLL' ] |
| DecayDescriptor | None                                       |
| Output          | Phys/D+2KsHLLBeauty2CharmFilter/Particles  |

|                    |       |
|--------------------|-------|
| ModeOR             | False |
| IgnoreFilterPassed | False |

GaudiSequencer/SEQ:D-2KsHLLBeauty2CharmFilter

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

LoKi::VoidFilter/SelFilterPhys_StdLooseKsLL_Particles

|      |                                                                                            |
|------|--------------------------------------------------------------------------------------------|
| Code | CONTAINS('Phys/[StdLooseKsLL](./stripping21r1-commonparticles-stdlooseksll)/Particles')\>0 |

FilterDesktop/KS0_LLInputsBeauty2CharmFilter

|                 |                                                                           |
|-----------------|---------------------------------------------------------------------------|
| Code            | (PT\>250\*MeV) & (MM\>467.\*MeV) & (MM\<527.\*MeV)                        |
| Inputs          | [ 'Phys/[StdLooseKsLL](./stripping21r1-commonparticles-stdlooseksll)' ] |
| DecayDescriptor | None                                                                      |
| Output          | Phys/KS0_LLInputsBeauty2CharmFilter/Particles                             |

CombineParticles/ProtoD-2KsH_LLBeauty2Charm

|                  |                                                                                                                                                                                                                                                                                                                |
|------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Inputs           | [ 'Phys/KS0_LLInputsBeauty2CharmFilter' , 'Phys/PiInputsBeauty2CharmFilter' ]                                                                                                                                                                                                                                |
| DaughtersCuts    | { '' : 'ALL' , 'KS0' : 'ALL' , 'pi+' : 'ALL' , 'pi-' : 'ALL' }                                                                                                                                                                                                                                                 |
| CombinationCut   | (ASUM(PT)\>1800\*MeV) & (in_range(1769.62\*MeV,AWM('KS0','pi+'),2068.49\*MeV)\|in_range(1769.62\*MeV,AWM('KS0','K+'),2068.49\*MeV)) & (AHASCHILD((ISBASIC & HASTRACK & (TRCHI2DOF\<2.5) & (PT \> 500\*MeV) & (P \> 5000\*MeV))\|((ABSID=='KS0') & (PT \> 500\*MeV) & (P \> 5000\*MeV) & (BPVVDCHI2 \> 1000)))) |
| MotherCut        | (VFASPF(VCHI2/VDOF)\<10) & (BPVVDCHI2\>36) & (BPVDIRA\>0)                                                                                                                                                                                                                                                      |
| DecayDescriptor  | None                                                                                                                                                                                                                                                                                                           |
| DecayDescriptors | [ 'D- -\> KS0 pi-' ]                                                                                                                                                                                                                                                                                         |
| Output           | Phys/ProtoD-2KsH_LLBeauty2Charm/Particles                                                                                                                                                                                                                                                                      |

SubPIDMMFilter/D-2KsHSubPIDSelBeauty2CharmLL

|                 |                                                |
|-----------------|------------------------------------------------|
| Code            | ALL                                            |
| Inputs          | [ 'Phys/ProtoD-2KsH_LLBeauty2Charm' ]        |
| DecayDescriptor | None                                           |
| Output          | Phys/D-2KsHSubPIDSelBeauty2CharmLL/Particles   |
| MaxMM           | 2068.4900                                      |
| MinMM           | 1769.6200                                      |
| PIDs            | [ [ 'KS0' , 'pi-' ] , [ 'KS0' , 'K-' ] ] |

FilterDesktop/D-2KsHLLBeauty2CharmFilter

|                 |                                            |
|-----------------|--------------------------------------------|
| Code            | in_range(1769.62,MM,2068.49)               |
| Inputs          | [ 'Phys/D-2KsHSubPIDSelBeauty2CharmLL' ] |
| DecayDescriptor | None                                       |
| Output          | Phys/D-2KsHLLBeauty2CharmFilter/Particles  |

|                    |       |
|--------------------|-------|
| ModeOR             | False |
| IgnoreFilterPassed | False |

FilterDesktop/D2KsHBeauty2Charm_LL

|                 |                                                                             |
|-----------------|-----------------------------------------------------------------------------|
| Code            | ALL                                                                         |
| Inputs          | [ 'Phys/D+2KsHLLBeauty2CharmFilter' , 'Phys/D-2KsHLLBeauty2CharmFilter' ] |
| DecayDescriptor | None                                                                        |
| Output          | Phys/D2KsHBeauty2Charm_LL/Particles                                         |

|                    |       |
|--------------------|-------|
| ModeOR             | True  |
| IgnoreFilterPassed | False |

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

FilterDesktop/PiTopoInputsBeauty2CharmFilter

|                 |                                                                   |
|-----------------|-------------------------------------------------------------------|
| Code            | HASTRACK & (TRCHI2DOF\<2.5) & (PT \> 500\*MeV) & (P \> 5000\*MeV) |
| Inputs          | [ 'Phys/PiInputsBeauty2CharmFilter' ]                           |
| DecayDescriptor | None                                                              |
| Output          | Phys/PiTopoInputsBeauty2CharmFilter/Particles                     |

CombineParticles/B02DPiWSD2KSHLLBeauty2Charm

|                  |                                                                                                                                                                                                                                                                                                                                                                                                          |
|------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Inputs           | [ 'Phys/D2KsHBeauty2Charm_LL' , 'Phys/PiTopoInputsBeauty2CharmFilter' ]                                                                                                                                                                                                                                                                                                                                |
| DaughtersCuts    | { '' : 'ALL' , 'D+' : 'ALL' , 'D-' : 'ALL' , 'pi+' : 'ALL' , 'pi-' : 'ALL' }                                                                                                                                                                                                                                                                                                                             |
| CombinationCut   | (ASUM(SUMTREE(PT,(ISBASIC \| (ID=='gamma')),0.0))\>5000\*MeV) & (AM\<6000\*MeV) & (AM\>4750\*MeV)                                                                                                                                                                                                                                                                                                        |
| MotherCut        | (VFASPF(VCHI2/VDOF)\<10) & (INTREE(HASTRACK & (P\>10000\*MeV) & (PT\>1700\*MeV) & (TRCHI2DOF\<2.5) & (MIPCHI2DV(PRIMARY)\>16) & (MIPDV(PRIMARY)\>0.1\*mm))) & (NINTREE((ISBASIC & HASTRACK & (TRCHI2DOF\<2.5) & (PT \> 500\*MeV) & (P \> 5000\*MeV))\|((ABSID=='KS0') & (PT \> 500\*MeV) & (P \> 5000\*MeV) & (BPVVDCHI2 \> 1000))) \> 1) & (BPVLTIME()\>0.2\*ps) & (BPVIPCHI2()\<25) & (BPVDIRA\>0.999) |
| DecayDescriptor  | None                                                                                                                                                                                                                                                                                                                                                                                                     |
| DecayDescriptors | [ '[B0 -\> D- pi-]cc' ]                                                                                                                                                                                                                                                                                                                                                                              |
| Output           | Phys/B02DPiWSD2KSHLLBeauty2Charm/Particles                                                                                                                                                                                                                                                                                                                                                               |

TisTosParticleTagger/B02DPiWSD2KSHLLBeauty2CharmTISTOS

|                 |                                                                                                                                       |
|-----------------|---------------------------------------------------------------------------------------------------------------------------------------|
| Inputs          | [ 'Phys/B02DPiWSD2KSHLLBeauty2Charm' ]                                                                                              |
| DecayDescriptor | None                                                                                                                                  |
| Output          | Phys/B02DPiWSD2KSHLLBeauty2CharmTISTOS/Particles                                                                                      |
| TisTosSpecs     | { 'Hlt2IncPhi.\*Decision%TIS' : 0 , 'Hlt2IncPhi.\*Decision%TOS' : 0 , 'Hlt2Topo.\*Decision%TIS' : 0 , 'Hlt2Topo.\*Decision%TOS' : 0 } |

FilterDesktop/B02DPiWSD2KSHLLBeauty2CharmB2CBBDTBeauty2CharmFilter

|                 |                                                                     |
|-----------------|---------------------------------------------------------------------|
| Code            | FILTER('BBDecTreeTool/B2CBBDT')                                     |
| Inputs          | [ 'Phys/B02DPiWSD2KSHLLBeauty2CharmTISTOS' ]                      |
| DecayDescriptor | None                                                                |
| Output          | Phys/B02DPiWSD2KSHLLBeauty2CharmB2CBBDTBeauty2CharmFilter/Particles |

FilterDesktop/B02DPiWSD2KSHLLBeauty2CharmLine

|                 |                                                                   |
|-----------------|-------------------------------------------------------------------|
| Code            | ALL                                                               |
| Inputs          | [ 'Phys/B02DPiWSD2KSHLLBeauty2CharmB2CBBDTBeauty2CharmFilter' ] |
| DecayDescriptor | None                                                              |
| Output          | Phys/B02DPiWSD2KSHLLBeauty2CharmLine/Particles                    |

AddRelatedInfo/RelatedInfo1_B02DPiWSD2KSHLLBeauty2CharmLine

|                 |                                                             |
|-----------------|-------------------------------------------------------------|
| Inputs          | [ 'Phys/B02DPiWSD2KSHLLBeauty2CharmLine' ]                |
| DecayDescriptor | None                                                        |
| Output          | Phys/RelatedInfo1_B02DPiWSD2KSHLLBeauty2CharmLine/Particles |

AddRelatedInfo/RelatedInfo2_B02DPiWSD2KSHLLBeauty2CharmLine

|                 |                                                             |
|-----------------|-------------------------------------------------------------|
| Inputs          | [ 'Phys/B02DPiWSD2KSHLLBeauty2CharmLine' ]                |
| DecayDescriptor | None                                                        |
| Output          | Phys/RelatedInfo2_B02DPiWSD2KSHLLBeauty2CharmLine/Particles |

AddRelatedInfo/RelatedInfo3_B02DPiWSD2KSHLLBeauty2CharmLine

|                 |                                                             |
|-----------------|-------------------------------------------------------------|
| Inputs          | [ 'Phys/B02DPiWSD2KSHLLBeauty2CharmLine' ]                |
| DecayDescriptor | None                                                        |
| Output          | Phys/RelatedInfo3_B02DPiWSD2KSHLLBeauty2CharmLine/Particles |
