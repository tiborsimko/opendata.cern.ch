[[stripping21 lines]](./stripping21-index)

# StdLoosePi02gee

**CombineParticles/StdLoosePi02gee**

|                  |                                                                                                                                                                                                                                                                               |
|------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Inputs           | ['Phys/[StdLooseAllPhotons](./stripping21-commonparticles-stdlooseallphotons)/Particles', 'Phys/[StdAllLooseGammaLL](./stripping21-commonparticles-stdallloosegammall)/Particles', 'Phys/[StdAllLooseGammaDD](./stripping21-commonparticles-stdallloosegammadd)/Particles'] |
| DaughtersCuts    | {}                                                                                                                                                                                                                                                                            |
| CombinationCut   | ATRUE                                                                                                                                                                                                                                                                         |
| MotherCut        | (MM \< 170\*MeV) & (MM \> 90\*MeV) & (1 == CHILD(1,cnv)+CHILD(2,cnv) )                                                                                                                                                                                                        |
| DecayDescriptor  | pi0 -\> gamma gamma                                                                                                                                                                                                                                                           |
| DecayDescriptors | []                                                                                                                                                                                                                                                                          |
| Output           | None                                                                                                                                                                                                                                                                          |
