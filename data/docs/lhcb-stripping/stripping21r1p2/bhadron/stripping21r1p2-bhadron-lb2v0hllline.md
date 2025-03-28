[[stripping21r1p2 lines]](./stripping21r1p2-index)

# StrippingLb2V0hLLLine

## Properties:

|                |                             |
|----------------|-----------------------------|
| OutputLocation | Phys/Lb2V0hLLLine/Particles |
| Postscale      | 1.0000000                   |
| HLT1           | None                        |
| HLT2           | None                        |
| Prescale       | 1.0000000                   |
| L0DU           | None                        |
| ODIN           | None                        |

## Filter sequence:

LoKi::VoidFilter/StrippingGoodEventConditionBhadron

|      |                                                                                                |
|------|------------------------------------------------------------------------------------------------|
| Code | ALG_EXECUTED('StrippingStreamBhadronBadEvent') & ~ALG_PASSED('StrippingStreamBhadronBadEvent') |

LoKi::VoidFilter/StrippingLb2V0hLLLineVOIDFilter

|      |                                                               |
|------|---------------------------------------------------------------|
| Code | (recSummaryTrack(LHCb.RecSummary.nLongTracks, TrLONG) \< 250) |

CheckPV/checkPVmin1

|        |     |
|--------|-----|
| MinPVs | 1   |
| MaxPVs | -1  |

LoKi::VoidFilter/SELECT:Phys/StdVeryLooseLambdaLL

|      |                                        |
|------|----------------------------------------|
| Code | 0StdVeryLooseLambdaLL/Particles',True) |

FilterDesktop/Lambda0LLLbLines

|                 |                                                                                                                                                                                      |
|-----------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Code            | (ADMASS('Lambda0')\<20.0\*MeV)&(CHILDCUT((TRCHI2DOF\<3.0),1))&(CHILDCUT((TRCHI2DOF\<3.0),2))&(VFASPF(VCHI2)\<15.0)&(CHILDCUT((TRGHOSTPROB\<0.5),1))&(CHILDCUT((TRGHOSTPROB\<0.5),2)) |
| Inputs          | [ 'Phys/[StdVeryLooseLambdaLL](./stripping21r1p2-commonparticles-stdverylooselambdall)' ]                                                                                          |
| DecayDescriptor | None                                                                                                                                                                                 |
| Output          | Phys/Lambda0LLLbLines/Particles                                                                                                                                                      |

LoKi::VoidFilter/SELECT:Phys/StdNoPIDsPions

|      |                                  |
|------|----------------------------------|
| Code | 0StdNoPIDsPions/Particles',True) |

CombineParticles/Lb2V0hLLLine

|                  |                                                                                                                                         |
|------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| Inputs           | [ 'Phys/Lambda0LLLbLines' , 'Phys/[StdNoPIDsPions](./stripping21r1p2-commonparticles-stdnopidspions)' ]                               |
| DaughtersCuts    | { '' : 'ALL' , 'Lambda0' : 'ALL' , 'Lambda~0' : 'ALL' , 'pi+' : 'TRCHI2DOF\<3.0' , 'pi-' : 'TRCHI2DOF\<3.0' }                           |
| CombinationCut   | (APT\>1000.0\*MeV)&(APT1\>500.0\*MeV)&(ANUM(PT\>800.0\*MeV)\>=2)&(AM\>(5619-800.0)\*MeV)&(AM\<(5619+800.0)\*MeV)&(ACUTDOCACHI2(5.0,'')) |
| MotherCut        | (PT\>800.0\*MeV)&(VFASPF(VCHI2)\<12.0)&(BPVDIRA\>0.995)&(MIPCHI2DV(PRIMARY)\<15.0)&(VFASPF(VMINVDDV(PRIMARY))\>1.0)&(BPVVDCHI2\>30.0)   |
| DecayDescriptor  | None                                                                                                                                    |
| DecayDescriptors | [ 'Lambda_b0 -\> pi- Lambda0' , 'Lambda_b~0 -\> pi+ Lambda~0' ]                                                                       |
| Output           | Phys/Lb2V0hLLLine/Particles                                                                                                             |

AddRelatedInfo/RelatedInfo1_Lb2V0hLLLine

|                 |                                          |
|-----------------|------------------------------------------|
| Inputs          | [ 'Phys/Lb2V0hLLLine' ]                |
| DecayDescriptor | None                                     |
| Output          | Phys/RelatedInfo1_Lb2V0hLLLine/Particles |

AddRelatedInfo/RelatedInfo2_Lb2V0hLLLine

|                 |                                          |
|-----------------|------------------------------------------|
| Inputs          | [ 'Phys/Lb2V0hLLLine' ]                |
| DecayDescriptor | None                                     |
| Output          | Phys/RelatedInfo2_Lb2V0hLLLine/Particles |

AddRelatedInfo/RelatedInfo3_Lb2V0hLLLine

|                 |                                          |
|-----------------|------------------------------------------|
| Inputs          | [ 'Phys/Lb2V0hLLLine' ]                |
| DecayDescriptor | None                                     |
| Output          | Phys/RelatedInfo3_Lb2V0hLLLine/Particles |

AddRelatedInfo/RelatedInfo4_Lb2V0hLLLine

|                 |                                          |
|-----------------|------------------------------------------|
| Inputs          | [ 'Phys/Lb2V0hLLLine' ]                |
| DecayDescriptor | None                                     |
| Output          | Phys/RelatedInfo4_Lb2V0hLLLine/Particles |

AddRelatedInfo/RelatedInfo5_Lb2V0hLLLine

|                 |                                          |
|-----------------|------------------------------------------|
| Inputs          | [ 'Phys/Lb2V0hLLLine' ]                |
| DecayDescriptor | None                                     |
| Output          | Phys/RelatedInfo5_Lb2V0hLLLine/Particles |
