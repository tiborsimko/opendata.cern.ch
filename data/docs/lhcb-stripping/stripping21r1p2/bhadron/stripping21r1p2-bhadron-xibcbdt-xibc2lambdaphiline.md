[[stripping21r1p2 lines]](./stripping21r1p2-index)

# StrippingXibcBDT_Xibc2LambdaPhiLine

## Properties:

|                |                                           |
|----------------|-------------------------------------------|
| OutputLocation | Phys/XibcBDT_Xibc2LambdaPhiLine/Particles |
| Postscale      | 1.0000000                                 |
| HLT1           | None                                      |
| HLT2           | None                                      |
| Prescale       | 1.0000000                                 |
| L0DU           | None                                      |
| ODIN           | None                                      |

## Filter sequence:

LoKi::VoidFilter/StrippingGoodEventConditionBhadron

|      |                                                                                                |
|------|------------------------------------------------------------------------------------------------|
| Code | ALG_EXECUTED('StrippingStreamBhadronBadEvent') & ~ALG_PASSED('StrippingStreamBhadronBadEvent') |

CheckPV/checkPVmin1

|        |     |
|--------|-----|
| MinPVs | 1   |
| MaxPVs | -1  |

GaudiSequencer/MERGED:XibcBDTSelLambda

GaudiSequencer/MERGEDINPUTS:XibcBDTSelLambda

GaudiSequencer/INPUT:XibcBDTSelLambdaDD

LoKi::VoidFilter/SELECT:Phys/StdLooseLambdaDD

|      |                                    |
|------|------------------------------------|
| Code | 0StdLooseLambdaDD/Particles',True) |

FilterDesktop/XibcBDTSelLambdaDD

|                 |                                                                                     |
|-----------------|-------------------------------------------------------------------------------------|
| Code            | (ADMASS('Lambda0') \< 30.\*MeV) & (BPVVDCHI2\>25)                                   |
| Inputs          | [ 'Phys/[StdLooseLambdaDD](./stripping21r1p2-commonparticles-stdlooselambdadd)' ] |
| DecayDescriptor | None                                                                                |
| Output          | Phys/XibcBDTSelLambdaDD/Particles                                                   |

|                    |       |
|--------------------|-------|
| ModeOR             | False |
| IgnoreFilterPassed | False |

GaudiSequencer/INPUT:XibcBDTSelLambdaLL

LoKi::VoidFilter/SELECT:Phys/StdAllLooseANNProtons

|      |                                         |
|------|-----------------------------------------|
| Code | 0StdAllLooseANNProtons/Particles',True) |

FilterDesktop/XibcBDTSelProtons

|                 |                                                                                               |
|-----------------|-----------------------------------------------------------------------------------------------|
| Code            | (PROBNNp\> 0.05) & (PT\>300\*MeV) & (TRGHOSTPROB\<0.4) & (MIPCHI2DV(PRIMARY)\>1.)             |
| Inputs          | [ 'Phys/[StdAllLooseANNProtons](./stripping21r1p2-commonparticles-stdalllooseannprotons)' ] |
| DecayDescriptor | None                                                                                          |
| Output          | Phys/XibcBDTSelProtons/Particles                                                              |

LoKi::VoidFilter/SELECT:Phys/StdAllLooseANNPions

|      |                                       |
|------|---------------------------------------|
| Code | 0StdAllLooseANNPions/Particles',True) |

FilterDesktop/XibcBDTSelPions4LP

|                 |                                                                                           |
|-----------------|-------------------------------------------------------------------------------------------|
| Code            | (PROBNNpi\> 0.2) & (PT\>100\*MeV) & (TRGHOSTPROB\<0.4) & (MIPCHI2DV(PRIMARY)\>9.)         |
| Inputs          | [ 'Phys/[StdAllLooseANNPions](./stripping21r1p2-commonparticles-stdalllooseannpions)' ] |
| DecayDescriptor | None                                                                                      |
| Output          | Phys/XibcBDTSelPions4LP/Particles                                                         |

CombineParticles/XibcBDTSelLambdaLL

