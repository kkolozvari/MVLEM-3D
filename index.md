[K. Kolozvari](mailto:kkolozvari@fullerton.edu), CSU Fullerton<br/>
K. Kalbasi, UCLA<br/>
K. Orakcal, Bogazici University<br/>
L. M. Massone, University of Chile, Santiago<br/>
J. W. Wallace, UCLA<br/>

## Description

The SFI-MVLEM-3D model is an extension of the two-dimensional, two-node Shear-Flexure-Interaction Multiple-Vertical-Line-Element-Model ([SFI-MVLEM](https://opensees.berkeley.edu/wiki/index.php/SFI_MVLEM_-_Cyclic_Shear-Flexure_Interaction_Model_for_RC_Walls)). The baseline SFI-MVLEM, which is essentially a line element for rectangular walls subjected to in-plane loading, is extended in this study to a three-dimensional model formulation by applying geometric transformation of the element degrees of freedom that convert it into a four-node element formulation, as well as by incorporating linear elastic out-of-plane behavior based on the Kirchhoff plate theory. 

### SFI-MVLEM-3D Input
```markdown
element SFI-MVLEM-3D eleTag iNode jNode kNode lNode m  -thick {Thicknesses} -width {Widths} -mat {Material_tags} 
<-CoR c> <-thickMod tMod> <-Poisson Nu>
```

| parameter | description |
|----------|------------|
| eleTag | unique element tag|
| iNode jNode kNode lNode | tags of element nodes defined in counterclockwise direction|
| m | number of element macro-fibers|
| {Thicknesses} | array of m macro-fiber thicknesses|
| {Widths} | array of m macro-fiber widths |
| {Material_tags}| array of m macro-fiber nDMaterial [FSAM](https://opensees.berkeley.edu/wiki/index.php/FSAM_-_2D_RC_Panel_Constitutive_Behavior) tags|
| c | location of center of rotation from the base (optional, default = 0.4 (recommended))|
| tMod	| thickness modifier for out-of-plane bending (optional, default = 1.0)|
| Nu | Poisson ratio for out-of-plane bending (optional, default = 0.25)|

![Model_Formulation](https://user-images.githubusercontent.com/53920372/94061362-21147080-fd9a-11ea-8a73-f325dc96206a.JPG)
**Figure 1: SFI-MVLEM-3D Element Formulation**

## Example

Specimen TUB (Beyer et al. 2008) is analyzed using the SFI-MVLEM-3D.

![TUB](https://user-images.githubusercontent.com/53920372/94061732-a009a900-fd9a-11ea-8d28-2ae4981326f6.JPG)
**Figure 2: SFI-MVLEM-3D Model of specimen TUB**

## References

K. Kolozvari, K. Kalbasi, K. Orakcal, L. M. Massone & J. W. Wallace (2019), "Shear–flexure-interaction models for planar and flanged reinforced concrete walls", Bulletin of Eathquake Engineering, 17, pages 6391–6417. [link](https://link.springer.com/article/10.1007/s10518-019-00658-5)
