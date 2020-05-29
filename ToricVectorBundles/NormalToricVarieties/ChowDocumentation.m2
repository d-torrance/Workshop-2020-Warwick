------------------------------------------------------------------------------
-- Chow and Chern (Documentation)
------------------------------------------------------------------------------
doc ///
    Key
	"Chow ring"    
        (intersectionRing, NormalToricVariety, AbstractVariety)
        (intersectionRing, NormalToricVariety)
    Headline
        make the rational Chow ring 
    Usage 
        intersectionRing (X, B)
	intersectionRing X
    Inputs 
        X : NormalToricVariety
	    that is complete and simplicial
	B : AbstractVariety
	    the base variety, when omitted the 
	    @TO2( "Schubert2::point", "default base variety of dimension 0")@ is used 
    Outputs 
        : Ring 
	    the rational Chow ring of {\tt X} over {\tt B}
    Description
        Text    
            The rational Chow ring of a variety $X$ is an associative
            commutative ring graded by codimension.  The $k$-th graded
            component of this ring is the rational vector space spanned by the
            rational equivalence classes of subvarieties in $X$ having
            codimension $k$.  For generically transverse subvarieties $Y$ and
            $Z$ in $X$, the product satisfies $[Y][Z] = [Y \cap Z]$.
        Text 
	    For a complete simplicial normal toric variety, the rational Chow
	    ring has an explicit presentation.  Specifically, it is the
	    quotient of the polynomial ring with variables indexed by the set
	    of rays in the underlying fan by the sum of two ideals.  The first
	    ideal is the Stanley-Reisner ideal of the fan (equivalently
	    the Alexander dual of the 
	    @TO2( (ideal, NormalToricVariety), "irrelevant ideal")@) 
	    and the second ideal is generated by linear forms that encode
	    the @TO(rays, NormalToricVariety)@ in the fan.  In this context,
	    the rational Chow ring is isomorphic to the rational cohomology of
	    $X$.
	Text
	    The rational Chow ring of projective space is generated by the
	    rational equivalence class of a hyperplane.
	Example
	    PP3 = toricProjectiveSpace 3;
	    A0 = intersectionRing PP3
	    assert (# rays PP3 === numgens A0)	    
	    ideal A0
	    dual monomialIdeal PP3 + ideal ((vars ring PP3) * matrix rays PP3)
	    minimalPresentation A0
	    for i to dim PP3 list hilbertFunction (i, A0)
	Text
	    The rational Chow ring for the product of two projective spaces is
	    the tensor product of the rational Chow rings of the factors.
	Example
	    X = toricProjectiveSpace (2) ** toricProjectiveSpace (3);
	    A1 = intersectionRing X
	    assert (# rays X === numgens A1)	    
	    ideal A1
	    minimalPresentation A1
	    for i to dim X list hilbertFunction (i, A1)	    	  
	Text
            We end with a slightly larger example.
	Example
	    Y = time smoothFanoToricVariety(5,100);
	    A2 = intersectionRing Y;
	    assert (# rays Y === numgens A2)	    
            ideal A2
	    minimalPresentation A2
	    for i to dim Y list time hilbertFunction (i, A2)
    SeeAlso
        "working with sheaves"    
	(abstractVariety, NormalToricVariety)        	    
///	


doc ///
    Key
        (abstractVariety, NormalToricVariety, AbstractVariety)
        (abstractVariety, NormalToricVariety)
    Headline
        make the corresponding abstract variety
    Usage 
        abstractVariety (X, B)
    Inputs 
        X : NormalToricVariety
	    that is complete and simplicial
	B : AbstractVariety
	    the base variety, when omitted the 
	    @TO2( "Schubert2::point", "default base variety of dimension 0")@ is used
	ReturnType => 
	    this option is ignored by this method
	DefaultIntegral => 
	    this option is ignored by this method
    Outputs 
        : AbstractVariety 
	    determined by the @TO2( (dim, NormalToricVariety), "dimension")@ of
	    {\tt X} and its @TO2( (intersectionRing, NormalToricVariety),
	    "rational Chow ring")@
    Description
        Text  	    
	    This method converts a @TO NormalToricVariety@ into an 
	    @TO "Schubert2::AbstractVariety"@, as defined in the @TO Schubert2@
	    package.
	Text
	    Since many routines from the @TO Schubert2@ package have been
	    overloaded so that they apply directly to normal toric varieties,
	    this method is primarily of interest to developers.
	Text
	    Projective space can be constructed as an AbstractVariety in a few
	    equivalent, but not identical, ways.
	Example
	    tPP2 = toricProjectiveSpace 2;
	    aPP2 = abstractVariety tPP2 
	    assert (dim tPP2 === dim aPP2)
	    intersectionRing aPP2 
	    intersectionRing tPP2
	    intersectionRing abstractVariety (tPP2, base())
	    intersectionRing abstractVariety (tPP2, base(a))
	    PP2 = toricProjectiveSpace 2
	    intersectionRing PP2
	    minimalPresentation intersectionRing PP2
	    minimalPresentation intersectionRing tPP2
    SeeAlso
        "working with sheaves"
	(intersectionRing, NormalToricVariety)
	(abstractSheaf, NormalToricVariety, CoherentSheaf) 
	base        	
///


doc ///
    Key
        (abstractSheaf, NormalToricVariety, AbstractVariety, CoherentSheaf)
        (abstractSheaf, NormalToricVariety, CoherentSheaf)    
    Headline
        make the corresponding abstract sheaf
    Usage 
        abstractSheaf (X, B, F)
    Inputs 
        X : NormalToricVariety
	    that is complete and simplicial
	B : AbstractVariety
	    the base variety, when omitted the 
	    @TO2( "Schubert2::point", "default base variety of dimension 0")@ is used
	F : CoherentSheaf
	    on {\tt X}
	Rank => 
	    this option is ignored by this method
	ChernCharacter => 
	    this option is ignored by this method
	ChernClass => 
	    this option is ignored by this method	
	Name => 
	    this option is ignored by this method		
    Outputs 
        : AbstractSheaf 
    Description
        Text  
	    This method converts a @TO CoherentSheaf@ over a 
	    @TO NormalToricVariety@ into an @TO "Schubert2::AbstractSheaf"@
	    over the corresponding @TO "Schubert2::AbstractVariety"@, as
	    defined in the @TO Schubert2@ package.
	Text
	    Since many routines from the @TO Schubert2@ package have been
	    overloaded so that they apply directly to coherent sheaves on
	    normal toric varieties, this method is primarily of interest to
	    developers. 
	Text
	    We illustrate this methods with some classic coherent sheaves on
	    projective 3-space.
	Example
	    PP3 = toricProjectiveSpace 3;
	    F = OO_PP3 (2) ++ OO_PP3 (5);
	    aF = abstractSheaf (PP3, F);
	    chern aF
	    assert (chern aF === chern (OO_PP3 (2)) * chern (OO_PP3 (5)))
	    assert (chern aF == chern F)
            Omega = cotangentSheaf PP3;
	    aOmega = abstractSheaf (PP3, Omega);
	    chern aOmega
	    assert (aOmega === cotangentBundle abstractVariety PP3)
	Text
	    We also provide a similar collection of examples on a larger
	    variety.
	Example
	    X = smoothFanoToricVariety (5, 100);
	    rank picardGroup X
	    nefGenerators X
	    G = OO_X (1,1,-1,1,1,2) ++ OO_X (1,1,-1,0,0,1);
	    aG = abstractSheaf (X, G);
	    A = intersectionRing variety aG;
	    chern aG
	    assert (chern aG === chern (OO_X (1,1,-1,1,1,2)) * chern (OO_X (1,1,-1,0,0,1)))
	    assert (chern aG == chern G)
            Omega = cotangentSheaf X;
	    aOmega = abstractSheaf (X, Omega);
	    chern aOmega
	    assert (aOmega === cotangentBundle abstractVariety X)		    
    SeeAlso
        "working with sheaves"
	(abstractSheaf, NormalToricVariety, ToricDivisor)    	
	(abstractVariety, NormalToricVariety)        	   	    
///
    
    
doc ///
    Key    
        (abstractSheaf, NormalToricVariety, AbstractVariety, ToricDivisor)
    	(abstractSheaf, NormalToricVariety, ToricDivisor)
    Headline
        make the corresponding abstract sheaf
    Usage 
        abstractVariety (X, B, D)
    Inputs 
        X : NormalToricVariety
	    that is complete and simplicial
	B : AbstractVariety
	    the base variety, when omitted the 
	    @TO2( "Schubert2::point", "default base variety of dimension 0")@ is used 
	D : ToricDivisor
	    on {\tt X}
	Rank => 
	    this option is ignored by this method
	ChernCharacter => 
	    this option is ignored by this method
	ChernClass => 
	    this option is ignored by this method	
	Name => 
	    this option is ignored by this method		
    Outputs 
        : AbstractSheaf 
    Description
        Text  
	    This method converts a @TO ToricDivisor@ on a 
	    @TO NormalToricVariety@ into an @TO "Schubert2::AbstractSheaf"@
	    over the corresponding @TO "Schubert2::AbstractVariety"@, as
	    defined in the @TO Schubert2@ package.	
	Text
	    Since many routines from the @TO Schubert2@ package have been
	    overloaded so that they apply directly to toric divisors, this
	    method is primarily of interest to developers.
	Example
	    PP2 = toricProjectiveSpace 3;
	    D1 = abstractSheaf (PP2, PP2_0);
	    assert (rank D1 === 1 and variety D1 === abstractVariety PP2)
    	    chern D1
	    ch D1
	    D2 = abstractSheaf (PP2, PP2_1);
	    assert (D2 === D1)
	Example       
	    FF2 = hirzebruchSurface 2
	    D3 = abstractSheaf (FF2, 2*FF2_2 + FF2_3)
	    assert (rank D3 === 1 and variety D3 === abstractVariety FF2)
	    chern D3
	    D4 = abstractSheaf (FF2, 4*FF2_0 + FF2_1)
	    assert (D4 === D3)
    SeeAlso
        "working with sheaves"
	(abstractSheaf, NormalToricVariety, CoherentSheaf)    	
	(abstractVariety, NormalToricVariety)    
///


doc ///
    Key    
        (chern, ZZ, CoherentSheaf)
        (chern, CoherentSheaf)
    Headline
        compute the Chern class of a coherent sheaf
    Usage 
        chern (i, F)
    Inputs 
        i : ZZ
	    that determines a component of the Chern class (optional)
        F : CoherentSheaf
	    on a complete simplicial normal toric variety
    Outputs 
        : RingElement
	    in the intersection ring of the underlying variety
    Description
        Text
	    The total Chern class of a coherent sheaf {\tt F} on a variety
	    {\tt X} is defined axiomatically by an element {\tt chern F} in
	    the @TO "Chow ring"@ of {\tt X} such that the following three
	    conditions hold:
	Text
	    @UL {
		{"For any morphism ", TT "f : X -> Y", ", we have ", 
		  TT "chern f^*(F) == f^*(chern F)", "."},
	        {"For each exact sequence ", TT "0 -> F' -> F -> F'' -> 0",
		 ", we have ", TT "chern F == (chern F') * (chern F'')", "."},
	        {"For any divisor ", TT "D", " on ", TT "X", ", we have ",
		  TT "chern OO_X (D) == 1 + [D]", " where ", TT "[D]", 
		 " denotes the divisor class in ", TT "picardGroup X",
		 " and we identify the Picard group of ", TT "X", " with
		   the graded component of the intersection ring having
		   codimenion 1."}
	    }@
	Text
	    The {\tt i}-th component of {\tt chern F} is {\tt chern (i, F)},
	    so we obtain {\tt chern F == chern (0, F) + chern (1, F) + ... +
	    chern (dim X, F)}.	    
        Text  
	    The total Chern class for the tangent bundle on projective space
	    is particularly simple; the coefficient of {\tt i}-th component is
	    a binomial coefficient.	    
	Example
	    d = 3;
	    PPd = toricProjectiveSpace d;
	    A0 = intersectionRing PPd;
	    TP = dual cotangentSheaf PPd
	    f0 = chern TP
    	    assert (A0 === ring f0)
	    assert (f0 === (1+A0_0)^(d+1))
	    assert all(d, i -> leadCoefficient chern (i, TP) == binomial(d+1,i))
	    assert (chern TP === sum (d+1, i -> chern (i, TP)))
        Text 
	    On a complete smooth normal toric variety, the total Chern class
	    of the cotangent sheaf is a product over the torus-invariant
	    divisors of the total Chern classes of the inverse of the
	    corresponding line bundles.
	Example       
	    X = smoothFanoToricVariety (4, 50);
	    A = intersectionRing X;
	    Omega = cotangentSheaf X
    	    f1 = chern Omega
	    assert (f1 ===  product (# rays X, i -> chern OO (-X_i)))
	    f3 = chern (2, Omega)
	    assert (f3 == sum (orbits (X, 2), s -> product (s, i -> A_i)))
    SeeAlso
        "working with sheaves"
	(intersectionRing, NormalToricVariety)    	
///


doc ///
    Key    
        (ctop, CoherentSheaf)
    Headline
        compute the top Chern class of a coherent sheaf
    Usage 
        ctop F
    Inputs 
        F : CoherentSheaf
	    on a complete simplicial normal toric variety
    Outputs 
        : RingElement
	    in the intersection ring of the underlying variety
    Description
        Text
	    For a coherent sheaf {\tt F} on a variety {\tt X}, the top Chern
	    class is {\tt chern (dim X, F)}.
        Text  
	    On projective space, the coefficient of the top Chern class of the
	    tangent bundle is the 1 plus dimension of the variety.
	Example
	    X0 = toricProjectiveSpace 5;
	    A0 = intersectionRing X0;
	    ctop dual cotangentSheaf X0
	    assert all (5, d -> (leadCoefficient ctop dual cotangentSheaf toricProjectiveSpace (d+1)) == d+2)
	    assert all (5, d -> (
		    F := dual cotangentSheaf toricProjectiveSpace (d+1);
		    chern (d+1, F) === ctop F
		    )
		)
        Text 
	    On a complete smooth normal toric variety, the top Chern class is
	    a sum of the classes corresponding to maximal cones in the
	    underlying fan.
	Example       
	    X1 = smoothFanoToricVariety (4, 50);
	    A1 = intersectionRing X1;
	    E1 = cotangentSheaf X1
	    f1 = ctop E1
	    assert (f1 === sum(max X1, s -> product(s, i -> -A1_i)))
	    assert (f1 === chern (dim X1, E1))
    SeeAlso
        "working with sheaves"
	(chern, CoherentSheaf)    		
	(intersectionRing, NormalToricVariety)    	
///


doc ///
    Key    
        (ch, ZZ, CoherentSheaf)    
        (ch, CoherentSheaf)
    Headline
        compute the Chern character of a coherent sheaf
    Usage 
        ch (i, F)
    Inputs 
        i : ZZ
	    that determines a component of the Chern character (optional)    
        F : CoherentSheaf
	    on a complete simplicial normal toric variety
    Outputs 
        : RingElement
	    in the intersection ring of the underlying variety
    Description
        Text
	    Given a locally-free sheaf $E$ of rank $r$ on a smooth
	    variety such that its Chern class formally factor as
	    {\tt chern} $E = \prod_{j=1}^r (1 + \alpha_j)$,
	    we define its Chern character to be 
	    {\tt ch} $E := \sum_{j=1}^r exp(\alpha_j)$.
	    The $i$-th graded piece of this power series is symmetric in the
	    $\alpha_j$ and, hence, expressible as a polynomial in the
	    elementary symmetric polynomials in the $\alpha_j$; we set 
	    {\tt ch} $(i, E)$ to be this polynomial.  
	    Because the Chern character is additive on exact sequences of
	    vector bundles and every coherent sheaf can be resolved by
	    locally-free sheaves, we can extend this definition to all
	    coherent sheaves.
	Text
	    The first few components of the Chern character are easily related
	    to other invariants.
	Example
	    X0 = kleinschmidt(4, {1,2,3});
	    E0 = cotangentSheaf X0
	    A0 = intersectionRing X0;
	    ch E0
	    assert (ch (0, E0) == rank E0 )
	    assert (ch (1, E0) === chern (1, E0))
	    assert (ch (2, E0) === (1/2)*((chern (1, E0))^2 - 2 * chern (2, E0)))	
        Text  
	    On a complete smooth normal toric variety, the Chern class of the
	    cotangent bundle factors as a product over the irreducible
	    torus-invariant divisors, so we can express the Chern character as
	    a sum.
	Example
	    X1 = smoothFanoToricVariety (4, 100);
	    E1 = dual cotangentSheaf X1
	    A1 = intersectionRing X1;
	    f1 = ch E1
	    n = # rays X1
	    assert (f1 === (sum(n, i -> ch OO (X1_i)) - (n - dim X1)))
    SeeAlso
        "working with sheaves"
	(chern, CoherentSheaf)    		
	(intersectionRing, NormalToricVariety)    	
///


doc ///
    Key    
        (todd, CoherentSheaf)
	(todd, NormalToricVariety)
    Headline
        compute the Todd class of a coherent sheaf
    Usage 
        todd F
    Inputs 
        F : CoherentSheaf
	    on a complete simplicial normal toric variety
    Outputs 
        : RingElement
	    in the intersection ring of the underlying variety	   
    Description
        Text
	    Given a locally-free sheaf $E$ of rank $r$ on a smooth
	    variety such that its Chern class formally factor as
	    {\tt chern} $E = \prod_{j=1}^r (1 + \alpha_j)$,
	    we define its Todd class to be 
	    {\tt todd} $E := \prod_{j=1}^r \alpha_j / [1- exp(-\alpha_j)]$
	    written as a polynomial in the elementary symmetric functions
	    {\tt chern} $(i, E)$ of the $\alpha_j$.
	Text
	    The first few components of the Todd class are easily related
	    to Chern classes.
	Example
	    X0 = kleinschmidt(4, {1,3,5});
	    E0 = cotangentSheaf X0
	    A0 = intersectionRing X0;
	    todd E0
	    assert (part (0, todd E0) == 1)
	    assert (part (1, todd E0) === (1/2) * chern (1, E0))
	    assert (part (2, todd E0) === (1/12)*((chern (1, E0))^2 + chern (2, E0)))	
        Text  
	    On a complete smooth normal toric variety, the Todd class of the
	    tangent bundle factors as a product over the irreducible
	    torus-invariant divisors.
	Example
	    X1 = smoothFanoToricVariety (3, 12);
	    E1 = dual cotangentSheaf X1
	    A1 = intersectionRing X1;
	    f1 = todd E1
	    assert (f1 === product(# rays X1, i -> todd OO (X1_i)))
	Text
	    Applying {\tt todd} to a normal toric variety is the same as
	    applying it to the tangent sheaf of the variety.
    SeeAlso
        "working with sheaves"
	(chi, CoherentSheaf)	
	(hilbertPolynomial, NormalToricVariety, CoherentSheaf)
	(intersectionRing, NormalToricVariety)   	
///
 

doc ///
    Key    
        (chi, CoherentSheaf)
    Headline
        compute the Euler characteristic of a coherent sheaf
    Usage 
        chi F
    Inputs 
        F : CoherentSheaf
	    on a complete simplicial normal toric variety
    Outputs 
        : RingElement
	    in the coefficient ring of intersection ring of the underlying
	    variety	   
    Description
        Text
	    By definition, the Euler characteristic of coherent sheaf $F$ on a
	    variety $X$ is $\sum_i (-1)^i$ dim $HH^i (X, F)$.  However, this
	    methods uses the Hirzebruch-Riemann-Roch theorem to calculate the
	    Euler characteristic.
        Text 
	    For a nef line bundle on a normal toric variety, the Euler
	    characteristic equals the number of lattice points in the
	    corresponding polytope.	    
	Example
            X0 = hirzebruchSurface 2;
	    degrees ring X0
	    chi OO X0_2
	    latticePoints X0_2
	    assert all ({{1,0},{0,1},{1,1},{2,1},{1,2}}, p -> (
		    D := p#0 * X0_2 + p#1 * X0_3;
		    isNef D and chi OO D == rank source latticePoints D
		    )
		)
	    chi OO (2 * X0_1)
	    assert not isNef (2 * X0_1) 
    SeeAlso
        "working with sheaves"
	(todd, CoherentSheaf)	
	(hilbertPolynomial, NormalToricVariety, CoherentSheaf)
	(intersectionRing, NormalToricVariety)   	
///


doc ///
    Key
        (hilbertPolynomial, NormalToricVariety)
	(hilbertPolynomial, NormalToricVariety, Ring)
	(hilbertPolynomial, NormalToricVariety, SheafOfRings)
    Headline 
        compute the multivariate Hilbert polynomial
    Usage 
        hilbertPolynomial X
    Inputs 
        X : NormalToricVariety
	    that is smooth and complete
	Projective => 
	    this option is ignored
    Outputs 
        : RingElement 
	    the Hilbert polynomial of {\tt X}
    Description
        Text
            The Hilbert polynomial of a smooth projective toric variety $X$ is
    	    the Euler characteristic of $OO_X(i_0,i_1,...,i_r)$ where $r$ is
    	    the rank of the Picard group of $X$ and $i_0,i_1,...,i_r$ are
    	    formal variables.  The Hilbert polynomial agrees with the Hilbert
    	    function when evaluated at any point in the nef cone.
    	Text
            On projective space, one recovers the standard Hilbert polynomial.	    
    	Example  
    	    PP2 = toricProjectiveSpace 2;
	    h0 = hilbertPolynomial PP2
	    factor h0
	    h1 = hilbertPolynomial (ring PP2, Projective => false)
	    assert (h0 === sub(h1, (ring h1)_0 => (ring h0)_0))
	    PP3 = toricProjectiveSpace 3;
	    h2 = hilbertPolynomial PP3
	    factor h2
	    h3 = hilbertPolynomial (ring PP3, Projective => false)
	    assert (h2 === sub(h3, (ring h3)_0 => (ring h2)_0))
	Text
	    The Hilbert polynomial of a product of normal toric varieties is
	    simply the product of the Hilbert polynomials of the factors.	    
	Example
            X = toricProjectiveSpace (2) ** toricProjectiveSpace (3);
	    h3 = hilbertPolynomial X
	    factor h3
	Text
	    Example 2.9 in [Diane Maclagan and Gregory G. Smith,
	    @HREF("http://arxiv.org/abs/math.AC/0305215", 
		"Uniform bounds on multigraded regularity")@, 
	    {\it J. Algebraic Geom.} {\bf 14} (2005), 137-164] describes the
	    Hilbert polynomials on a Hirzebruch surface.	    
    	Example
	    a = random (9)
	    FFa = hirzebruchSurface a;
	    h4 = hilbertPolynomial FFa
	    R = ring h4;
	    assert (h4 == R_0 * R_1 + (a/2)*R_1^2 + R_0 + ((a+2)/2)*R_1 + 1)
	Text
	    The Hilbert polynomial is computed using the
	    Hirzebruch-Riemann-Roch Theorem.  In particular, this method
	    depends on the @TO Schubert2@ package.
    SeeAlso
        "working with sheaves"    
	(hilbertPolynomial, NormalToricVariety, CoherentSheaf)
        (isSmooth, NormalToricVariety)
///   


doc ///
    Key
        (hilbertPolynomial, NormalToricVariety, CoherentSheaf)
	(hilbertPolynomial, NormalToricVariety, Module)
	(hilbertPolynomial, NormalToricVariety, Ideal)
    Headline 
        compute the multivariate Hilbert polynomial
    Usage 
        hilbertPolynomial (X, F)
    Inputs 
        X : NormalToricVariety
	    that is smooth and complete
	F : CoherentSheaf
	    on {\tt X}
	Projective => 
	    this option is ignored
    Outputs 
        : RingElement 
	    the Hilbert polynomial of {\tt X}
    Description
        Text
            The Hilbert polynomial of a coherent sheaf $F$ on smooth normal
    	    toric variety $X$ is the Euler characteristic of $F **
    	    OO_X(i_0,i_1,...,i_r)$ where $r$ is the rank of the Picard group
    	    of $X$ and $i_0,i_1,...,i_r$ are formal variables.  The Hilbert
    	    polynomial agrees with the Hilbert function when evaluated at any
    	    point sufficiently far in the interior of in the nef cone.
	Text
	    For a graded module over the total coordinate ring of $X$, this
	    method computes the Hilbert polynomial of the corresponding
	    coherent sheaf.  Given an ideal $I$ in the total coordinate ring,
	    it computes the Hilbert polynomial of the coherent sheaf
	    assoicated to $S^1/I$.
    	Text
            The cotangent bundle on a smooth surface provides simple examples.
    	Example  
    	    PP2 = toricProjectiveSpace 2;
	    OmegaPP2 = cotangentSheaf PP2
	    h0 = hilbertPolynomial (PP2, OmegaPP2)
	    for i to 10 list hilbertFunction(i, module OmegaPP2)
	    R = ring h0;
	    for i to 10 list sub(h0, R_0 => i)
    	Example  
    	    FF3 = hirzebruchSurface 3;
	    OmegaFF3 = cotangentSheaf FF3
	    h1 = hilbertPolynomial (FF3, OmegaFF3)
	    matrix table(5,5, (i,j) -> hilbertFunction({j,4-i}, module OmegaFF3))
	    R = ring h1;
	    matrix table(5,5, (i,j) -> sub(h1, {R_0 => j, R_1 => 4-i}))
	Text
	    Example 2.16 in [Diane Maclagan, Gregory G. Smith, 
	    @HREF("http://arxiv.org/abs/math.AC/0305215", 
		"Uniform bounds on multigraded regularity")@, 
	    {\it J. Algebraic Geom.} {\bf 14} (2005), 137-164] shows that the
	    Hilbert function for a set of points agrees with the Hilbert
	    polynomial precisedly on the multigraded regularity.
    	Example
            X = toricProjectiveSpace (1) ** toricProjectiveSpace (1);
	    S = ring X;
	    I = intersect (ideal (S_1-S_0, S_3-S_2), ideal (S_1-S_0, S_3-2*S_2), ideal (S_1-2*S_0, S_3-S_2), ideal (S_1-2*S_0, S_3-2*S_2), ideal (S_1-3*S_0, S_3-3*S_2), ideal (S_1-4*S_0, S_3-4*S_2))
	    assert (I == saturate (I, ideal X))
	    hilbertPolynomial (X, I)
	    matrix table(5,5, (i,j) -> hilbertFunction({j,4-i}, I))
    SeeAlso
        "working with sheaves"    
	(hilbertPolynomial, NormalToricVariety)
        (isSmooth, NormalToricVariety)
///   