|                  |                                                                               |
|------------------|-------------------------------------------------------------------------------|
| Inputs           | [ 'Phys/XibcBDTSelPions4LP' , 'Phys/XibcBDTSelProtons' ]                    |
| DaughtersCuts    | { '' : 'ALL' , 'p+' : 'ALL' , 'pi+' : 'ALL' , 'pi-' : 'ALL' , 'p~-' : 'ALL' } |
| CombinationCut   | (ADAMASS('Lambda0')\<50\*MeV) & (ADOCACHI2CUT(30, ''))                        |
| MotherCut        | (ADMASS('Lambda0') \< 30.\*MeV) & (BPVVDCHI2\>25) & (VFASPF(VCHI2) \< 25.)    |
| DecayDescriptor  | [Lambda0 -\> p+ pi-]cc                                                      |
| DecayDescriptors | [ '[Lambda0 -\> p+ pi-]cc' ]                                              |
| Output           | Phys/XibcBDTSelLambdaLL/Particles                                             |

|                    |       |
|--------------------|-------|
| ModeOR             | False |
| IgnoreFilterPassed | False |

|                    |       |
|--------------------|-------|
| ModeOR             | True  |
| IgnoreFilterPassed | False |

FilterDesktop/XibcBDTSelLambda

|                 |                                                             |
|-----------------|-------------------------------------------------------------|
| Code            | ALL                                                         |
| Inputs          | [ 'Phys/XibcBDTSelLambdaDD' , 'Phys/XibcBDTSelLambdaLL' ] |
| DecayDescriptor | None                                                        |
| Output          | Phys/XibcBDTSelLambda/Particles                             |

|                    |       |
|--------------------|-------|
| ModeOR             | False |
| IgnoreFilterPassed | False |

LoKi::VoidFilter/SELECT:Phys/StdLoosePhi2KK

|      |                                  |
|------|----------------------------------|
| Code | 0StdLoosePhi2KK/Particles',True) |

FilterDesktop/XibcBDTSelPhi

|                 |                                                                                                                                                                                                              |
|-----------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Code            | (HASVERTEX) & (VFASPF(VCHI2)\<16) & (MM\<1.05\*GeV) & (MIPCHI2DV(PRIMARY)\>2.) & (INTREE( (ID=='K+') & (PT\>200\*MeV) & (TRGHOSTPROB\<0.4) )) & (INTREE( (ID=='K-') & (PT\>200\*MeV) & (TRGHOSTPROB\<0.4) )) |
| Inputs          | [ 'Phys/[StdLoosePhi2KK](./stripping21r1p2-commonparticles-stdloosephi2kk)' ]                                                                                                                              |
| DecayDescriptor | None                                                                                                                                                                                                         |
| Output          | Phys/XibcBDTSelPhi/Particles                                                                                                                                                                                 |

CombineParticles/XibcBDTSelXibc2LambdaPhi

|                  |                                                                               |
|------------------|-------------------------------------------------------------------------------|
| Inputs           | [ 'Phys/XibcBDTSelLambda' , 'Phys/XibcBDTSelPhi' ]                          |
| DaughtersCuts    | { '' : 'ALL' , 'Lambda0' : 'ALL' , 'Lambda~0' : 'ALL' , 'phi(1020)' : 'ALL' } |
| CombinationCut   | (AM\>4.8\*GeV)                                                                |
| MotherCut        | (M\>5.0\*GeV) & (VFASPF(VCHI2/VDOF) \< 25.) & (BPVIPCHI2()\<25)               |
| DecayDescriptor  | [ Xi_bc0 -\> Lambda0 phi(1020) ]cc                                          |
| DecayDescriptors | [ '[ Xi_bc0 -\> Lambda0 phi(1020) ]cc' ]                                  |
| Output           | Phys/XibcBDTSelXibc2LambdaPhi/Particles                                       |

FilterDesktop/XibcBDT_Xibc2LambdaPhiLine

|                 |                                                                 |
|-----------------|-----------------------------------------------------------------|
| Code            | VALUE('LoKi::Hybrid::DictValue/XibcBDTMvaXibc2LambdaPhi')\>-0.1 |
| Inputs          | [ 'Phys/XibcBDTSelXibc2LambdaPhi' ]                           |
| DecayDescriptor | None                                                            |
| Output          | Phys/XibcBDT_Xibc2LambdaPhiLine/Particles                       |
